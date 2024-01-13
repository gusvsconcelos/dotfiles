# Hyprland Rice on Arch Linux

Here are my configuration files for this rice. This rice relies heavily on [Pywal](https://github.com/dylanaraps/pywal). Colors change as you change your wallpaper.

## Some features and configs

-   Select a wallpaper with `Super + W` and see the colors change
-   Spotify, VS Code, and Firefox are also themed
-   Add any wallpapers in the /home/user/Imagens/Wallpapers directory and let Pywal handle the colors for you
-   Apps will open in their respective workspaces
    -   Workspace 1: Terminal
    -   Workspace 2: Firefox
    -   Workspace 3: VS Code
    -   Workspace 4: GitHub Desktop
    -   Workspace 5: Spotify
    -   Workspace 6: Files (`ranger`)
-   Toggle full screen: `Super + F`
-   Launcher: `Super + D`
-   Power menu: `Super + X`
-   Search anything on the internet: `Super + Space`
-   Select emojis: `Super + ;`
-   Terminal: `Super + Enter`
-   Ranger: `Super + Shift + Enter`
-   VS Code: `CTRL + Alt + V`
-   Spotify: `Super + F1`
-   Blue Light Filter: `Super + F9` to enable and `Super + F10` to disable
-   More shortcuts in the hyprland config file, see the `binds` section
-   Some of the waybar configs:
    -   Right click on the wallpaper button on your bar to set a random wallpaper and set colors from it
    -   Click on the signal icon to open `nmtui`
    -   Click on the audio icon to open `pavucontrol`
    -   Click on the CPU icon to open `bottom`
-   Run `hyprcfg` in your terminal to edit your `hyprland.conf` file
-   Run `waycfg` in your terminal to open your waybar config folder

## Installing Hyprland

I have `yay` as my AUR helper. You can use whatever you want.

```
pacman -S wayland libdrm pixman libxkbcommon python libxml2 llvm libpng gegl mtdev xorg-xwayland qt5-wayland qt6-wayland hyprland waybar xdg-desktop-portal-wlr wlroots xdg-desktop-portal
yay -S swww waybar-updates
```

## Setting up themes and other stuff

```
pacman -S polkit-kde-agent kitty pcmanfm-qt neovim gedit pavucontrol alsa-utils grim slurp wl-clipboard python-pip rofi ranger ts-node zsh ttf-jetbrains-mono ttf-jetbrains-mono-nerd inotify-tools ark playerctl pamixer python-pillow viewnior gnome-keyring neofetch imagemagick wtype rofi-emoji noto-fonts-emoji ttf-droid alsa-firmware tumbler epapirus-icon-theme
yay -S swaylock-effects sddm-sugar-candy-git whitesur-icon-theme-git whitesur-cursor-theme-git whitesur-gtk-theme-git nwg-look-bin python-pywalfox mako-git inter-font-beta github-cli
```

## Installing all other applications

Here are the apps that I normally have installed on distros that I use. Feel free to remove those that you're not using anyway.

```
paru -S github-desktop spotify-launcher spicetify-cli visual-studio-code-bin cava cmatrix tty-clock pipes.sh
pacman -S firefox obsidian vlc
```

## Setting up Oh My Zsh

Do these first before copying the `.zshrc` file to your home directory:

-   Install first Oh My Zsh by running this command:
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

-   Install the syntax highlighting plugin and the autosuggestions plugin:
    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

After that, you can now copy the `.zshrc` file to your home directory.

## Installing Pywal

If you want the regular Pywal, you can install it with `pacman -S python-pywal`. But if you want 16 colors to be generated (which I use in this), you can install it by:

-   Cloning [this](https://github.com/eylles/pywal16) repo
-   `cd` into the repo and run `pip3 install --user . --break-system-packages`

## Copying the dotfiles

Once done, you can run the `install.sh` script found in this dotfiles directory and do a reboot after. Then, proceed to the next section.

Once done, you can go ahead and copy the files to their respective directories and do a reboot. Be sure to check out the [some notes](#some-notes) section in this README.

## Setting up VS Code

There's a [Pywal](https://marketplace.visualstudio.com/items?itemName=dlasagno.wal-theme) theme for VS Code. Colors will automatically update as well once you apply the theme.

## Setting up Firefox

If you use Firefox and want to have Pywal colors:

-   Download the theme extension [here.](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/)
-   Run `pywalfox update` in your terminal.

Once done, you don't need to worry about manually updating the colors everytime you change your wallpaper. A script already takes care of that BUT you do need to manually restart Firefox to apply the new colors.

As for the custom CSS, I followed this guide [here](https://www.reddit.com/r/FirefoxCSS/wiki/index/tutorials/). The `userChrome.css` can be found in `.config/firefox/home/style.css`. Be sure to modify line 2 (replace "gus" with your Linux username).

If you want to have the custom Firefox homepage, you can just set this [url](https://gusvsconcelos.github.io/firefox-homepage/) on your Firefox settings

## Setting up Spotify

-   Open and login with Spotify first.
-   Once done, initially run `spicetify backup apply` in your terminal.
-   Then you can set the theme by running `spicetify config current_theme PywalSleek` in your terminal.
-   And finally you can set the Pywal color scheme by running `spicetify config color_scheme Dynamic`
Open Spotify and you should be good to go.

Note that you need to restart Spotify everytime the colors are changed. This process will be automatically done if you run Spotify using the `Super + F1` keybind that I've set in `hyprland.conf` (you can change this keybind to whatever you want).
