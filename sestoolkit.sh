#!/bin/sh

[ -L "$0" ] && pushd "$(readlink "$0" | xargs dirname)" > /dev/null \
    || pushd "$(dirname "$0")" > /dev/null || exit
OPATH=$(pwd -P)
export OPATH
popd > /dev/null || exit

use() {
    cat << __EOF__

 ____                  _   _              ____  _        _ _
/ ___|  ___  ___ _   _| |_(_)_ __ _   _  / ___|| |_ _ __(_) | _____
\___ \ / _ \/ __| | | | __| | '__| | | | \___ \| __| '__| | |/ / _ \
 ___) |  __/ (__| |_| | |_| | |  | |_| |  ___) | |_| |  | |   <  __/
|____/ \___|\___|\__,_|\__|_|_|   \__, | |____/ \__|_|  |_|_|\_\___|
                                  |___/
 _____           _ _    _ _
|_   _|__   ___ | | | _(_) |_
  | |/ _ \ / _ \| | |/ / | __|
  | | (_) | (_) | |   <| | |_
  |_|\___/ \___/|_|_|\_\_|\__|

   Friendly Terminal Script to provide an extra security layer in case
   of a local Strike

   usage: sestoolkit [MODULE] [MODULE_OPTIONS]
          or type "--help" to view this screen or [MODULE help]
          to view how to use any included module.

          OPTIONS:
            help

          MODULES:
__EOF__

    for i in "${OPATH}"/mods/*; do
        [ ! -L "$i" -a -f "$i" ] && echo "            ${i##*/}"
    done

    [ "${OPTIONS}" = "help" ] && exit 0 || exit 1

}

OPTIONS=$1; shift;

[ ! -f "${OPATH}/mods/${OPTIONS}" ] && use
"${OPATH}"/mods/"${OPTIONS}" "$@"
