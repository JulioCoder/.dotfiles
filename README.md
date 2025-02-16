## My .dotfiles with STOW

The configs: zshrc is for M1; nvim, ranger are general

### Adopt Values from computer files.
Flag "n" indicate Simulation Mode.
If you remove letter "n" it will do it.
`cd .dotfiles`
`stow --adopt -nvSt ~ nvim zsh`
### Delete links (remove "n" flag when ready)
`cd .dotfiles`
`stow -nvDt ~ nvim ranger zsh`
### On a new machine (remove "n" flag when ready)
`cd ~`
`cd .dotfiles`
`git clone https://github.com/AntonellaCoder/.dotfiles.git`
`stow -nvSt ~ nvim ranger zsh`

## 2025 UPDATE ###
Install ZSH 5.9 or higher, make it, build it.
Also install nvim 0.10 or higher, make it, build it.
`git clone git@github.com:JulioCoder/.dotfiles.git`
Install vcprompt from https://github.com/djl/vcprompt?tab=readme-ov-file
Install lastest version of nvim 0.10 (unastable but working)
Install all dependencies

