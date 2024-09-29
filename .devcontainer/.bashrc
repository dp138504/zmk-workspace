export LS_OPTIONS='-F --color=auto'
alias ls='ls $LS_OPTIONS'
alias leftcss='west build -p -b nice_nano_v2 -d /workspaces/zmk-kyria-customizations/build/custom_status_screen/left -- -DSHIELD=kyria_custom_oled_left -DZMK_CONFIG=/workspaces/zmk-kyria-customizations/config/ -DZMK_EXTRA_MODULES="/workspaces/zmk-kyria-customizations/"'
alias rightcss='west build -p -b nice_nano_v2 -d /workspaces/zmk-kyria-customizations/build/custom_status_screen/right -- -DSHIELD=kyria_custom_oled_right -DZMK_CONFIG=/workspaces/zmk-kyria-customizations/config/ -DZMK_EXTRA_MODULES="/workspaces/zmk-kyria-customizations/"'
alias lefttp='west build -p -b nice_nano_v2 -d /workspaces/zmk-kyria-customizations/build/trackpoint/left -- -DSHIELD=kyria_custom_oled_left -DZMK_CONFIG=/workspaces/zmk-kyria-customizations/config/ -DZMK_EXTRA_MODULES="/workspaces/zmk-kyria-customizations/;/workspaces/modules/kb_zmk_ps2_mouse_trackpoint_driver"'
alias righttp='west build -p -b nice_nano_v2 -d /workspaces/zmk-kyria-customizations/build/trackpoint/right -- -DSHIELD=kyria_custom_oled_right -DZMK_CONFIG=/workspaces/zmk-kyria-customizations/config/ -DZMK_EXTRA_MODULES="/workspaces/zmk-kyria-customizations/;/workspaces/modules/kb_zmk_ps2_mouse_trackpoint_driver"'

if [ "${CODESPACES}" = "true" ]; then
  export WORKSPACE_DIR="$HOME/workspace/zmk"
fi
if [ -f "$WORKSPACE_DIR/zephyr/zephyr-env.sh" ]; then
  source "$WORKSPACE_DIR/zephyr/zephyr-env.sh"
fi

if [ -d "$WORKSPACE_DIR/tools/bsim" ]; then
  export BSIM_OUT_PATH="$WORKSPACE_DIR/tools/bsim/"
  export BSIM_COMPONENTS_PATH="$WORKSPACE_DIR/tools/bsim/components/"
fi