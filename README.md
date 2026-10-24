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



## Pop!_OS / COSMIC setup

This checkout uses Home Manager for general packages and GNU Stow for editable
application configuration. COSMIC and system services remain managed by Pop!_OS.

The selected Stow packages are `bash`, `starship`, `completions`, `gh`, and `nvim`.
Preview changes before linking:

```bash
stow --dir="$HOME/.dotfiles" --target="$HOME" --no-folding --simulate --verbose bash starship completions gh nvim
stow --dir="$HOME/.dotfiles" --target="$HOME" --no-folding bash starship completions gh nvim
```

Resolve any existing-file conflicts explicitly. The Bash configuration preserves
Pop!_OS shell defaults, Home Manager session variables, and Bun's Codex path.
`z` opens Zellij; `j` uses zoxide; `y` opens Yazi; `lg` opens Lazygit. Bash uses
vi editing mode. Open a new terminal or run `exec bash` to load changes.

Only Bun, pnpm, Zellij, Gitleaks, and Just completions are linked. The Stow ignore
files exclude other completions and the old hardware helper scripts. Do not
stow the Hyprland, lock-screen, wallpaper-daemon, Waybar, Wofi, Mako, or screen
layout packages on this COSMIC setup. Alacritty is linked separately below.

Neovim retains Lazy's plugin lockfile. Use `:Lazy restore` to restore those
plugin revisions. Mason owns editor-specific servers and formatters, with
installation centralized in `lua/plugins/lsp.lua`; `:MasonToolsInstallSync`
installs the configured tools. Python's `pylsp` runs through `uv tool run`
using the system Python, which avoids needing an extra Python installation or
APT's optional ensurepip package. Terraform integration is disabled. Editor
tool downloads are separate from the Home Manager flake lockfile.

GitHub CLI preferences are linked as a single file. Authentication files remain
local and are ignored by Git. Home Manager continues to manage Git identity.

Validated locally: fresh Bash startup, selected completions, Neovim startup,
Telescope's native fuzzy matcher, completion/snippets, Lua/TypeScript/Python
language-server attachment, TypeScript parsing, Python formatting with Ruff,
and JSON formatting with Prettier. The locked `nvim-colorizer.lua` plugin emits
a non-blocking `vim.tbl_flatten` deprecation warning on Neovim 0.12.


### Alacritty on COSMIC

This machine uses the Cargo-installed terminal at `$HOME/.cargo/bin/alacritty`
(`cargo install alacritty`). Its editable
configuration lives in `alacritty/.config/alacritty/alacritty.toml`; it uses
JetBrainsMono Nerd Font Mono, the existing Nord colors, and 0.88 opacity.
Window decorations and blur are disabled for this COSMIC setup.
The old `.bak` file is excluded from Stow.

After installation and a successful launch, link the terminal and shortcut:

```bash
stow --dir="$HOME/.dotfiles" --target="$HOME" --no-folding alacritty cosmic-shortcuts
```

The `cosmic-shortcuts` package overrides only the `Terminal` system action with
`/home/reed/.cargo/bin/alacritty`, so COSMIC's existing Super+T binding launches
the Cargo version. The desktop launcher uses the same absolute path; adjust
both files when setting up a different home directory. Other system
actions inherit their native defaults. COSMIC Terminal remains installed and
can be launched with `cosmic-term`.


### Ghostty on COSMIC

Ghostty's editable configuration lives in `ghostty/.config/ghostty/config`.
It uses the bundled Catppuccin Mocha theme, JetBrainsMono Nerd Font Mono at
size 12, 0.91 background opacity, and a hidden GTK titlebar.

After installing Ghostty, link its configuration:

```bash
stow --dir="$HOME/.dotfiles" --target="$HOME" --no-folding ghostty
ghostty +validate-config
```

Restart Ghostty to load the settings. The configuration was validated with
Ghostty 1.3.1 and visually checked on COSMIC. This does not change the Super+T
shortcut documented above.

Chafa 1.14.0 needs an explicit graphics format for sharp image output in
Ghostty. Run this directly in Ghostty, outside a terminal multiplexer:

```bash
chafa --format=kitty /path/to/image.png
```

Keep this option specific to Ghostty rather than setting a global Chafa alias,
since other terminals may require a different graphics format.
