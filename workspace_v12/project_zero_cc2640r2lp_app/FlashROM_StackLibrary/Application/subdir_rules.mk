################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
Application/project_zero.obj: ../Application/project_zero.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ti-cgt-arm_18.12.5.LTS/bin/armcl" --cmd_file="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/config/build_components.opt" --cmd_file="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/config/factory_config.opt" --cmd_file="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_stack_library/TOOLS/build_config.opt"  -mv7M3 --code_state=16 -me -O4 --opt_for_speed=0 --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/examples/rtos/CC2640R2_LAUNCHXL/blestack/project_zero/src/extra/" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/Application" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/Startup" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/PROFILES" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/Include" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/controller/cc26xx_r2/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/rom" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/common/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/examples/rtos/CC2640R2_LAUNCHXL/blestack/project_zero/src/app" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/icall/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/dev_info" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/roles/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/roles" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/simple_profile/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/simple_profile" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/target" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/hal/src/target/_common" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/hal/src/target/_common/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/hal/src/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/heapmgr" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/icall/src/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/osal/src/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/services/src/saddr" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/services/src/sdata" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/devices/cc26x0r2" --include_path="C:/ti/ti-cgt-arm_18.12.5.LTS/include" --define=DeviceFamily_CC26X0R2 --define=BOARD_DISPLAY_USE_LCD=0 --define=BOARD_DISPLAY_USE_UART=0 --define=BOARD_DISPLAY_USE_UART_ANSI=0 --define=Display_DISABLE_ALL --define=CC2640R2_LAUNCHXL --define=CC26XX --define=CC26XX_R2 --define=ICALL_EVENTS --define=ICALL_JT --define=ICALL_LITE --define=ICALL_MAX_NUM_ENTITIES=6 --define=ICALL_MAX_NUM_TASKS=3 --define=ICALL_STACK0_ADDR --define=POWER_SAVING --define=STACK_LIBRARY --define=USE_ICALL --define=xdc_runtime_Assert_DISABLE_ALL --define=xdc_runtime_Log_DISABLE_ALL --define=UARTLOG_ENABLE --define=UARTLOG_NUM_EVT_BUF=32 --define=uartlog_FILE="\"project_zero.c\"" -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/project_zero.d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/util.obj: C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/common/cc26xx/util.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ti-cgt-arm_18.12.5.LTS/bin/armcl" --cmd_file="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/config/build_components.opt" --cmd_file="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/config/factory_config.opt" --cmd_file="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_stack_library/TOOLS/build_config.opt"  -mv7M3 --code_state=16 -me -O4 --opt_for_speed=0 --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/examples/rtos/CC2640R2_LAUNCHXL/blestack/project_zero/src/extra/" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/Application" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/Startup" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/PROFILES" --include_path="C:/Users/matth/workspace_v12/project_zero_cc2640r2lp_app/Include" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/controller/cc26xx_r2/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/rom" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/common/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/examples/rtos/CC2640R2_LAUNCHXL/blestack/project_zero/src/app" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/icall/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/dev_info" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/roles/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/roles" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/simple_profile/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/profiles/simple_profile" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/target" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/hal/src/target/_common" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/hal/src/target/_common/cc26xx" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/hal/src/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/heapmgr" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/icall/src/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/osal/src/inc" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/services/src/saddr" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/blestack/services/src/sdata" --include_path="C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source/ti/devices/cc26x0r2" --include_path="C:/ti/ti-cgt-arm_18.12.5.LTS/include" --define=DeviceFamily_CC26X0R2 --define=BOARD_DISPLAY_USE_LCD=0 --define=BOARD_DISPLAY_USE_UART=0 --define=BOARD_DISPLAY_USE_UART_ANSI=0 --define=Display_DISABLE_ALL --define=CC2640R2_LAUNCHXL --define=CC26XX --define=CC26XX_R2 --define=ICALL_EVENTS --define=ICALL_JT --define=ICALL_LITE --define=ICALL_MAX_NUM_ENTITIES=6 --define=ICALL_MAX_NUM_TASKS=3 --define=ICALL_STACK0_ADDR --define=POWER_SAVING --define=STACK_LIBRARY --define=USE_ICALL --define=xdc_runtime_Assert_DISABLE_ALL --define=xdc_runtime_Log_DISABLE_ALL --define=UARTLOG_ENABLE --define=UARTLOG_NUM_EVT_BUF=32 --define=uartlog_FILE="\"util.c\"" -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/util.d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


