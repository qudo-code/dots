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


## NixOS
![](/doc/nix-demo.png)
See NixOS configs in `./nixos`.