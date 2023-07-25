# My custom NvChad configuration

Installation
First install [NvChad](https://nvchad.com/docs/quickstart/install)    

Now install the custom configuration here, **this would nuke your own custom configuration**  
```
git clone git@github.com:hariom-qure/my-nvim.git ~/.config/my-nvim
cd ~/.config/nvim/lua
rm -rf custom
ln -s ~/.config/my-nvim/custom .
```
