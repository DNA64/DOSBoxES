#!/bin/bash
#
#  Copyright (c) 2020 DefKorns (https://defkorns.github.io/LICENSE)
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
PKG_PRETTY_NAME="DOSBox Standalone ES"
PKG_NAME="dosbox-es-standalone"
VERSION="0.1"
PKG_CREATOR="DNA64"
MAINTAINER="DNA64 <twitter.com/dna64>"
PLATFORM="SONYPSC"
ARCHITECTURE="armhf"

PKG_TARGET="${PKG_NAME}_${PLATFORM}"
PREINST="${PKG_TARGET}/DEBIAN/preinst"
POSTINST="${PKG_TARGET}/DEBIAN/postinst"
POSTRM="${PKG_TARGET}/DEBIAN/postrm"
CONTROL="${PKG_TARGET}/DEBIAN/control"

modCreation() {
  mkdir -p "${PKG_TARGET}/DEBIAN"
  cp -rf mod/* ${PKG_TARGET}/
  printf "%s\n" \
    "Package: ${PKG_NAME}" \
    "Version: ${VERSION}" \
    "Architecture: ${ARCHITECTURE}" \
    "Depends: ${DEPENDS}" \
    "Maintainer: ${MAINTAINER}" \
    "Description: ${PKG_PRETTY_NAME}" >${CONTROL}
  cat mod_description.txt >>${CONTROL}
  echo "Author: ${PKG_CREATOR}" >>${CONTROL}
  echo "Platform: ${PLATFORM} ${ARCHITECTURE}" >>${CONTROL}
  echo "Built: $(date)" >>${CONTROL}

  [ -f "preinst" ] && cp -rf preinst ${PREINST} && chmod 755 ${PREINST}
  [ -f "postinst" ] && cp -rf postinst ${POSTINST} && chmod 755 ${POSTINST}
  [ -f "postrm" ] && cp -rf postrm ${POSTRM} && chmod 755 ${POSTRM}

  dpkg-deb -v --build ${PKG_TARGET}
  mv ${PKG_TARGET}.deb ${PKG_TARGET}.mod

  rm -r ${PKG_TARGET}/
  touch ${PKG_TARGET}.mod

}

clean() {
  rm -rf ${PKG_TARGET}/ ${PKG_TARGET}.mod
}

case "$1" in
clean)
  clean
  ;;
*)
  clean
  modCreation
  ;;
esac
#EOF
