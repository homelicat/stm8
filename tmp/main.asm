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
	.globl _uart_send
	.globl _uart_recv
	.globl _uart_cfg
	.globl _gpio_get
	.globl _gpio_set
	.globl _gpio_cfg
	.globl _millis
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
;	src/gpio.c: 24: void gpio_cfg(struct PORT * port, uint8_t pin, uint8_t cfg)
;	-----------------------------------------
;	 function gpio_cfg
;	-----------------------------------------
_gpio_cfg:
	sub	sp, #6
;	src/gpio.c: 26: port->DDR |= ((cfg&(1<<0))>0)<<pin;
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x05, sp), x
	ld	a, (x)
	ld	yl, a
	ld	a, (0x0c, sp)
	srl	a
	jrnc	00103$
	clrw	x
	incw	x
	.byte 0x21
00103$:
	clrw	x
00104$:
	ld	a, (0x0b, sp)
	ld	(0x03, sp), a
	jreq	00126$
00125$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00125$
00126$:
	ld	a, yl
	pushw	x
	or	a, (2, sp)
	popw	x
	ldw	x, (0x05, sp)
	ld	(x), a
;	src/gpio.c: 27: port->CR1 |= ((cfg&(1<<1))>0)<<pin;
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	ldw	(0x04, sp), x
	ld	a, (x)
	ld	(0x06, sp), a
	ld	a, (0x0c, sp)
	bcp	a, #0x02
	jreq	00105$
	clrw	x
	incw	x
	.byte 0x21
00105$:
	clrw	x
00106$:
	ld	a, (0x03, sp)
	jreq	00129$
00128$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00128$
00129$:
	ld	a, (0x06, sp)
	pushw	x
	or	a, (2, sp)
	popw	x
	ldw	x, (0x04, sp)
	ld	(x), a
;	src/gpio.c: 28: port->CR2 |= ((cfg&(1<<2))>0)<<pin;
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	ldw	(0x05, sp), x
	ld	a, (x)
	ld	(0x04, sp), a
	ld	a, (0x0c, sp)
	bcp	a, #0x04
	jreq	00107$
	clrw	x
	incw	x
	.byte 0x21
00107$:
	clrw	x
00108$:
	ld	a, (0x03, sp)
	jreq	00132$
00131$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00131$
00132$:
	ld	a, (0x04, sp)
	pushw	x
	or	a, (2, sp)
	popw	x
	ldw	x, (0x05, sp)
	ld	(x), a
;	src/gpio.c: 29: }
	addw	sp, #6
	ret
;	src/gpio.c: 31: void gpio_set(struct PORT * port, uint8_t pin, uint8_t state)
;	-----------------------------------------
;	 function gpio_set
;	-----------------------------------------
_gpio_set:
	sub	sp, #3
;	src/gpio.c: 33: port->ODR ^= (port->ODR)^((state>0)<<pin);
	ldw	x, (0x06, sp)
	ldw	(0x01, sp), x
	ld	a, (x)
	ld	yl, a
	ld	(0x03, sp), a
	exg	a, yl
	tnz	(0x09, sp)
	jreq	00103$
	clrw	x
	incw	x
	.byte 0x21
00103$:
	clrw	x
00104$:
	ld	a, (0x08, sp)
	jreq	00112$
00111$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00111$
00112$:
	ld	a, (0x03, sp)
	pushw	x
	xor	a, (2, sp)
	popw	x
	ldw	x, y
	pushw	x
	xor	a, (2, sp)
	popw	x
	ldw	x, (0x01, sp)
	ld	(x), a
;	src/gpio.c: 34: }
	addw	sp, #3
	ret
;	src/gpio.c: 36: uint8_t gpio_get(struct PORT * port, uint8_t pin)
;	-----------------------------------------
;	 function gpio_get
;	-----------------------------------------
_gpio_get:
;	src/gpio.c: 38: return ((port->IDR&(1<<pin))>0);
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	ld	yl, a
	ld	a, (0x05, sp)
	clrw	x
	incw	x
	tnz	a
	jreq	00104$
00103$:
	sllw	x
	dec	a
	jrne	00103$
00104$:
	clr	a
	pushw	x
	and	a, (1, sp)
	popw	x
	ld	xh, a
	pushw	x
	ld	a, yl
	and	a, (2, sp)
	popw	x
	ld	xl, a
	cpw	x, #0x0000
	jrsgt	00105$
	clr	a
	ret
00105$:
	ld	a, #0x01
;	src/gpio.c: 39: }
	ret
;	src/uart.c: 62: void uart_cfg(int baud, uint8_t cr1, uint8_t cr2, uint8_t cr3)
;	-----------------------------------------
;	 function uart_cfg
;	-----------------------------------------
_uart_cfg:
	sub	sp, #4
;	src/uart.c: 64: UART->CR1 = cr1;
	ldw	x, _UART+0
	ld	a, (0x09, sp)
	ld	(0x0004, x), a
;	src/uart.c: 65: UART->CR2 = cr2;
	ldw	x, _UART+0
	ld	a, (0x0a, sp)
	ld	(0x0005, x), a
;	src/uart.c: 66: UART->CR3 = cr3;
	ldw	x, _UART+0
	ld	a, (0x0b, sp)
	ld	(0x0006, x), a
;	src/uart.c: 67: uint16_t div = F_MASTER/baud;
	ldw	y, (0x07, sp)
	clrw	x
	tnzw	y
	jrpl	00103$
	decw	x
00103$:
	pushw	y
	pushw	x
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	exgw	x, y
;	src/uart.c: 68: UART->BRR2 = ((div & 0xF000)>>8)|(div & 0x000F);
	ldw	x, _UART+0
	addw	x, #0x0003
	ldw	(0x01, sp), x
	ldw	x, y
	clr	(0x04, sp)
	ld	a, xh
	and	a, #0xf0
	clrw	x
	ld	xl, a
	ld	a, yl
	and	a, #0x0f
	pushw	x
	or	a, (2, sp)
	popw	x
	ldw	x, (0x01, sp)
	ld	(x), a
;	src/uart.c: 69: UART->BRR1 = (div >> 4) & 0x00FF;
	ldw	x, _UART+0
	incw	x
	incw	x
	ld	a, #0x10
	div	y, a
	ld	a, yl
	ld	(x), a
;	src/uart.c: 70: }
	addw	sp, #4
	ret
;	src/uart.c: 72: uint8_t uart_recv()
;	-----------------------------------------
;	 function uart_recv
;	-----------------------------------------
_uart_recv:
;	src/uart.c: 74: return UART->DR;
	ldw	x, _UART+0
	ld	a, (0x1, x)
;	src/uart.c: 75: }
	ret
;	src/uart.c: 77: void uart_send(uint8_t data)
;	-----------------------------------------
;	 function uart_send
;	-----------------------------------------
_uart_send:
;	src/uart.c: 79: while(!((UART->SR)&(1<<7)));
00101$:
	ldw	x, _UART+0
	ld	a, (x)
	jrpl	00101$
;	src/uart.c: 80: UART->DR = data;
	incw	x
	ld	a, (0x03, sp)
	ld	(x), a
;	src/uart.c: 81: }
	ret
;	src/main.c: 11: void tim2_update(void) __interrupt(13)
;	-----------------------------------------
;	 function tim2_update
;	-----------------------------------------
_tim2_update:
;	src/main.c: 13: millis+=1;
	ldw	x, _millis+0
	incw	x
	ldw	_millis+0, x
;	src/main.c: 14: TIM2->SR1 &= ~TIM_SR1_UIF;
	ldw	x, _TIM2+0
	addw	x, #0x0004
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	src/main.c: 15: }
	iret
;	src/main.c: 17: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #2
;	src/main.c: 19: CLK->CKDIVR=0;
	ldw	x, _CLK+0
	clr	(0x0006, x)
;	src/main.c: 20: TIM2->PSCR=7;
	ldw	x, _TIM2+0
	ld	a, #0x07
	ld	(0x000e, x), a
;	src/main.c: 21: TIM2->ARRH=0;
	ldw	x, _TIM2+0
	clr	(0x000f, x)
;	src/main.c: 22: TIM2->ARRL=125;
	ldw	x, _TIM2+0
	ld	a, #0x7d
	ld	(0x0010, x), a
;	src/main.c: 20: TIM2->PSCR=7;
	ldw	x, _TIM2+0
;	src/main.c: 23: TIM2->IER|=TIM_IER_UIE;
	addw	x, #0x0003
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	src/main.c: 20: TIM2->PSCR=7;
	ldw	x, _TIM2+0
;	src/main.c: 24: TIM2->CR1|=TIM_CR1_CEN;
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	src/main.c: 25: uart_cfg(9600,0,UART_CR2_TEN,0);
	push	#0x00
	push	#0x08
	push	#0x00
	push	#0x80
	push	#0x25
	call	_uart_cfg
	addw	sp, #5
;	src/main.c: 26: gpio_cfg(GPIO_B,5,GPIO_OUT);
	push	#0x01
	push	#0x05
	push	_GPIO_B+1
	push	_GPIO_B+0
	call	_gpio_cfg
	addw	sp, #4
;	src/main.c: 27: int_all();
	rim
;	src/main.c: 28: while(1)
00105$:
;	src/main.c: 30: unsigned int old = millis;
	ldw	x, _millis+0
	ldw	(0x01, sp), x
;	src/main.c: 31: while(millis-old<1000);
00101$:
	ldw	x, _millis+0
	subw	x, (0x01, sp)
	cpw	x, #0x03e8
	jrc	00101$
;	src/main.c: 32: gpio_set(GPIO_B,5,!gpio_get(GPIO_B,5));
	push	#0x05
	push	_GPIO_B+1
	push	_GPIO_B+0
	call	_gpio_get
	addw	sp, #3
	sub	a, #0x01
	clr	a
	rlc	a
	push	a
	push	#0x05
	push	_GPIO_B+1
	push	_GPIO_B+0
	call	_gpio_set
	addw	sp, #4
;	src/main.c: 33: uart_send('A');
	push	#0x41
	call	_uart_send
	pop	a
	jra	00105$
;	src/main.c: 35: }
	addw	sp, #2
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
__xinit__millis:
	.dw #0x0000
	.area CABS (ABS)
