# Dotfiles
Here's how I setup my computers.
![](./doc/demo.png)

# MacOS
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

# NixOS
The following NixOS configs are also included.
 - .zed config
 - hyprland
 - waybar
 - nix config
