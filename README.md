# ASL-Debian-ISO
This repository creates a full Debian installer for AllStarLink v3.
The objectives of this are:

1. Have **asl3-appliance** and all of its dependencies
autoinstalled within Debian.

2. Create device/VM/VPS-specific autobuild configurations that are
using the Debian `preseed.cfg` structure for installation.

## Using This
The basic steps are:

1. Get this repo with `git clone https://github.com/AllStarLink/ASL-Debian-ISO.git`

2. `cd ASL-Debian-ISO`

3. Download the latest Debian ISO and place it in the `ASL-Debian-ISO` directory.
An easy way to do this is browse to https://www.debian.org, right-click on the
*Download* link, copy the link, and then do `wget <LINK>`. For example:

    ```bash
    wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.4.0-amd64-netinst.iso
    ```
4. If desired, create your own custom Preseed configuration in the `preseeds/` directory
within the repository. All attributes for a `preseed.cfg` are documented at
https://www.debian.org/releases/bookworm/amd64/apbs04.en.html.

5. Construct the ISO with the `isobuilder` command. It takes three arguments:

    * `-d FILE` - This is the path to the Debian installer ISO downloaded above
    * `-p FILE` - The name of the preseed file. This must be in the `preseeds/` directory
      and it will be built into the ISO as "the" preseed.cfg.
    * `-v STRING` - The version the file. This will be inserted at in the
      name like `asl-debian-installer-$BUILD_VER.iso`.

6. The ISO file is then ready for use.


## Customization Nodes
The most problematic section of the `preseed.cfg` are those dealing with disks. The
`generic.cfg` file expects the device to be `/dev/vda` and that it will consume all
free disk space. This is the most common structure for a VPS-hosted Linux installation.
If you want to customize the disk layouts, pay particular attention to the elements
in the `- Partitioning -` and `- Bootloader -` sections.

If you need WiFi, for the installation, you'll likely want to comment out all of
the entries in `- Network `.

Other sections should be similarly self-explanatory - set the desired values
or comment out the `d-i` lines to allow the installer to prompt.

It is *strongly* recommended to add any scripted customizations to `post-install.sh`
and not `late.sh`.