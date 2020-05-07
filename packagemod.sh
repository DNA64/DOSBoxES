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

PKG_CREATOR="DNA64"
MAINTAINER="DNA64 <twitter.com/dna64>"
PLATFORM="SONYPSC"
ARCHITECTURE="armhf"

PKG_TARGET="${PKG_NAME}_${PLATFORM}"
PREINST="${PKG_TARGET}/DEBIAN/preinst"
POSTINST="${PKG_TARGET}/DEBIAN/postinst"
POSTRM="${PKG_TARGET}/DEBIAN/postrm"
CONTROL="${PKG_TARGET}/DEBIAN/control"

VERSION=$([ -f VERSION ] && head VERSION || echo "0.0.1")

LAST_TAG_COMMIT=$(git rev-list --tags --max-count=1)
LAST_TAG=$(git describe --tags ${LAST_TAG_COMMIT})

MAJOR=$(echo ${VERSION} | sed "s/^\([0-9]*\).*/\1/")
MINOR=$(echo ${VERSION} | sed "s/[0-9]*\.\([0-9]*\).*/\1/")
PATCH=$(echo ${VERSION} | sed "s/[0-9]*\.[0-9]*\.\([0-9]*\).*/\1/")

NEXT_MAJOR_VERSION="$(expr ${MAJOR} + 1).0.0"
NEXT_MINOR_VERSION="${MAJOR}.$(expr ${MINOR} + 1)"
NEXT_PATCH_VERSION="${MAJOR}.${MINOR}.$(expr ${PATCH} + 1)"

modCreation() {
  mkdir -p "${PKG_TARGET}/DEBIAN"
  cp -rf mod/* ${PKG_TARGET}/
  {
    printf "%s\n" \
      "Package: ${PKG_NAME}" \
      "Version: ${VERSION}" \
      "Architecture: ${ARCHITECTURE}" \
      "Depends: ${DEPENDS}" \
      "Maintainer: ${MAINTAINER}" \
      "Description: ${PKG_PRETTY_NAME}"
    cat mod_description.txt
    echo "Author: ${PKG_CREATOR}"
    echo "Platform: ${PLATFORM} ${ARCHITECTURE}"
    echo "Built: $(date)"
  } >>${CONTROL}

  [ -f "preinst" ] && cp -rf preinst ${PREINST} && chmod 755 ${PREINST}
  [ -f "postinst" ] && cp -rf postinst ${POSTINST} && chmod 755 ${POSTINST}
  [ -f "postrm" ] && cp -rf postrm ${POSTRM} && chmod 755 ${POSTRM}

  dpkg-deb -v --build ${PKG_TARGET}
  mv ${PKG_TARGET}.deb ${PKG_TARGET}.mod

  rm -r ${PKG_TARGET:?}/
  touch ${PKG_TARGET}.mod

}

checkVersion() {
  echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

clean() {
  rm -rf ${PKG_TARGET:?}/ ${PKG_TARGET}.mod
}

case "$1" in
clean)
  clean
  ;;
minor)
  clean
  modCreation
  echo "${NEXT_MINOR_VERSION}" >VERSION
  ;;
major)
  clean
  modCreation
  echo "${NEXT_MAJOR_VERSION}" >VERSION
  ;;
*)
  clean
  modCreation
  echo "${NEXT_PATCH_VERSION}" >VERSION
  if [ $(checkVersion ${VERSION}) -gt $(checkVersion ${LAST_TAG}) ]; then
    git tag $VERSION
  fi
  ;;
esac
#EOF
