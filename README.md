# Dotfiles
Contains dotfiles for a Linux development environment. It relies on the great [dotbot](https://github.com/anishathalye/dotbot) dotfiles installer.

# Dependencies

- [Dotbot](https://github.com/anishathalye/dotbot/blob/master/README.md)
- Zsh, and these great utilities
  - [Fzf](https://github.com/junegunn/fzf/blob/master/README.md)
  - [Exa](https://the.exa.website/)
  - [Oh My Zsh](https://ohmyz.sh/)
  - [Autojump (plugin)](https://github.com/wting/autojump/blob/master/README.md)
  - [Colorize (plugin)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize)
  - [forgit (plugin)](https://github.com/wfxr/forgit/blob/master/README.md)
  - [colored-man-pages (plugin)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages)
  - [zsh-autosuggestions (plugin)](https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md)
  - [zsh-syntax-highlighting (plugin)](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/README.md)  
- [Nerds Fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md)
- Git
  - [.gitconfig](/git/.gitconfig)
  - multiple alias and helper scripts
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy/blob/master/README.md)
- Docker
  - multiple alias and helper scripts
- VS Code
  - user settings

# Installation (manual)

```bash
git clone git@github.com:jcviau/dotfiles.git
cd dotfiles
./install.sh
```

# Installation (VS Code)
Containers extension has built-in support for using these with your own containers. 
```json
{
  "dotfiles.repository": "jcviau/dotfiles",
  "dotfiles.targetPath": "~/dotfiles",
  "dotfiles.installCommand": "~/dotfiles/install.sh"
}
```
