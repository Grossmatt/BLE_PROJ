################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc-arm-none-eabi_7_2_1/bin/arm-none-eabi-gcc-7.2.1.exe" -c -mcpu=cortex-m3 -march=armv7-m -mthumb -mfloat-abi=soft -DDeviceFamily_CC26X0R2 -I"C:/Users/matth/workspace_v12/gpiointerrupt_CC2640R2_LAUNCHXL_nortos_gcc" -I"C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/source" -I"C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/kernel/nortos" -I"C:/ti/simplelink_cc2640r2_sdk_5_30_00_03/kernel/nortos/posix" -I"C:/ti/gcc-arm-none-eabi_7_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc-arm-none-eabi_7_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


