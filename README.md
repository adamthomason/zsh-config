# ZSH Config

This repository contains my personal preferred config for ZSH. This repository
should be clone as `zsh` within `~/.config/` and configured using the usage
instructions below.

## Usage

To use this config, populate the `~/.zshrc` file like so:

```sh
eval "$(starship init zsh)"

source ~/.config/zsh/history.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/general.zsh
source ~/.config/zsh/git.zsh
source ~/.config/zsh/plugins/git-plugin.zsh
source ~/.config/zsh/go.zsh
source ~/.config/zsh/aws.zsh
source ~/.config/zsh/pyenv.zsh
source ~/.config/zsh/kubectl.zsh
source ~/.config/zsh/terraform.zsh
```
