vf610m4bootldr
==============

Vybrid Cortex-M4 mini boot loader for Linux

This utility helps to boot a (non-MMU) Linux image on the Cortex-M4 CPU of
the Freescale Vybrid SoC. The device tree enabled Linux ARM kernels expect
a pointer to the device tree binary in the CPU register r2. However, on
Vybrid we use the Linux running on the main CPU, the Cortex-A5, to start the
secondary Cortex-M4 CPU. The m4boot utility helps archiving this, however
since it is running on a different CPU, it can't write the r2 register of
the Cortex-M4. This mini boot loader helps the m4boot utility doingt his, by
simply moving the SoC specific boot argument pointer from SRC_GPR3 to the
CPU's r2 register.

The binary output is part of the m4boot repository. The m4boot utility
incorporates the utility and loads it automatically to the appropriate palce.
