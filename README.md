![](./doc/demo.png)
# Dotfiles
Here's how I setup my Mac.

## Aerospace WM
https://github.com/nikitabobko/AeroSpace

#### Install
`brew install --cask nikitabobko/tap/aerospace`

#### Launch
Open your launcher and look for Aerospace to launch it.


#### Config
Copy/paste to your home directory. I started with the "like i3" example config and converted it to use vim movement keys. 

`./aerospace.toml` -> `~/aerospace.toml`


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

`./.config/sketchybar/` -> `~/.config/sketchybar/`


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

`./.config/borders/` -> `~/.config/borders/`

