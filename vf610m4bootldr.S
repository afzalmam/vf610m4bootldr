/*
 * Colibri VFxx M4 boot loader - Gets DT pointer from argument register
 *
 * Copyright (c) 2014 Stefan Agner <stefan@agner.ch>
 *
 */

#define	SRC_BASE	0x4006e000
#define SRC_GPR2	0x28
#define SRC_GPR3	0x2c

main:
	ldr	r0, =SRC_BASE
	ldr	r0, =SRC_BASE
	ldr	r1, =0xffffffff		@ Machine ID
	ldr	r2, [r0, #SRC_GPR3 ] 	@ DT pointer from argument register
	b	entry

entry:
