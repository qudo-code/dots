# Dotfiles
Here's how I setup my computers.

# MacOS
![](/doc/mac-demo.png)
## Aerospace WM
https://github.com/nikitabobko/AeroSpace

#### Install
`brew install --cask nikitabobko/tap/aerospace`

#### Launch
Open your launcher and look for Aerospace to launch it.

#### Config
Copy/paste to your home directory. I started with the "like i3" example config and converted it to use vim movement keys.

`./mac/aerospace.toml` -> `~/aerospace.toml`

## Sketchybar Status Bar
https://github.com/FelixKratz/SketchyBar

#### Install
```
brew tap FelixKratz/formulae
brew install sketchybar
brew install --cask sf-symbols
```

#### Start on Login
`brew services start sketchybar`

#### Restart
`brew services restart sketchybar`

#### Config
Copy/paste to your home directory.

`./mac/.config/sketchybar/` -> `~/.config/sketchybar/`

## Janky Borders
https://github.com/FelixKratz/JankyBorders

#### Install
```
brew tap FelixKratz/formulae
brew install borders
```

#### Start on Login
`brew services start borders`

#### Config
Copy/paste to your home directory.

`./mac/.config/borders/` -> `~/.config/borders/`

## App Setup
### Discord Min Width
Discord has a really wide min width, make it smaller so it can tile. Add the following to `/Users/[username]/Library/Application Support/discord`.

```json
"MIN_WIDTH": 0,
"MIN_HEIGHT": 0,
```

# NixOS + Hyprland
![](/doc/nix-demo.png)
1. Clone repo and sync repo configs with system.

**Note:** This will overwrite existing configs specified in the `~/dots/nix` script. Be sure to back up existing configs and `.bashrc` if they contain things you care about.
```bash
git clone git@github.com:qudo-code/dots.git ~/dots && ~/dots/nix
```
3. After running the above, you'll have the following aliases and keybinds when using Hyprland.

**Bash aliases**
```
conf-sync     Syncs repo configs with system. Same as running ~/dots/nix.
conf-build    Syncs configuration.nix and runs nix-rebuild.
conf          Opens config directories in Zed.
```

**Window managment**
```
movekeys =
  h - left
  j - down
  k - up
  l - right
```

```
Alt + h,j,k,l             Select active window in current workspace.
Alt + Shift + h,j,k,l     Move active window to workspace.
Alt + 0-9                 Goto workspace.
Alt + Shift + 0-9         Move focused window in current workspace.
Alt + Shift + Space       Toggle floating.
Alt + c                   Change split direction.
Alt + v                   Dwindle (temp shrink a window).
```

**App management**
```
Alt + Space              Open app launcher.
Alt + Enter              Open terminal.
Alt + e                  Open file explorer.
Alt + f                  Open Brave browser.
```

**Util**
```
Alt + Shift + X          Screenshot region (select with mouse).
Alt + Shift + C          Open configs in Zed (runs 'conf').
Fn  + F5,F6              Backlight up/down.
Alt + Shift + R          Run conf-sync + reload Hyprland.
Alt + Shift + E          Exit Hyprland.
```
