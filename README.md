# ZMK Workspace
This allows me to build against different ZMK remotes to support a custom status screen and trackpoint module for pointing support.

## Setup
This project utilizes submodules to have multiple branches of zmk with specific customizations applied.

Clone with the following command:
```bash
git clone https://github.com/dp138504/zmk-workspace.git --recurse-submodules
```
Project structure is below:
```bash
.
├── modules 
│   └── kb_zmk_ps2_mouse_trackpoint_driver (https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver)
├── README.md
├── zmk
│   ├── mouse_ps2_module_base (https://github.com/infused-kim/zmk/tree/pr-testing/mouse_ps2_module_base)
│   └── power-domains (https://github.com/petejohanson/zmk/tree/power/domains-and-device-runtime)
└── zmk-kyria-customizations (https://github.com/dp138504/zmk-kyria-customizations/tree/main)
```

Before opening the project in the VSCode Dev Container, create a docker bind volume to map the `zmk-kyria-customizations` and the PS/2 driver repos inside the container:

```bash
docker volume create --driver local -o o=bind -o type=none -o device="/path/to/zmk-workspace/zmk-kyria-customizations" zmk-kyria-customizations
docker volume create --driver local -o o=bind -o type=none -o device="/path/to/zmk-workspace/modules" zmk-zephyr-modules
```

## Usage

Usage follows the [ZMK Local Toolchain](https://zmk.dev/docs/development/local-toolchain/setup/docker) documentation. 

To initialize Zephyr for each branch of ZMK, navigate to `zmk/<zmk_branch>` and run the commands from the ZMK documentation:

```bash
west init -l app/
west update
```

To build for a specific customization, use the following aliases (contained within .devcontainer/.bashrcto):
```bash
leftcss (Builds Custom Status Screen left half)
rightcss (Builds Custom Status Screen right half)

lefttp (Builds TrackPoint left half)
righttp (Builds TrackPoint right half)
```

Swap between branches that target each customization within the `zmk-kyria-customizations` 
```bash
git switch custom_status_screen

OR

git switch trackpoint
```
