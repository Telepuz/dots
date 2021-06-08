![title](/.config/docs/dots.png)

My dotFiles collection.

# Contents

- [Contents](#contents)
- [Screenshot](#screenshot)
- [Applications](#applications)
- [Install](#install)
- [Usage](#usage)
- [Fonts](#fonts)
- [SystemD Units](#systemd-units)

# Screenshot

|                                                  |                                                |
| ------------------------------------------------ | ---------------------------------------------- |
| ![screen](/.config/docs/screenshot_20210219.png) | ![VSCode](/.config/docs/vscode_20210219.png)   |
| ![Rofi](/.config/docs/rofi_20210219.png)         | ![FireFox](/.config/docs/firefox_20210219.png) |

# Applications

| Type          | App        |
| ------------- | ---------- |
| Shell         | ZSH        |
| Terminal      | LXTerminal |
| Multiplexer   | Tmux       |
| Browser       | FireFox    |
| IDE           | VSCodium   |
| Editor        | Micro      |
| WM            | I3         |
| Panel         | Polybar    |
| Compositor    | Compton    |
| Notifications | Dunst      |
| Music         | Spotify    |
| FileManager   | PCManFM    |
| Screenshot    | FlameShot  |

# Install

1. Install depencies

    ```sh
    sudo apt install -y compton \
        dunst \
        fasd \
        flameshot \
        git \
        gxkb \
        less \
        lxterminal \
        mc \
        micro \
        pcmanfm \
        peco \
        playerctl \
        redshift \
        rofi \
        source-highlight \
        tmux
    ```

2. Clone GIT repo in your home directory

    ```sh
    cd "$HOME"
    git init --bare "$HOME"/.dots.git
    git --git-dir="$HOME"/.dots.git/ remote add origin https://github.com/Telepuz/dots
    git --git-dir="$HOME"/.dots.git/ --work-tree="$HOME" pull origin master
    git --git-dir="$HOME"/.dots.git/ branch --set-upstream-to=origin/master
    ```

3. Reload your shell
4. Enjoy!

# Usage

add alias `alias dots="git --git-dir=$HOME/.dots.git/ --work-tree=$HOME"`

```sh
# Current host synchronization
dots pull origin master

# Get status
dots status

# Add new changes
dots add *
dots commit -m "MESSAGE"
dots push
```

There are two branches in the repository:

**master**   - branch for desktop<br>
**notebook** - branch for notebook

# Fonts

For installation fonts run:

```sh
fc-cache -vf
```

# SystemD Units

Enable daemons:

```sh
systemctl --user enable --now compton.service
systemctl --user enable --now homepage.service
systemctl --user enable --now redshift.service
systemctl --user enable --now yandex-disk.service
```
