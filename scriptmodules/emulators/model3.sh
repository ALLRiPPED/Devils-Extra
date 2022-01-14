#!/bin/bash

rp_module_id="model3"
rp_module_desc="model3 - Sega Model 3"
rp_module_help="Sega Model 3 Emualtor."
rp_module_section="exp"
rp_module_flags="!all arm !armv6"

function depends_model3() {
    getDepends p7zip
}
function sources_model() {
	wget "https://archive.org/download/DB-EMUS/Supermodel.7z" -P "~/Devils-Box/"
	sudo p7zip -d ~/Devils-Box/Supermodel.7z
/opt/retropie/emulators