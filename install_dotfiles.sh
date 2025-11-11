#!/usr/bin/env bash
set -e

README="$HOME/.dotfiles/README.md"

# --- Helper functions ---
is_installed() {
  command -v "$1" >/dev/null 2>&1
}

install_pacman() {
  echo "🔹 Checking Pacman packages..."
  local pkgs
  pkgs=$(grep -A999 "### Pacman packages" "$README" | grep -B999 "### Yay" | grep -v "###" | sed '/^$/d' | sed '/```/d')
  local to_install=()

  for pkg in $pkgs; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
      to_install+=("$pkg")
    fi
  done

  if [ ${#to_install[@]} -eq 0 ]; then
    echo "✅ All Pacman packages are already installed."
  else
    echo "📦 Installing ${#to_install[@]} missing Pacman packages..."
    sudo pacman -S --needed --noconfirm "${to_install[@]}"
  fi
}

install_yay() {
  echo "🔹 Checking Yay (AUR) packages..."
  local pkgs
  pkgs=$(grep -A999 "### Yay" "$README" | grep -B999 "### Flatpak" | grep -v "###" | sed '/^$/d' | sed '/```/d')
  local to_install=()

  for pkg in $pkgs; do
    if ! pacman -Qi "$pkg" &>/dev/null && ! yay -Qi "$pkg" &>/dev/null; then
      to_install+=("$pkg")
    fi
  done

  if [ ${#to_install[@]} -eq 0 ]; then
    echo "✅ All AUR packages are already installed."
  else
    echo "📦 Installing ${#to_install[@]} missing AUR packages..."
    yay -S --needed --noconfirm "${to_install[@]}"
  fi
}

install_flatpak() {
  echo "🔹 Checking Flatpak packages..."
  local pkgs
  pkgs=$(grep -A999 "### Flatpak packages" "$README" | sed '/^$/d' | sed '/```/d' | sed '/###/d')
  local to_install=()

  for pkg in $pkgs; do
    if ! flatpak info "$pkg" &>/dev/null; then
      to_install+=("$pkg")
    fi
  done

  if [ ${#to_install[@]} -eq 0 ]; then
    echo "✅ All Flatpak packages are already installed."
  else
    echo "📦 Installing ${#to_install[@]} missing Flatpak packages..."
    flatpak install -y "${to_install[@]}"
  fi
}

make_local_bin_executable() {
  echo "🔹 Making all files in .local/bin executable..."
  find "$HOME/.dotfiles/.local/bin" -type f -exec chmod +x {} \;
}

sync_dotfiles() {
  echo "🔹 Syncing dotfiles to home directory..."
  rsync -avh --progress "$HOME/.dotfiles/" "$HOME/"
}

# --- Main execution ---
install_pacman
install_yay
install_flatpak
make_local_bin_executable
sync_dotfiles

echo "✅ All done — system packages synced, executables ready, and dotfiles updated!"
