# My custom NvChad configuration

Installation

Now install the custom configuration here, **this would nuke your own custom configuration**  
First install NvChad

```
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim && nvim
```
Initially opening `nvim` would trigger installing the default plugins provided by NvChad


Then install this custom configuration
```
git clone git@github.com:hariom-qure/my-nvim.git ~/.config/my-nvim
cd ~/.config/nvim/lua
rm -rf custom
ln -s ~/.config/my-nvim/custom .
```
