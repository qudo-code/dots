# Computer Setup
This repository contains dotfiles and scripts I use for setting up and maintaining my machines.

## MacOS
![](/doc/mac-demo.png)
Clone the repo and navigate to the directory.
```bash
git clone git@github.com:qudo-code/dots.git ~/git/dots && cd ~/git/dots
```

### Scripts
For macOS, there's a small CLI located at the root of the repo you can call with `./dots`.
|||
|-|-|
|`./dots install`| Install common apps and tools. ([install.sh](/macos/scripts/install.sh)) |
|`./dots sync`| Copy config files from dots repo to system. ([sync.sh](/macos/scripts/sync.sh)) |

### Keybindings (Aerospace WM)

**Focus Movement**
- `cmd + h/j/k/l` - Focus window (left/down/up/right, wraps around workspace)

**Move Windows**
- `cmd + shift + h/j/k/l` - Move window (left/down/up/right)

**Workspace Navigation**
- `cmd + 1-0` - Switch to workspace 1-10
- `cmd + shift + 1-0` - Move window to workspace 1-10

**Scratchpad**
- `cmd + enter` - Show next scratchpad window (cycles through queue)
- `cmd + shift + enter` - Send focused window to scratchpad (toggle)
- `cmd + shift + option + enter` - Switch to scratchpad workspace (S)

**Other**
- `cmd + shift + space` - Toggle floating/tiling layout
- `cmd + q` - Close window

**Screenshots**
_Requires flameshot to be installed and permissions allowed_
- `cmd + shift + x` - Select an area to screenshot. Copy with `cmd + c` when done.


## NixOS
![](/doc/nix-demo.png)
See NixOS configs in `./nixos`.