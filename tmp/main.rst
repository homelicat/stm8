                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _tim2_update
                                     13 	.globl _uart_send
                                     14 	.globl _uart_recv
                                     15 	.globl _uart_check
                                     16 	.globl _uart_cfg
                                     17 	.globl _gpio_get
                                     18 	.globl _gpio_set
                                     19 	.globl _gpio_cfg
                                     20 	.globl _rst_get
                                     21 	.globl _millis
                                     22 	.globl _I2C
                                     23 	.globl _EXTI
                                     24 	.globl _UART
                                     25 	.globl _TIM4
                                     26 	.globl _TIM2
                                     27 	.globl _TIM1
                                     28 	.globl _GPIO_D
                                     29 	.globl _GPIO_C
                                     30 	.globl _GPIO_B
                                     31 	.globl _GPIO_A
                                     32 	.globl _CLK
                                     33 	.globl _RST
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DATA
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area INITIALIZED
      000001                         42 _RST::
      000001                         43 	.ds 2
      000003                         44 _CLK::
      000003                         45 	.ds 2
      000005                         46 _GPIO_A::
      000005                         47 	.ds 2
      000007                         48 _GPIO_B::
      000007                         49 	.ds 2
      000009                         50 _GPIO_C::
      000009                         51 	.ds 2
      00000B                         52 _GPIO_D::
      00000B                         53 	.ds 2
      00000D                         54 _TIM1::
      00000D                         55 	.ds 2
      00000F                         56 _TIM2::
      00000F                         57 	.ds 2
      000011                         58 _TIM4::
      000011                         59 	.ds 2
      000013                         60 _UART::
      000013                         61 	.ds 2
      000015                         62 _EXTI::
      000015                         63 	.ds 2
      000017                         64 _I2C::
      000017                         65 	.ds 2
      000019                         66 _millis::
      000019                         67 	.ds 2
                                     68 ;--------------------------------------------------------
                                     69 ; Stack segment in internal ram 
                                     70 ;--------------------------------------------------------
                                     71 	.area	SSEG
      FFFFFF                         72 __start__stack:
      FFFFFF                         73 	.ds	1
                                     74 
                                     75 ;--------------------------------------------------------
                                     76 ; absolute external ram data
                                     77 ;--------------------------------------------------------
                                     78 	.area DABS (ABS)
                                     79 
                                     80 ; default segment ordering for linker
                                     81 	.area HOME
                                     82 	.area GSINIT
                                     83 	.area GSFINAL
                                     84 	.area CONST
                                     85 	.area INITIALIZER
                                     86 	.area CODE
                                     87 
                                     88 ;--------------------------------------------------------
                                     89 ; interrupt vector 
                                     90 ;--------------------------------------------------------
                                     91 	.area HOME
      008000                         92 __interrupt_vect:
      008000 82 00 80 43             93 	int s_GSINIT ; reset
      008004 82 00 00 00             94 	int 0x000000 ; trap
      008008 82 00 00 00             95 	int 0x000000 ; int0
      00800C 82 00 00 00             96 	int 0x000000 ; int1
      008010 82 00 00 00             97 	int 0x000000 ; int2
      008014 82 00 00 00             98 	int 0x000000 ; int3
      008018 82 00 00 00             99 	int 0x000000 ; int4
      00801C 82 00 00 00            100 	int 0x000000 ; int5
      008020 82 00 00 00            101 	int 0x000000 ; int6
      008024 82 00 00 00            102 	int 0x000000 ; int7
      008028 82 00 00 00            103 	int 0x000000 ; int8
      00802C 82 00 00 00            104 	int 0x000000 ; int9
      008030 82 00 00 00            105 	int 0x000000 ; int10
      008034 82 00 00 00            106 	int 0x000000 ; int11
      008038 82 00 00 00            107 	int 0x000000 ; int12
      00803C 82 00 81 E8            108 	int _tim2_update ; int13
                                    109 ;--------------------------------------------------------
                                    110 ; global & static initialisations
                                    111 ;--------------------------------------------------------
                                    112 	.area HOME
                                    113 	.area GSINIT
                                    114 	.area GSFINAL
                                    115 	.area GSINIT
      008043                        116 __sdcc_gs_init_startup:
      008043                        117 __sdcc_init_data:
                                    118 ; stm8_genXINIT() start
      008043 AE 00 00         [ 2]  119 	ldw x, #l_DATA
      008046 27 07            [ 1]  120 	jreq	00002$
      008048                        121 00001$:
      008048 72 4F 00 00      [ 1]  122 	clr (s_DATA - 1, x)
      00804C 5A               [ 2]  123 	decw x
      00804D 26 F9            [ 1]  124 	jrne	00001$
      00804F                        125 00002$:
      00804F AE 00 1A         [ 2]  126 	ldw	x, #l_INITIALIZER
      008052 27 09            [ 1]  127 	jreq	00004$
      008054                        128 00003$:
      008054 D6 80 5F         [ 1]  129 	ld	a, (s_INITIALIZER - 1, x)
      008057 D7 00 00         [ 1]  130 	ld	(s_INITIALIZED - 1, x), a
      00805A 5A               [ 2]  131 	decw	x
      00805B 26 F7            [ 1]  132 	jrne	00003$
      00805D                        133 00004$:
                                    134 ; stm8_genXINIT() end
                                    135 	.area GSFINAL
      00805D CC 80 40         [ 2]  136 	jp	__sdcc_program_startup
                                    137 ;--------------------------------------------------------
                                    138 ; Home
                                    139 ;--------------------------------------------------------
                                    140 	.area HOME
                                    141 	.area HOME
      008040                        142 __sdcc_program_startup:
      008040 CC 81 FA         [ 2]  143 	jp	_main
                                    144 ;	return from main will return to caller
                                    145 ;--------------------------------------------------------
                                    146 ; code
                                    147 ;--------------------------------------------------------
                                    148 	.area CODE
                                    149 ;	src/core.c: 10: uint8_t rst_get()
                                    150 ;	-----------------------------------------
                                    151 ;	 function rst_get
                                    152 ;	-----------------------------------------
      00807A                        153 _rst_get:
                                    154 ;	src/core.c: 12: return RST->SR;
      00807A CE 00 01         [ 2]  155 	ldw	x, _RST+0
      00807D F6               [ 1]  156 	ld	a, (x)
                                    157 ;	src/core.c: 13: }
      00807E 81               [ 4]  158 	ret
                                    159 ;	src/gpio.c: 25: void gpio_cfg(struct PORT * port, uint8_t pin, uint8_t cfg)
                                    160 ;	-----------------------------------------
                                    161 ;	 function gpio_cfg
                                    162 ;	-----------------------------------------
      00807F                        163 _gpio_cfg:
      00807F 52 06            [ 2]  164 	sub	sp, #6
                                    165 ;	src/gpio.c: 27: port->DDR |= ((cfg&(1<<0))>0)<<pin;
      008081 16 09            [ 2]  166 	ldw	y, (0x09, sp)
      008083 17 01            [ 2]  167 	ldw	(0x01, sp), y
      008085 93               [ 1]  168 	ldw	x, y
      008086 5C               [ 1]  169 	incw	x
      008087 5C               [ 1]  170 	incw	x
      008088 1F 05            [ 2]  171 	ldw	(0x05, sp), x
      00808A F6               [ 1]  172 	ld	a, (x)
      00808B 90 97            [ 1]  173 	ld	yl, a
      00808D 7B 0C            [ 1]  174 	ld	a, (0x0c, sp)
      00808F 44               [ 1]  175 	srl	a
      008090 24 03            [ 1]  176 	jrnc	00103$
      008092 5F               [ 1]  177 	clrw	x
      008093 5C               [ 1]  178 	incw	x
      008094 21                     179 	.byte 0x21
      008095                        180 00103$:
      008095 5F               [ 1]  181 	clrw	x
      008096                        182 00104$:
      008096 7B 0B            [ 1]  183 	ld	a, (0x0b, sp)
      008098 6B 03            [ 1]  184 	ld	(0x03, sp), a
      00809A 27 06            [ 1]  185 	jreq	00126$
      00809C                        186 00125$:
      00809C 41               [ 1]  187 	exg	a, xl
      00809D 48               [ 1]  188 	sll	a
      00809E 41               [ 1]  189 	exg	a, xl
      00809F 4A               [ 1]  190 	dec	a
      0080A0 26 FA            [ 1]  191 	jrne	00125$
      0080A2                        192 00126$:
      0080A2 90 9F            [ 1]  193 	ld	a, yl
      0080A4 89               [ 2]  194 	pushw	x
      0080A5 1A 02            [ 1]  195 	or	a, (2, sp)
      0080A7 85               [ 2]  196 	popw	x
      0080A8 1E 05            [ 2]  197 	ldw	x, (0x05, sp)
      0080AA F7               [ 1]  198 	ld	(x), a
                                    199 ;	src/gpio.c: 28: port->CR1 |= ((cfg&(1<<1))>0)<<pin;
      0080AB 1E 01            [ 2]  200 	ldw	x, (0x01, sp)
      0080AD 1C 00 03         [ 2]  201 	addw	x, #0x0003
      0080B0 1F 04            [ 2]  202 	ldw	(0x04, sp), x
      0080B2 F6               [ 1]  203 	ld	a, (x)
      0080B3 6B 06            [ 1]  204 	ld	(0x06, sp), a
      0080B5 7B 0C            [ 1]  205 	ld	a, (0x0c, sp)
      0080B7 A5 02            [ 1]  206 	bcp	a, #0x02
      0080B9 27 03            [ 1]  207 	jreq	00105$
      0080BB 5F               [ 1]  208 	clrw	x
      0080BC 5C               [ 1]  209 	incw	x
      0080BD 21                     210 	.byte 0x21
      0080BE                        211 00105$:
      0080BE 5F               [ 1]  212 	clrw	x
      0080BF                        213 00106$:
      0080BF 7B 03            [ 1]  214 	ld	a, (0x03, sp)
      0080C1 27 06            [ 1]  215 	jreq	00129$
      0080C3                        216 00128$:
      0080C3 41               [ 1]  217 	exg	a, xl
      0080C4 48               [ 1]  218 	sll	a
      0080C5 41               [ 1]  219 	exg	a, xl
      0080C6 4A               [ 1]  220 	dec	a
      0080C7 26 FA            [ 1]  221 	jrne	00128$
      0080C9                        222 00129$:
      0080C9 7B 06            [ 1]  223 	ld	a, (0x06, sp)
      0080CB 89               [ 2]  224 	pushw	x
      0080CC 1A 02            [ 1]  225 	or	a, (2, sp)
      0080CE 85               [ 2]  226 	popw	x
      0080CF 1E 04            [ 2]  227 	ldw	x, (0x04, sp)
      0080D1 F7               [ 1]  228 	ld	(x), a
                                    229 ;	src/gpio.c: 29: port->CR2 |= ((cfg&(1<<2))>0)<<pin;
      0080D2 1E 01            [ 2]  230 	ldw	x, (0x01, sp)
      0080D4 1C 00 04         [ 2]  231 	addw	x, #0x0004
      0080D7 1F 05            [ 2]  232 	ldw	(0x05, sp), x
      0080D9 F6               [ 1]  233 	ld	a, (x)
      0080DA 6B 04            [ 1]  234 	ld	(0x04, sp), a
      0080DC 7B 0C            [ 1]  235 	ld	a, (0x0c, sp)
      0080DE A5 04            [ 1]  236 	bcp	a, #0x04
      0080E0 27 03            [ 1]  237 	jreq	00107$
      0080E2 5F               [ 1]  238 	clrw	x
      0080E3 5C               [ 1]  239 	incw	x
      0080E4 21                     240 	.byte 0x21
      0080E5                        241 00107$:
      0080E5 5F               [ 1]  242 	clrw	x
      0080E6                        243 00108$:
      0080E6 7B 03            [ 1]  244 	ld	a, (0x03, sp)
      0080E8 27 06            [ 1]  245 	jreq	00132$
      0080EA                        246 00131$:
      0080EA 41               [ 1]  247 	exg	a, xl
      0080EB 48               [ 1]  248 	sll	a
      0080EC 41               [ 1]  249 	exg	a, xl
      0080ED 4A               [ 1]  250 	dec	a
      0080EE 26 FA            [ 1]  251 	jrne	00131$
      0080F0                        252 00132$:
      0080F0 7B 04            [ 1]  253 	ld	a, (0x04, sp)
      0080F2 89               [ 2]  254 	pushw	x
      0080F3 1A 02            [ 1]  255 	or	a, (2, sp)
      0080F5 85               [ 2]  256 	popw	x
      0080F6 1E 05            [ 2]  257 	ldw	x, (0x05, sp)
      0080F8 F7               [ 1]  258 	ld	(x), a
                                    259 ;	src/gpio.c: 30: }
      0080F9 5B 06            [ 2]  260 	addw	sp, #6
      0080FB 81               [ 4]  261 	ret
                                    262 ;	src/gpio.c: 33: void gpio_set(struct PORT * port, uint8_t pin, uint8_t state)
                                    263 ;	-----------------------------------------
                                    264 ;	 function gpio_set
                                    265 ;	-----------------------------------------
      0080FC                        266 _gpio_set:
      0080FC 52 03            [ 2]  267 	sub	sp, #3
                                    268 ;	src/gpio.c: 35: port->ODR ^= (port->ODR)^((state>0)<<pin);
      0080FE 1E 06            [ 2]  269 	ldw	x, (0x06, sp)
      008100 1F 01            [ 2]  270 	ldw	(0x01, sp), x
      008102 F6               [ 1]  271 	ld	a, (x)
      008103 90 97            [ 1]  272 	ld	yl, a
      008105 6B 03            [ 1]  273 	ld	(0x03, sp), a
      008107 61               [ 1]  274 	exg	a, yl
      008108 0D 09            [ 1]  275 	tnz	(0x09, sp)
      00810A 27 03            [ 1]  276 	jreq	00103$
      00810C 5F               [ 1]  277 	clrw	x
      00810D 5C               [ 1]  278 	incw	x
      00810E 21                     279 	.byte 0x21
      00810F                        280 00103$:
      00810F 5F               [ 1]  281 	clrw	x
      008110                        282 00104$:
      008110 7B 08            [ 1]  283 	ld	a, (0x08, sp)
      008112 27 06            [ 1]  284 	jreq	00112$
      008114                        285 00111$:
      008114 41               [ 1]  286 	exg	a, xl
      008115 48               [ 1]  287 	sll	a
      008116 41               [ 1]  288 	exg	a, xl
      008117 4A               [ 1]  289 	dec	a
      008118 26 FA            [ 1]  290 	jrne	00111$
      00811A                        291 00112$:
      00811A 7B 03            [ 1]  292 	ld	a, (0x03, sp)
      00811C 89               [ 2]  293 	pushw	x
      00811D 18 02            [ 1]  294 	xor	a, (2, sp)
      00811F 85               [ 2]  295 	popw	x
      008120 93               [ 1]  296 	ldw	x, y
      008121 89               [ 2]  297 	pushw	x
      008122 18 02            [ 1]  298 	xor	a, (2, sp)
      008124 85               [ 2]  299 	popw	x
      008125 1E 01            [ 2]  300 	ldw	x, (0x01, sp)
      008127 F7               [ 1]  301 	ld	(x), a
                                    302 ;	src/gpio.c: 36: }
      008128 5B 03            [ 2]  303 	addw	sp, #3
      00812A 81               [ 4]  304 	ret
                                    305 ;	src/gpio.c: 39: uint8_t gpio_get(struct PORT * port, uint8_t pin)
                                    306 ;	-----------------------------------------
                                    307 ;	 function gpio_get
                                    308 ;	-----------------------------------------
      00812B                        309 _gpio_get:
                                    310 ;	src/gpio.c: 41: return ((port->IDR&(1<<pin))>0);
      00812B 1E 03            [ 2]  311 	ldw	x, (0x03, sp)
      00812D E6 01            [ 1]  312 	ld	a, (0x1, x)
      00812F 90 97            [ 1]  313 	ld	yl, a
      008131 7B 05            [ 1]  314 	ld	a, (0x05, sp)
      008133 5F               [ 1]  315 	clrw	x
      008134 5C               [ 1]  316 	incw	x
      008135 4D               [ 1]  317 	tnz	a
      008136 27 04            [ 1]  318 	jreq	00104$
      008138                        319 00103$:
      008138 58               [ 2]  320 	sllw	x
      008139 4A               [ 1]  321 	dec	a
      00813A 26 FC            [ 1]  322 	jrne	00103$
      00813C                        323 00104$:
      00813C 4F               [ 1]  324 	clr	a
      00813D 89               [ 2]  325 	pushw	x
      00813E 14 01            [ 1]  326 	and	a, (1, sp)
      008140 85               [ 2]  327 	popw	x
      008141 95               [ 1]  328 	ld	xh, a
      008142 89               [ 2]  329 	pushw	x
      008143 90 9F            [ 1]  330 	ld	a, yl
      008145 14 02            [ 1]  331 	and	a, (2, sp)
      008147 85               [ 2]  332 	popw	x
      008148 97               [ 1]  333 	ld	xl, a
      008149 A3 00 00         [ 2]  334 	cpw	x, #0x0000
      00814C 2C 02            [ 1]  335 	jrsgt	00105$
      00814E 4F               [ 1]  336 	clr	a
      00814F 81               [ 4]  337 	ret
      008150                        338 00105$:
      008150 A6 01            [ 1]  339 	ld	a, #0x01
                                    340 ;	src/gpio.c: 42: }
      008152 81               [ 4]  341 	ret
                                    342 ;	src/uart.c: 66: void uart_cfg(int baud, uint8_t cr1, uint8_t cr2, uint8_t cr3, uint8_t cr4, uint8_t cr5, uint8_t gt, uint8_t prescale)
                                    343 ;	-----------------------------------------
                                    344 ;	 function uart_cfg
                                    345 ;	-----------------------------------------
      008153                        346 _uart_cfg:
      008153 52 04            [ 2]  347 	sub	sp, #4
                                    348 ;	src/uart.c: 68: UART->CR1 = cr1;
      008155 CE 00 13         [ 2]  349 	ldw	x, _UART+0
      008158 7B 09            [ 1]  350 	ld	a, (0x09, sp)
      00815A E7 04            [ 1]  351 	ld	(0x0004, x), a
                                    352 ;	src/uart.c: 69: UART->CR2 = cr2;
      00815C CE 00 13         [ 2]  353 	ldw	x, _UART+0
      00815F 7B 0A            [ 1]  354 	ld	a, (0x0a, sp)
      008161 E7 05            [ 1]  355 	ld	(0x0005, x), a
                                    356 ;	src/uart.c: 70: UART->CR3 = cr3;
      008163 CE 00 13         [ 2]  357 	ldw	x, _UART+0
      008166 7B 0B            [ 1]  358 	ld	a, (0x0b, sp)
      008168 E7 06            [ 1]  359 	ld	(0x0006, x), a
                                    360 ;	src/uart.c: 71: UART->CR4 = cr4;
      00816A CE 00 13         [ 2]  361 	ldw	x, _UART+0
      00816D 7B 0C            [ 1]  362 	ld	a, (0x0c, sp)
      00816F E7 07            [ 1]  363 	ld	(0x0007, x), a
                                    364 ;	src/uart.c: 72: UART->CR5 = cr5;
      008171 CE 00 13         [ 2]  365 	ldw	x, _UART+0
      008174 7B 0D            [ 1]  366 	ld	a, (0x0d, sp)
      008176 E7 08            [ 1]  367 	ld	(0x0008, x), a
                                    368 ;	src/uart.c: 73: UART->GTR = gt;
      008178 CE 00 13         [ 2]  369 	ldw	x, _UART+0
      00817B 7B 0E            [ 1]  370 	ld	a, (0x0e, sp)
      00817D E7 09            [ 1]  371 	ld	(0x0009, x), a
                                    372 ;	src/uart.c: 74: UART->PSCR = prescale;
      00817F CE 00 13         [ 2]  373 	ldw	x, _UART+0
      008182 7B 0F            [ 1]  374 	ld	a, (0x0f, sp)
      008184 E7 0A            [ 1]  375 	ld	(0x000a, x), a
                                    376 ;	src/uart.c: 75: uint16_t div = F_MASTER/baud;
      008186 16 07            [ 2]  377 	ldw	y, (0x07, sp)
      008188 5F               [ 1]  378 	clrw	x
      008189 90 5D            [ 2]  379 	tnzw	y
      00818B 2A 01            [ 1]  380 	jrpl	00103$
      00818D 5A               [ 2]  381 	decw	x
      00818E                        382 00103$:
      00818E 90 89            [ 2]  383 	pushw	y
      008190 89               [ 2]  384 	pushw	x
      008191 4B 00            [ 1]  385 	push	#0x00
      008193 4B 24            [ 1]  386 	push	#0x24
      008195 4B F4            [ 1]  387 	push	#0xf4
      008197 4B 00            [ 1]  388 	push	#0x00
      008199 CD 82 4D         [ 4]  389 	call	__divulong
      00819C 5B 08            [ 2]  390 	addw	sp, #8
      00819E 51               [ 1]  391 	exgw	x, y
                                    392 ;	src/uart.c: 76: UART->BRR2 = ((div & 0xF000)>>8)|(div & 0x000F);
      00819F CE 00 13         [ 2]  393 	ldw	x, _UART+0
      0081A2 1C 00 03         [ 2]  394 	addw	x, #0x0003
      0081A5 1F 01            [ 2]  395 	ldw	(0x01, sp), x
      0081A7 93               [ 1]  396 	ldw	x, y
      0081A8 0F 04            [ 1]  397 	clr	(0x04, sp)
      0081AA 9E               [ 1]  398 	ld	a, xh
      0081AB A4 F0            [ 1]  399 	and	a, #0xf0
      0081AD 5F               [ 1]  400 	clrw	x
      0081AE 97               [ 1]  401 	ld	xl, a
      0081AF 90 9F            [ 1]  402 	ld	a, yl
      0081B1 A4 0F            [ 1]  403 	and	a, #0x0f
      0081B3 89               [ 2]  404 	pushw	x
      0081B4 1A 02            [ 1]  405 	or	a, (2, sp)
      0081B6 85               [ 2]  406 	popw	x
      0081B7 1E 01            [ 2]  407 	ldw	x, (0x01, sp)
      0081B9 F7               [ 1]  408 	ld	(x), a
                                    409 ;	src/uart.c: 77: UART->BRR1 = (div >> 4) & 0x00FF;
      0081BA CE 00 13         [ 2]  410 	ldw	x, _UART+0
      0081BD 5C               [ 1]  411 	incw	x
      0081BE 5C               [ 1]  412 	incw	x
      0081BF A6 10            [ 1]  413 	ld	a, #0x10
      0081C1 90 62            [ 2]  414 	div	y, a
      0081C3 90 9F            [ 1]  415 	ld	a, yl
      0081C5 F7               [ 1]  416 	ld	(x), a
                                    417 ;	src/uart.c: 78: }
      0081C6 5B 04            [ 2]  418 	addw	sp, #4
      0081C8 81               [ 4]  419 	ret
                                    420 ;	src/uart.c: 81: uint8_t uart_check()
                                    421 ;	-----------------------------------------
                                    422 ;	 function uart_check
                                    423 ;	-----------------------------------------
      0081C9                        424 _uart_check:
                                    425 ;	src/uart.c: 83: return (UART->SR&UART_SR_RXNE)>0;
      0081C9 CE 00 13         [ 2]  426 	ldw	x, _UART+0
      0081CC F6               [ 1]  427 	ld	a, (x)
      0081CD A5 20            [ 1]  428 	bcp	a, #0x20
      0081CF 27 03            [ 1]  429 	jreq	00103$
      0081D1 5F               [ 1]  430 	clrw	x
      0081D2 5C               [ 1]  431 	incw	x
      0081D3 21                     432 	.byte 0x21
      0081D4                        433 00103$:
      0081D4 5F               [ 1]  434 	clrw	x
      0081D5                        435 00104$:
      0081D5 9F               [ 1]  436 	ld	a, xl
                                    437 ;	src/uart.c: 84: }
      0081D6 81               [ 4]  438 	ret
                                    439 ;	src/uart.c: 87: uint8_t uart_recv()
                                    440 ;	-----------------------------------------
                                    441 ;	 function uart_recv
                                    442 ;	-----------------------------------------
      0081D7                        443 _uart_recv:
                                    444 ;	src/uart.c: 89: return UART->DR;
      0081D7 CE 00 13         [ 2]  445 	ldw	x, _UART+0
      0081DA E6 01            [ 1]  446 	ld	a, (0x1, x)
                                    447 ;	src/uart.c: 90: }
      0081DC 81               [ 4]  448 	ret
                                    449 ;	src/uart.c: 93: void uart_send(uint8_t data)
                                    450 ;	-----------------------------------------
                                    451 ;	 function uart_send
                                    452 ;	-----------------------------------------
      0081DD                        453 _uart_send:
                                    454 ;	src/uart.c: 95: while(!((UART->SR)&UART_SR_TXE));
      0081DD                        455 00101$:
      0081DD CE 00 13         [ 2]  456 	ldw	x, _UART+0
      0081E0 F6               [ 1]  457 	ld	a, (x)
      0081E1 2A FA            [ 1]  458 	jrpl	00101$
                                    459 ;	src/uart.c: 96: UART->DR = data;
      0081E3 5C               [ 1]  460 	incw	x
      0081E4 7B 03            [ 1]  461 	ld	a, (0x03, sp)
      0081E6 F7               [ 1]  462 	ld	(x), a
                                    463 ;	src/uart.c: 97: }
      0081E7 81               [ 4]  464 	ret
                                    465 ;	src/main.c: 12: void tim2_update(void) __interrupt(13)
                                    466 ;	-----------------------------------------
                                    467 ;	 function tim2_update
                                    468 ;	-----------------------------------------
      0081E8                        469 _tim2_update:
                                    470 ;	src/main.c: 14: millis+=1;
      0081E8 CE 00 19         [ 2]  471 	ldw	x, _millis+0
      0081EB 5C               [ 1]  472 	incw	x
      0081EC CF 00 19         [ 2]  473 	ldw	_millis+0, x
                                    474 ;	src/main.c: 15: TIM2->SR1 &= ~TIM_SR1_UIF;
      0081EF CE 00 0F         [ 2]  475 	ldw	x, _TIM2+0
      0081F2 1C 00 04         [ 2]  476 	addw	x, #0x0004
      0081F5 F6               [ 1]  477 	ld	a, (x)
      0081F6 A4 FE            [ 1]  478 	and	a, #0xfe
      0081F8 F7               [ 1]  479 	ld	(x), a
                                    480 ;	src/main.c: 16: }
      0081F9 80               [11]  481 	iret
                                    482 ;	src/main.c: 18: void main()
                                    483 ;	-----------------------------------------
                                    484 ;	 function main
                                    485 ;	-----------------------------------------
      0081FA                        486 _main:
                                    487 ;	src/main.c: 20: CLK->CKDIVR=0;
      0081FA CE 00 03         [ 2]  488 	ldw	x, _CLK+0
      0081FD 6F 06            [ 1]  489 	clr	(0x0006, x)
                                    490 ;	src/main.c: 21: TIM2->PSCR=7;
      0081FF CE 00 0F         [ 2]  491 	ldw	x, _TIM2+0
      008202 A6 07            [ 1]  492 	ld	a, #0x07
      008204 E7 0E            [ 1]  493 	ld	(0x000e, x), a
                                    494 ;	src/main.c: 22: TIM2->ARRH=0;
      008206 CE 00 0F         [ 2]  495 	ldw	x, _TIM2+0
      008209 6F 0F            [ 1]  496 	clr	(0x000f, x)
                                    497 ;	src/main.c: 23: TIM2->ARRL=125;
      00820B CE 00 0F         [ 2]  498 	ldw	x, _TIM2+0
      00820E A6 7D            [ 1]  499 	ld	a, #0x7d
      008210 E7 10            [ 1]  500 	ld	(0x0010, x), a
                                    501 ;	src/main.c: 21: TIM2->PSCR=7;
      008212 CE 00 0F         [ 2]  502 	ldw	x, _TIM2+0
                                    503 ;	src/main.c: 24: TIM2->IER|=TIM_IER_UIE;
      008215 1C 00 03         [ 2]  504 	addw	x, #0x0003
      008218 F6               [ 1]  505 	ld	a, (x)
      008219 AA 01            [ 1]  506 	or	a, #0x01
      00821B F7               [ 1]  507 	ld	(x), a
                                    508 ;	src/main.c: 21: TIM2->PSCR=7;
      00821C CE 00 0F         [ 2]  509 	ldw	x, _TIM2+0
                                    510 ;	src/main.c: 25: TIM2->CR1|=TIM_CR1_CEN;
      00821F F6               [ 1]  511 	ld	a, (x)
      008220 AA 01            [ 1]  512 	or	a, #0x01
      008222 F7               [ 1]  513 	ld	(x), a
                                    514 ;	src/main.c: 26: uart_cfg(9600,0,UART_CR2_TEN|UART_CR2_REN,0,0,0,0,0);
      008223 4B 00            [ 1]  515 	push	#0x00
      008225 4B 00            [ 1]  516 	push	#0x00
      008227 4B 00            [ 1]  517 	push	#0x00
      008229 4B 00            [ 1]  518 	push	#0x00
      00822B 4B 00            [ 1]  519 	push	#0x00
      00822D 4B 0C            [ 1]  520 	push	#0x0c
      00822F 4B 00            [ 1]  521 	push	#0x00
      008231 4B 80            [ 1]  522 	push	#0x80
      008233 4B 25            [ 1]  523 	push	#0x25
      008235 CD 81 53         [ 4]  524 	call	_uart_cfg
      008238 5B 09            [ 2]  525 	addw	sp, #9
                                    526 ;	src/main.c: 27: gpio_cfg(GPIO_B,5,GPIO_OUT);
      00823A 4B 01            [ 1]  527 	push	#0x01
      00823C 4B 05            [ 1]  528 	push	#0x05
      00823E 3B 00 08         [ 1]  529 	push	_GPIO_B+1
      008241 3B 00 07         [ 1]  530 	push	_GPIO_B+0
      008244 CD 80 7F         [ 4]  531 	call	_gpio_cfg
      008247 5B 04            [ 2]  532 	addw	sp, #4
                                    533 ;	src/main.c: 28: int_all();
      008249 9A               [ 1]  534 	rim
                                    535 ;	src/main.c: 29: while(1)
      00824A                        536 00102$:
      00824A 20 FE            [ 2]  537 	jra	00102$
                                    538 ;	src/main.c: 33: }
      00824C 81               [ 4]  539 	ret
                                    540 	.area CODE
                                    541 	.area CONST
                                    542 	.area INITIALIZER
      008060                        543 __xinit__RST:
      008060 50 B3                  544 	.dw #0x50b3
      008062                        545 __xinit__CLK:
      008062 50 C0                  546 	.dw #0x50c0
      008064                        547 __xinit__GPIO_A:
      008064 50 00                  548 	.dw #0x5000
      008066                        549 __xinit__GPIO_B:
      008066 50 05                  550 	.dw #0x5005
      008068                        551 __xinit__GPIO_C:
      008068 50 0A                  552 	.dw #0x500a
      00806A                        553 __xinit__GPIO_D:
      00806A 50 0F                  554 	.dw #0x500f
      00806C                        555 __xinit__TIM1:
      00806C 52 50                  556 	.dw #0x5250
      00806E                        557 __xinit__TIM2:
      00806E 53 00                  558 	.dw #0x5300
      008070                        559 __xinit__TIM4:
      008070 53 40                  560 	.dw #0x5340
      008072                        561 __xinit__UART:
      008072 52 30                  562 	.dw #0x5230
      008074                        563 __xinit__EXTI:
      008074 50 A0                  564 	.dw #0x50a0
      008076                        565 __xinit__I2C:
      008076 52 10                  566 	.dw #0x5210
      008078                        567 __xinit__millis:
      008078 00 00                  568 	.dw #0x0000
                                    569 	.area CABS (ABS)
