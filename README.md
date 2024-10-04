# Installation

```bash
git clone git@github.com:hariom-qure/my-nvim.git ~/.config/nvim
cd ~/.config/nvim
nvim
```

## Post-installation
- After neovim starts up, plugin installation using `Lazy` should automatically start, if it does not, run `:Lazy` and sync all the plugins (typing `s` in Lazy window)
- Run `:MasonInstallAll`
- Mason might fail to install some dependencies, and it would provide helpful debugging messages (like `npm` not found), if something like that happens, simply install the required package manager

# Usage, tweaking
- This repo uses NvChad as base (its a plugin to beautify nvim), as such, most of the looks part is offloaded to NvChad, we only take care of LSP, DAP, linters, formatters, etc.
- Go through the NvChad website to understand plugin configuration: https://nvchad.com
    - Going through this website will help you understand how to change config, and other dependencies like using `NerdFont`, which terminal to use, etc.
- Each language is individually configured in `langs/` module
    - The simplest example is `langs/json.lua`
    - Supported languages right now
        - shell
        - lua
        - python
        - json
- There are many additional plugins and features added on top of NvChad provided plugins, take a look at `plugins` directory
