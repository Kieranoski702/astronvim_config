# My NeoVim config

## Understanding my config

### Root directory

#### init.lua

Used for basic settings such as which color scheme to use, configuring `lazy` and misc polish functions

#### mappings.lua

Contains custom key mappings not set by a default installation of astronvim

#### options.lua

Contains custom vim options not set by a default installation of astronvim

### plugins directory

#### community.lua

Used to import plugins from the astrocommunity which have been pre configured by members of the astronvim community to work out of the box or better with astronvim.

Available plugins can be found at https://github.com/AstroNvim/astrocommunity

#### core.lua

Used to disable or change core/default behavior of astronvim

#### mason.lua

Used to customise mason plugins, ensure installed languages etc

Note that many of the mason packages I have installed come bundled in astrocommunity language packs and so are not ensure installed here

#### null-ls.lua

Used for customising null-ls

Note that I use mason to configure my installed null-ls sources and so are found either in mason.lua or astrocommunity language packs

#### treesitter.lua

Used to customise treesitter, mostly used for ensuring certain parsers are installed

Note that just like mason.lua some treesitter parser are ensure installed through astrocommunity language packs

Automatic installation of treesitter parsers is also enabled in this config

#### user.lua

Used to install and configure non astronvim/astrocommunity plugins

### highlights directory

This directory is not currently used but is kept here as a place holder in the event I want to override highlights in themes

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Clone the repository

```shell
git clone https://github.com/Kieranoski702/astronvim_config ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

#### A note about haskell-debug-adapter

If mason fails to install haskell-debug-adapter make sure your stack index is updated like so:

```shell
stack update
```
