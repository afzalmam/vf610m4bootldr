/*
 * Colibri VFxx M4 boot loader - Gets DT pointer from argument register
 *
 * Copyright (c) 2014 Stefan Agner <stefan@agner.ch>
 *
 */

#define	SRC_BASE	0x4006e000
#define SRC_GPR2	0x28
#define SRC_GPR3	0x2c
	.align
main:
	ldr	r0, src_base
	ldr	r1, machine_id		@ Machine ID
	ldr	r2, [r0, #SRC_GPR3 ] 	@ DT pointer from argument register
	ldr	r0, =0x0
	b	end

	.align

	.globl machine_id
machine_id:
	.long	0xffffffff

src_base:
	.long	SRC_BASE

	.align 4
end:
