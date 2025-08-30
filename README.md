# gistow

Like stow, but actually git bare repositories.

gistow is just like an alias of git.

## Example

### Home Manager

```sh
mkdir ~/a-dir # just like stow
cd ~/a-dir

gistow-init a-pkg # Create a package (bare repository)

# same as
# git --work-tree=.. --git-dir=a-pkg add ../.makepkg.conf
gistow a-pkg add ../.makepkg.conf # track a file
# gistow is like an alias of "git --work-tree=.. --git-dir"

gistow a-pkg commit -m init # commit the changes

gistow a-pkg status # check changes

gistow-uninstall a-pkg # remove the files of a-pkg
# same as
# gistow a-pkg rm -r ..

gistow-install a-pkg # install the files of a-pkg
# same as
# gistow a-pkg reset --hard HEAD

rm -rf a-pkg # Remove the package
```

## Usage

```txt
gistow <package path> <git arguments, no --work-tree or --git-dir>
gistow-init <package path>
gistow-install <package path>
gistow-uninstall <package path>
```

## Build

## Common

`make install DESTDIR=/ PREFIX=/usr` for installation
`make uninstall DESTDIR=/ PREFIX=/usr`
`make help` for detailed help

## Archlinux

```sh
git checkout build/archlinux
makepkg -sci # sync, install, and clean
```
