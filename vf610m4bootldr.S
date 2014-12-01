/*
 * Colibri VFxx M4 boot loader - Gets DT pointer from argument register
 *
 * Copyright (c) 2014 Stefan Agner <stefan@agner.ch>
 *
 */

#define	LMEM_PC_BASE	0xe0082000
#define LMEM_PCCCR	0x0
#define	LMEM_PS_BASE	0xe0082800
#define LMEM_PSCCR	0x0
#define	SRC_BASE	0x4006e000
#define SRC_GPR2	0x28
#define SRC_GPR3	0x2c
	.align
main:
	ldr	r0, lmem_pc_base

	/* INVW1 & INVW0 */
	ldr	r3, =0x5
	lsl	r3, r3, #24
	str	r3, [ r0, #LMEM_PCCCR ]
	/* GO */
	ldr	r4, =0x1
	lsl	r4, r4, #31
	str	r4, [ r0, #LMEM_PCCCR ]

l1i_invalidate:
	ldr	r2, [ r0, #LMEM_PCCCR ]
	and	r2, r2, r4
	bne	l1i_invalidate

	/* ENCACHE */
	ldr	r1, =0x1
	str	r1, [ r0, #LMEM_PCCCR ]

	ldr	r0, src_base
	ldr	r1, machine_id		@ Machine ID
	ldr	r2, [ r0, #SRC_GPR3 ] 	@ DT pointer from argument register
	ldr	r0, =0x0
	b	end

	.align

machine_id:
	.long	0xffffffff
src_base:
	.long	SRC_BASE
lmem_pc_base:
	.long	LMEM_PC_BASE
	.align 7
end:
