# dots 
This is my personal set of dotfiles built around **Arch Linux** and **Hyprland**

- 🐟 **Fish shell**
- 🐱 **Kitty terminal**
- 🪟 **Hyprland** Wayland compositor
- 🌈 **Wallust** for dynamic theming
- 🔧 Custom configurations and keybindings

These dotfiles help me quickly set up a beautiful, efficient, and keyboard-driven Linux desktop.

## 🚀 Installation

> **Warning:** These configs are tailored to **my setup**. Back up your existing config files before proceeding.

1. Create a Repos folder:
    ```bash
    mkdir Repos
    ```

2. Clone the repository:
    ```bash
    git clone https://github.com/ps-leonardo/dots.git ~/Repos/dots
    ```

3. Run the installer:
    ```bash
    ~/Repos/dots/scripts/install.sh
    ```
    
4. Select the options as prompted by the installer:

     This will:
    - Install yay for AUR Management
    - Download all dependencies
    - Copy the files into `~/.config/`
    - Setup up selected grub theme (yorha or fallout installed yorha-crt)
    - Set up sddm theme

5. Move your wallpapers to ~/.local/share/wallpapers/ and select them with *super+shift+w*
    


## ⚠️ Disclaimer

This setup is customized for **a new Arch Linux install**. You’re welcome to fork and tweak it, but some paths, scripts, and behaviors may not work out-of-the-box for everyone.

## 📜 License

[MIT](LICENSE) — feel free to reuse and modify.
