#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="supermodel"
rp_module_desc="Sega Model 3 Arcade emulator V0.3a"
rp_module_help="ROM Extensions: .zip\n\nCopy your Model 3 roms to $romdir/model3"
rp_module_licence="GPL3 https://sourceforge.net/p/model3emu/code/HEAD/tree/trunk/Docs/LICENSE.txt"
rp_module_section="exp"
rp_module_flags="sdl2"

function depends_supermodel() {
    getDepends subversion libglew-dev libsdl2-dev libsdl2-net-dev libzip-dev zlib1g-dev 
}

function sources_supermodel() {
    local revision="$1"
    [[ -z "$revision" ]] && revision="863"

    svn checkout https://svn.code.sf.net/p/model3emu/code/trunk "$md_build" -r "$revision"
}

function build_supermodel() {
   
    ln -s Makefiles/Makefile.UNIX Makefile
    make
    cd bin
    cp -r "$scriptdir/ext/Devils-Extra/scriptmodules/emulators/supermodel/NVRAM" "NVRAM"
    mkdir -p Config Saves
    cp ../Config/Supermodel.ini Config
    cp ../Config/Games.xml Config
    
    cd Config
    way="$md_inst/bin/Config"
    if [[ -e $way/Supermodel.ini ]]; then
	mv Supermodel.ini Supermodel.ini.rp-dist
    fi

    md_ret_require="$md_build/bin/supermodel"
}

function install_supermodel() {
    md_ret_files=(
	'bin'
        'Docs/LICENSE.txt'
        'Docs/README.txt'
    )
}

function configure_supermodel() {
    mkRomDir "model3"
    
    moveConfigDir "$md_inst/bin/Config" "$md_conf_root/model3/Config"
    moveConfigDir "$md_inst/bin/NVRAM" "$home/.model3/NVRAM"
    moveConfigDir "$md_inst/bin/Saves" "$home/.model3/Saves"
    cp -r "$scriptdir/ext/Devils-Extra/scriptmodules/emulators/supermodel/Supermodel.ini" "$md_conf_root/model3/Config"

    chown -R $user:$user "$md_conf_root/model3/Config"
    chown -R $user:$user "$home/.model3"

    addEmulator 0 "$md_id-legacy3d-496x384 " "model3" "XINIT:$md_inst/supermodel.sh -game-xml-file=/opt/retropie/configs/model3/Config/Games.xml -legacy3d -sound-volume=50 -music-volume=60 -no-vsync -no-throttle -no-dsb %ROM%"
    addEmulator 0 "$md_id-new3d-496x384" "model3" "XINIT:$md_inst/supermodel.sh -game-xml-file=/opt/retropie/configs/model3/Config/Games.xml -sound-volume=50 -music-volume=60 -no-vsync -no-throttle -no-dsb %ROM%"
    addEmulator 0 "$md_id-legacy3d-640x480" "model3" "XINIT:$md_inst/supermodel.sh -game-xml-file=/opt/retropie/configs/model3/Config/Games.xml -legacy3d -sound-volume=50 -music-volume=60 -no-vsync -no-throttle -no-dsb -res=640,480 %ROM%"
    addEmulator 0 "$md_id-new3d-640x480" "model3" "XINIT:$md_inst/supermodel.sh -game-xml-file=/opt/retropie/configs/model3/Config/Games.xml -sound-volume=50 -music-volume=60 -no-vsync -no-throttle -no-dsb -res=640,480 %ROM%"

    addSystem "model3" "Sega Model 3" ".zip"

    local file="$md_inst/supermodel.sh"
    cat >"$file" << _EOF_
#!/bin/bash
pushd "$md_inst/bin"
./$md_id "\$@"
popd
_EOF_
    chmod +x "$file"
}
