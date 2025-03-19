# Dotfiles

My personal dotfiles for configuring various tools and environments on Linux.

## 📂 Structure

- `alacritty/` - Configurations for Alacritty terminal.
- `backgrounds/` - Wallpapers and backgrounds.
- `bash/` - Bash shell configurations.
- `cargo_installs.list` - List of installed Cargo packages.
- `completions/` - Shell completions for various tools.
- `gh/` - GitHub CLI configurations.
- `ghostty/` - Configuration for Ghostty terminal emulator.
- `hyprland/` - Hyprland window manager configurations.
- `hyprlock/` - Hyprlock screen locker settings.
- `hyprmocha/` - Custom Hyprland themes and settings.
- `hyprpaper/` - Hyprpaper wallpaper daemon configuration.
- `kitty/` - Configurations for Kitty terminal emulator.
- `lvim/` - LunarVim editor settings.
- `nvim/` - Neovim configurations.
- `pacman_packages.list` - List of installed Pacman packages.
- `screenlayout/` - Display and screen layout scripts.
- `starship/` - Starship prompt configuration.
- `tmux/` - Tmux terminal multiplexer configurations.
- `waybar/` - Waybar status bar configuration.
- `wezterm/` - WezTerm terminal emulator settings.
- `wofi/` - Wofi application launcher configuration.

## 🚀 Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

2. Run the setup script (if applicable) or manually link the dotfiles:
   ```sh
   ln -s ~/.dotfiles/nvim ~/.config/nvim
   ln -s ~/.dotfiles/hyprland ~/.config/hyprland
   # Repeat for other configurations
   ```

## 🛠️ Usage

- Modify the configurations as needed.
- Use a dotfile manager like [`stow`](https://www.gnu.org/software/stow/) to manage symlinks:
  ```sh
  stow nvim
  stow hyprland
  ```
- Keep your dotfiles version-controlled to track changes.

## 📌 Notes

- Ensure you have the required packages installed (e.g., `hyprland`, `waybar`, `tmux`).
- Backup existing configurations before applying these dotfiles.

## 📜 License

This project is licensed under the MIT License.

