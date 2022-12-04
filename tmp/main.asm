;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _tim2_update
	.globl _rst_get
	.globl _millis
	.globl _I2C
	.globl _EXTI
	.globl _UART
	.globl _TIM4
	.globl _TIM2
	.globl _TIM1
	.globl _GPIO_D
	.globl _GPIO_C
	.globl _GPIO_B
	.globl _GPIO_A
	.globl _CLK
	.globl _RST
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_RST::
	.ds 2
_CLK::
	.ds 2
_GPIO_A::
	.ds 2
_GPIO_B::
	.ds 2
_GPIO_C::
	.ds 2
_GPIO_D::
	.ds 2
_TIM1::
	.ds 2
_TIM2::
	.ds 2
_TIM4::
	.ds 2
_UART::
	.ds 2
_EXTI::
	.ds 2
_I2C::
	.ds 2
_millis::
	.ds 2
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int 0x000000 ; int6
	int 0x000000 ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int 0x000000 ; int10
	int 0x000000 ; int11
	int 0x000000 ; int12
	int _tim2_update ; int13
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	src/core.c: 10: uint8_t rst_get()
;	-----------------------------------------
;	 function rst_get
;	-----------------------------------------
_rst_get:
;	src/core.c: 12: return RST->SR;
	ldw	x, _RST+0
	ld	a, (x)
;	src/core.c: 13: }
	ret
;	src/main.c: 12: void tim2_update(void) __interrupt(13)
;	-----------------------------------------
;	 function tim2_update
;	-----------------------------------------
_tim2_update:
;	src/main.c: 14: millis+=1;
	ldw	x, _millis+0
	incw	x
	ldw	_millis+0, x
;	src/main.c: 15: TIM2->SR1 &= ~TIM_SR1_UIF;
	ldw	x, _TIM2+0
	addw	x, #0x0004
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	src/main.c: 16: }
	iret
;	src/main.c: 18: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	src/main.c: 20: CLK->CKDIVR=0;
	ldw	x, _CLK+0
	clr	(0x0006, x)
;	src/main.c: 21: TIM2->PSCR=7;
	ldw	x, _TIM2+0
	ld	a, #0x07
	ld	(0x000e, x), a
;	src/main.c: 22: TIM2->ARRH=0;
	ldw	x, _TIM2+0
	clr	(0x000f, x)
;	src/main.c: 23: TIM2->ARRL=125;
	ldw	x, _TIM2+0
	ld	a, #0x7d
	ld	(0x0010, x), a
;	src/main.c: 21: TIM2->PSCR=7;
	ldw	x, _TIM2+0
;	src/main.c: 24: TIM2->IER|=TIM_IER_UIE;
	addw	x, #0x0003
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	src/main.c: 21: TIM2->PSCR=7;
	ldw	x, _TIM2+0
;	src/main.c: 25: TIM2->CR1|=TIM_CR1_CEN;
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	src/main.c: 26: UART_BAUD(9600);
	ldw	x, _UART+0
	ld	a, #0x02
	ld	(0x0003, x), a
	ldw	x, _UART+0
	incw	x
	incw	x
	ld	a, #0x68
	ld	(x), a
	ldw	x, _UART+0
;	src/main.c: 27: UART_TEN();
	addw	x, #0x0005
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	src/main.c: 26: UART_BAUD(9600);
	ldw	x, _UART+0
;	src/main.c: 27: UART_TEN();
	addw	x, #0x0005
;	src/main.c: 28: UART_REN();
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	src/main.c: 29: GPIO_OUT(GPIO_B,5);
	ldw	x, _GPIO_B+0
	incw	x
	incw	x
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	src/main.c: 30: int_all();
	rim
;	src/main.c: 31: while(1)
00102$:
	jra	00102$
;	src/main.c: 35: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__RST:
	.dw #0x50b3
__xinit__CLK:
	.dw #0x50c0
__xinit__GPIO_A:
	.dw #0x5000
__xinit__GPIO_B:
	.dw #0x5005
__xinit__GPIO_C:
	.dw #0x500a
__xinit__GPIO_D:
	.dw #0x500f
__xinit__TIM1:
	.dw #0x5250
__xinit__TIM2:
	.dw #0x5300
__xinit__TIM4:
	.dw #0x5340
__xinit__UART:
	.dw #0x5230
__xinit__EXTI:
	.dw #0x50a0
__xinit__I2C:
	.dw #0x5210
__xinit__millis:
	.dw #0x0000
	.area CABS (ABS)
