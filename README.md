# Dotfiles managed with stow

- To save a package just execute `stow <PACKAGE_NAME>`.
- To update (restow) the package's files execute `stow -R <PACKAGE_NAME>`.
- To delete the package's files (from the target directory) execute `stow -D <PACKAGE_NAME>`

The resource file `.stowrc` stores the command's options: the target directory (`${HOME}`) and the stow directory (`${CONFIG_STOW}` defined in `${ZDOTDIR}/.zvariables`).
