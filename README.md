Hi. We're back.

# Devils-Extra

This is a **collection of unofficial installation scripts for RetroPie** allowing you to quickly and easily **install emulators, ports and libretrocores** that haven't been included in RetroPie for one reason or another. These scripts can be considered experimental at best. 

Those in the `master` branch have been tested reasonably and should work well but may have some flaws as they haven't gone through the RetroPie's watchful eyes yet.

Pull requests and issue reports are accepted and encouraged as well as requests. Feel free to use the issue tracker to send me any personal requests for new scripts that you may have.

## Installation 

The following commands clones the repo to your Raspberry Pi directly to the `RetroPie-Setup/ext` folder and runs `RetroPie-Setup/retropie_setup.sh`.

```bash
curl -sSL https://git.io/J9Z8c | bash
```
The installation script assumes that you are running it on a Raspberry Pi with the `RetroPie-Setup/` folder being stored in `/home/pi/RetroPie-Setup`. If your setup differs, just copy the `Devils-Extra` folder directly to the `/home/pi/RetroPie-Setup/ext` folder.

## Usage

After installing **Devils-Extra**, the extra scripts will be installed directly in the **RetroPie Setup script** (generally in the experimental section), which you can run from either the command line or from the menu within Emulation Station.
```
cd ~
cd RetroPie-Setup/
sudo ./retropie_setup.sh
```

## Updating

The following commands updates your Raspberry Pi to the latest repo directly to the `RetroPie-Setup/ext` folder.

```bash
cd ~
cd RetroPie-Setup/ext/Devils-Extra/
git pull origin
```

The installation script assumes that you are running it on a Raspberry Pi with the `RetroPie-Setup/` folder being stored in `/home/pi/RetroPie-Setup`. If your setup differs, just copy the `Devils-Extra` folder directly to the `/home/pi/RetroPie-Setup/ext` folder.
