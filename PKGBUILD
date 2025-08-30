# Maintainer: alec <alecvbnm@outlook.com>
pkgname=gistow-git
pkgrel=1
pkgver=r6.6052e06
pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  ver=$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-/+/g')
  if [ -z "$ver" ]; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}
arch=('any')
pkgdesc='Like stow, but actually git bare repositories'
depends=('git' 'sh')
makedepends=('make')
url="https://github.com/Cricarvbnm/gistow"
license=('MIT')
source=("git+https://github.com/Cricarvbnm/${pkgname%-git}.git")
sha256sums=('SKIP')
package() {
  cd "${srcdir}/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

