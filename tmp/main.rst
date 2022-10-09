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
                                     15 	.globl _uart_cfg
                                     16 	.globl _gpio_get
                                     17 	.globl _gpio_set
                                     18 	.globl _gpio_cfg
                                     19 	.globl _millis
                                     20 	.globl _EXTI
                                     21 	.globl _UART
                                     22 	.globl _TIM4
                                     23 	.globl _TIM2
                                     24 	.globl _TIM1
                                     25 	.globl _GPIO_D
                                     26 	.globl _GPIO_C
                                     27 	.globl _GPIO_B
                                     28 	.globl _GPIO_A
                                     29 	.globl _CLK
                                     30 	.globl _RST
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
      000001                         39 _RST::
      000001                         40 	.ds 2
      000003                         41 _CLK::
      000003                         42 	.ds 2
      000005                         43 _GPIO_A::
      000005                         44 	.ds 2
      000007                         45 _GPIO_B::
      000007                         46 	.ds 2
      000009                         47 _GPIO_C::
      000009                         48 	.ds 2
      00000B                         49 _GPIO_D::
      00000B                         50 	.ds 2
      00000D                         51 _TIM1::
      00000D                         52 	.ds 2
      00000F                         53 _TIM2::
      00000F                         54 	.ds 2
      000011                         55 _TIM4::
      000011                         56 	.ds 2
      000013                         57 _UART::
      000013                         58 	.ds 2
      000015                         59 _EXTI::
      000015                         60 	.ds 2
      000017                         61 _millis::
      000017                         62 	.ds 2
                                     63 ;--------------------------------------------------------
                                     64 ; Stack segment in internal ram 
                                     65 ;--------------------------------------------------------
                                     66 	.area	SSEG
      FFFFFF                         67 __start__stack:
      FFFFFF                         68 	.ds	1
                                     69 
                                     70 ;--------------------------------------------------------
                                     71 ; absolute external ram data
                                     72 ;--------------------------------------------------------
                                     73 	.area DABS (ABS)
                                     74 
                                     75 ; default segment ordering for linker
                                     76 	.area HOME
                                     77 	.area GSINIT
                                     78 	.area GSFINAL
                                     79 	.area CONST
                                     80 	.area INITIALIZER
                                     81 	.area CODE
                                     82 
                                     83 ;--------------------------------------------------------
                                     84 ; interrupt vector 
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
      008000                         87 __interrupt_vect:
      008000 82 00 80 43             88 	int s_GSINIT ; reset
      008004 82 00 00 00             89 	int 0x000000 ; trap
      008008 82 00 00 00             90 	int 0x000000 ; int0
      00800C 82 00 00 00             91 	int 0x000000 ; int1
      008010 82 00 00 00             92 	int 0x000000 ; int2
      008014 82 00 00 00             93 	int 0x000000 ; int3
      008018 82 00 00 00             94 	int 0x000000 ; int4
      00801C 82 00 00 00             95 	int 0x000000 ; int5
      008020 82 00 00 00             96 	int 0x000000 ; int6
      008024 82 00 00 00             97 	int 0x000000 ; int7
      008028 82 00 00 00             98 	int 0x000000 ; int8
      00802C 82 00 00 00             99 	int 0x000000 ; int9
      008030 82 00 00 00            100 	int 0x000000 ; int10
      008034 82 00 00 00            101 	int 0x000000 ; int11
      008038 82 00 00 00            102 	int 0x000000 ; int12
      00803C 82 00 81 B7            103 	int _tim2_update ; int13
                                    104 ;--------------------------------------------------------
                                    105 ; global & static initialisations
                                    106 ;--------------------------------------------------------
                                    107 	.area HOME
                                    108 	.area GSINIT
                                    109 	.area GSFINAL
                                    110 	.area GSINIT
      008043                        111 __sdcc_gs_init_startup:
      008043                        112 __sdcc_init_data:
                                    113 ; stm8_genXINIT() start
      008043 AE 00 00         [ 2]  114 	ldw x, #l_DATA
      008046 27 07            [ 1]  115 	jreq	00002$
      008048                        116 00001$:
      008048 72 4F 00 00      [ 1]  117 	clr (s_DATA - 1, x)
      00804C 5A               [ 2]  118 	decw x
      00804D 26 F9            [ 1]  119 	jrne	00001$
      00804F                        120 00002$:
      00804F AE 00 18         [ 2]  121 	ldw	x, #l_INITIALIZER
      008052 27 09            [ 1]  122 	jreq	00004$
      008054                        123 00003$:
      008054 D6 80 5F         [ 1]  124 	ld	a, (s_INITIALIZER - 1, x)
      008057 D7 00 00         [ 1]  125 	ld	(s_INITIALIZED - 1, x), a
      00805A 5A               [ 2]  126 	decw	x
      00805B 26 F7            [ 1]  127 	jrne	00003$
      00805D                        128 00004$:
                                    129 ; stm8_genXINIT() end
                                    130 	.area GSFINAL
      00805D CC 80 40         [ 2]  131 	jp	__sdcc_program_startup
                                    132 ;--------------------------------------------------------
                                    133 ; Home
                                    134 ;--------------------------------------------------------
                                    135 	.area HOME
                                    136 	.area HOME
      008040                        137 __sdcc_program_startup:
      008040 CC 81 C9         [ 2]  138 	jp	_main
                                    139 ;	return from main will return to caller
                                    140 ;--------------------------------------------------------
                                    141 ; code
                                    142 ;--------------------------------------------------------
                                    143 	.area CODE
                                    144 ;	src/gpio.c: 24: void gpio_cfg(struct PORT * port, uint8_t pin, uint8_t cfg)
                                    145 ;	-----------------------------------------
                                    146 ;	 function gpio_cfg
                                    147 ;	-----------------------------------------
      008078                        148 _gpio_cfg:
      008078 52 06            [ 2]  149 	sub	sp, #6
                                    150 ;	src/gpio.c: 26: port->DDR |= ((cfg&(1<<0))>0)<<pin;
      00807A 16 09            [ 2]  151 	ldw	y, (0x09, sp)
      00807C 17 01            [ 2]  152 	ldw	(0x01, sp), y
      00807E 93               [ 1]  153 	ldw	x, y
      00807F 5C               [ 1]  154 	incw	x
      008080 5C               [ 1]  155 	incw	x
      008081 1F 05            [ 2]  156 	ldw	(0x05, sp), x
      008083 F6               [ 1]  157 	ld	a, (x)
      008084 90 97            [ 1]  158 	ld	yl, a
      008086 7B 0C            [ 1]  159 	ld	a, (0x0c, sp)
      008088 44               [ 1]  160 	srl	a
      008089 24 03            [ 1]  161 	jrnc	00103$
      00808B 5F               [ 1]  162 	clrw	x
      00808C 5C               [ 1]  163 	incw	x
      00808D 21                     164 	.byte 0x21
      00808E                        165 00103$:
      00808E 5F               [ 1]  166 	clrw	x
      00808F                        167 00104$:
      00808F 7B 0B            [ 1]  168 	ld	a, (0x0b, sp)
      008091 6B 03            [ 1]  169 	ld	(0x03, sp), a
      008093 27 06            [ 1]  170 	jreq	00126$
      008095                        171 00125$:
      008095 41               [ 1]  172 	exg	a, xl
      008096 48               [ 1]  173 	sll	a
      008097 41               [ 1]  174 	exg	a, xl
      008098 4A               [ 1]  175 	dec	a
      008099 26 FA            [ 1]  176 	jrne	00125$
      00809B                        177 00126$:
      00809B 90 9F            [ 1]  178 	ld	a, yl
      00809D 89               [ 2]  179 	pushw	x
      00809E 1A 02            [ 1]  180 	or	a, (2, sp)
      0080A0 85               [ 2]  181 	popw	x
      0080A1 1E 05            [ 2]  182 	ldw	x, (0x05, sp)
      0080A3 F7               [ 1]  183 	ld	(x), a
                                    184 ;	src/gpio.c: 27: port->CR1 |= ((cfg&(1<<1))>0)<<pin;
      0080A4 1E 01            [ 2]  185 	ldw	x, (0x01, sp)
      0080A6 1C 00 03         [ 2]  186 	addw	x, #0x0003
      0080A9 1F 04            [ 2]  187 	ldw	(0x04, sp), x
      0080AB F6               [ 1]  188 	ld	a, (x)
      0080AC 6B 06            [ 1]  189 	ld	(0x06, sp), a
      0080AE 7B 0C            [ 1]  190 	ld	a, (0x0c, sp)
      0080B0 A5 02            [ 1]  191 	bcp	a, #0x02
      0080B2 27 03            [ 1]  192 	jreq	00105$
      0080B4 5F               [ 1]  193 	clrw	x
      0080B5 5C               [ 1]  194 	incw	x
      0080B6 21                     195 	.byte 0x21
      0080B7                        196 00105$:
      0080B7 5F               [ 1]  197 	clrw	x
      0080B8                        198 00106$:
      0080B8 7B 03            [ 1]  199 	ld	a, (0x03, sp)
      0080BA 27 06            [ 1]  200 	jreq	00129$
      0080BC                        201 00128$:
      0080BC 41               [ 1]  202 	exg	a, xl
      0080BD 48               [ 1]  203 	sll	a
      0080BE 41               [ 1]  204 	exg	a, xl
      0080BF 4A               [ 1]  205 	dec	a
      0080C0 26 FA            [ 1]  206 	jrne	00128$
      0080C2                        207 00129$:
      0080C2 7B 06            [ 1]  208 	ld	a, (0x06, sp)
      0080C4 89               [ 2]  209 	pushw	x
      0080C5 1A 02            [ 1]  210 	or	a, (2, sp)
      0080C7 85               [ 2]  211 	popw	x
      0080C8 1E 04            [ 2]  212 	ldw	x, (0x04, sp)
      0080CA F7               [ 1]  213 	ld	(x), a
                                    214 ;	src/gpio.c: 28: port->CR2 |= ((cfg&(1<<2))>0)<<pin;
      0080CB 1E 01            [ 2]  215 	ldw	x, (0x01, sp)
      0080CD 1C 00 04         [ 2]  216 	addw	x, #0x0004
      0080D0 1F 05            [ 2]  217 	ldw	(0x05, sp), x
      0080D2 F6               [ 1]  218 	ld	a, (x)
      0080D3 6B 04            [ 1]  219 	ld	(0x04, sp), a
      0080D5 7B 0C            [ 1]  220 	ld	a, (0x0c, sp)
      0080D7 A5 04            [ 1]  221 	bcp	a, #0x04
      0080D9 27 03            [ 1]  222 	jreq	00107$
      0080DB 5F               [ 1]  223 	clrw	x
      0080DC 5C               [ 1]  224 	incw	x
      0080DD 21                     225 	.byte 0x21
      0080DE                        226 00107$:
      0080DE 5F               [ 1]  227 	clrw	x
      0080DF                        228 00108$:
      0080DF 7B 03            [ 1]  229 	ld	a, (0x03, sp)
      0080E1 27 06            [ 1]  230 	jreq	00132$
      0080E3                        231 00131$:
      0080E3 41               [ 1]  232 	exg	a, xl
      0080E4 48               [ 1]  233 	sll	a
      0080E5 41               [ 1]  234 	exg	a, xl
      0080E6 4A               [ 1]  235 	dec	a
      0080E7 26 FA            [ 1]  236 	jrne	00131$
      0080E9                        237 00132$:
      0080E9 7B 04            [ 1]  238 	ld	a, (0x04, sp)
      0080EB 89               [ 2]  239 	pushw	x
      0080EC 1A 02            [ 1]  240 	or	a, (2, sp)
      0080EE 85               [ 2]  241 	popw	x
      0080EF 1E 05            [ 2]  242 	ldw	x, (0x05, sp)
      0080F1 F7               [ 1]  243 	ld	(x), a
                                    244 ;	src/gpio.c: 29: }
      0080F2 5B 06            [ 2]  245 	addw	sp, #6
      0080F4 81               [ 4]  246 	ret
                                    247 ;	src/gpio.c: 31: void gpio_set(struct PORT * port, uint8_t pin, uint8_t state)
                                    248 ;	-----------------------------------------
                                    249 ;	 function gpio_set
                                    250 ;	-----------------------------------------
      0080F5                        251 _gpio_set:
      0080F5 52 03            [ 2]  252 	sub	sp, #3
                                    253 ;	src/gpio.c: 33: port->ODR ^= (port->ODR)^((state>0)<<pin);
      0080F7 1E 06            [ 2]  254 	ldw	x, (0x06, sp)
      0080F9 1F 01            [ 2]  255 	ldw	(0x01, sp), x
      0080FB F6               [ 1]  256 	ld	a, (x)
      0080FC 90 97            [ 1]  257 	ld	yl, a
      0080FE 6B 03            [ 1]  258 	ld	(0x03, sp), a
      008100 61               [ 1]  259 	exg	a, yl
      008101 0D 09            [ 1]  260 	tnz	(0x09, sp)
      008103 27 03            [ 1]  261 	jreq	00103$
      008105 5F               [ 1]  262 	clrw	x
      008106 5C               [ 1]  263 	incw	x
      008107 21                     264 	.byte 0x21
      008108                        265 00103$:
      008108 5F               [ 1]  266 	clrw	x
      008109                        267 00104$:
      008109 7B 08            [ 1]  268 	ld	a, (0x08, sp)
      00810B 27 06            [ 1]  269 	jreq	00112$
      00810D                        270 00111$:
      00810D 41               [ 1]  271 	exg	a, xl
      00810E 48               [ 1]  272 	sll	a
      00810F 41               [ 1]  273 	exg	a, xl
      008110 4A               [ 1]  274 	dec	a
      008111 26 FA            [ 1]  275 	jrne	00111$
      008113                        276 00112$:
      008113 7B 03            [ 1]  277 	ld	a, (0x03, sp)
      008115 89               [ 2]  278 	pushw	x
      008116 18 02            [ 1]  279 	xor	a, (2, sp)
      008118 85               [ 2]  280 	popw	x
      008119 93               [ 1]  281 	ldw	x, y
      00811A 89               [ 2]  282 	pushw	x
      00811B 18 02            [ 1]  283 	xor	a, (2, sp)
      00811D 85               [ 2]  284 	popw	x
      00811E 1E 01            [ 2]  285 	ldw	x, (0x01, sp)
      008120 F7               [ 1]  286 	ld	(x), a
                                    287 ;	src/gpio.c: 34: }
      008121 5B 03            [ 2]  288 	addw	sp, #3
      008123 81               [ 4]  289 	ret
                                    290 ;	src/gpio.c: 36: uint8_t gpio_get(struct PORT * port, uint8_t pin)
                                    291 ;	-----------------------------------------
                                    292 ;	 function gpio_get
                                    293 ;	-----------------------------------------
      008124                        294 _gpio_get:
                                    295 ;	src/gpio.c: 38: return ((port->IDR&(1<<pin))>0);
      008124 1E 03            [ 2]  296 	ldw	x, (0x03, sp)
      008126 E6 01            [ 1]  297 	ld	a, (0x1, x)
      008128 90 97            [ 1]  298 	ld	yl, a
      00812A 7B 05            [ 1]  299 	ld	a, (0x05, sp)
      00812C 5F               [ 1]  300 	clrw	x
      00812D 5C               [ 1]  301 	incw	x
      00812E 4D               [ 1]  302 	tnz	a
      00812F 27 04            [ 1]  303 	jreq	00104$
      008131                        304 00103$:
      008131 58               [ 2]  305 	sllw	x
      008132 4A               [ 1]  306 	dec	a
      008133 26 FC            [ 1]  307 	jrne	00103$
      008135                        308 00104$:
      008135 4F               [ 1]  309 	clr	a
      008136 89               [ 2]  310 	pushw	x
      008137 14 01            [ 1]  311 	and	a, (1, sp)
      008139 85               [ 2]  312 	popw	x
      00813A 95               [ 1]  313 	ld	xh, a
      00813B 89               [ 2]  314 	pushw	x
      00813C 90 9F            [ 1]  315 	ld	a, yl
      00813E 14 02            [ 1]  316 	and	a, (2, sp)
      008140 85               [ 2]  317 	popw	x
      008141 97               [ 1]  318 	ld	xl, a
      008142 A3 00 00         [ 2]  319 	cpw	x, #0x0000
      008145 2C 02            [ 1]  320 	jrsgt	00105$
      008147 4F               [ 1]  321 	clr	a
      008148 81               [ 4]  322 	ret
      008149                        323 00105$:
      008149 A6 01            [ 1]  324 	ld	a, #0x01
                                    325 ;	src/gpio.c: 39: }
      00814B 81               [ 4]  326 	ret
                                    327 ;	src/uart.c: 62: void uart_cfg(int baud, uint8_t cr1, uint8_t cr2, uint8_t cr3)
                                    328 ;	-----------------------------------------
                                    329 ;	 function uart_cfg
                                    330 ;	-----------------------------------------
      00814C                        331 _uart_cfg:
      00814C 52 04            [ 2]  332 	sub	sp, #4
                                    333 ;	src/uart.c: 64: UART->CR1 = cr1;
      00814E CE 00 13         [ 2]  334 	ldw	x, _UART+0
      008151 7B 09            [ 1]  335 	ld	a, (0x09, sp)
      008153 E7 04            [ 1]  336 	ld	(0x0004, x), a
                                    337 ;	src/uart.c: 65: UART->CR2 = cr2;
      008155 CE 00 13         [ 2]  338 	ldw	x, _UART+0
      008158 7B 0A            [ 1]  339 	ld	a, (0x0a, sp)
      00815A E7 05            [ 1]  340 	ld	(0x0005, x), a
                                    341 ;	src/uart.c: 66: UART->CR3 = cr3;
      00815C CE 00 13         [ 2]  342 	ldw	x, _UART+0
      00815F 7B 0B            [ 1]  343 	ld	a, (0x0b, sp)
      008161 E7 06            [ 1]  344 	ld	(0x0006, x), a
                                    345 ;	src/uart.c: 67: uint16_t div = F_MASTER/baud;
      008163 16 07            [ 2]  346 	ldw	y, (0x07, sp)
      008165 5F               [ 1]  347 	clrw	x
      008166 90 5D            [ 2]  348 	tnzw	y
      008168 2A 01            [ 1]  349 	jrpl	00103$
      00816A 5A               [ 2]  350 	decw	x
      00816B                        351 00103$:
      00816B 90 89            [ 2]  352 	pushw	y
      00816D 89               [ 2]  353 	pushw	x
      00816E 4B 00            [ 1]  354 	push	#0x00
      008170 4B 24            [ 1]  355 	push	#0x24
      008172 4B F4            [ 1]  356 	push	#0xf4
      008174 4B 00            [ 1]  357 	push	#0x00
      008176 CD 82 4D         [ 4]  358 	call	__divulong
      008179 5B 08            [ 2]  359 	addw	sp, #8
      00817B 51               [ 1]  360 	exgw	x, y
                                    361 ;	src/uart.c: 68: UART->BRR2 = ((div & 0xF000)>>8)|(div & 0x000F);
      00817C CE 00 13         [ 2]  362 	ldw	x, _UART+0
      00817F 1C 00 03         [ 2]  363 	addw	x, #0x0003
      008182 1F 01            [ 2]  364 	ldw	(0x01, sp), x
      008184 93               [ 1]  365 	ldw	x, y
      008185 0F 04            [ 1]  366 	clr	(0x04, sp)
      008187 9E               [ 1]  367 	ld	a, xh
      008188 A4 F0            [ 1]  368 	and	a, #0xf0
      00818A 5F               [ 1]  369 	clrw	x
      00818B 97               [ 1]  370 	ld	xl, a
      00818C 90 9F            [ 1]  371 	ld	a, yl
      00818E A4 0F            [ 1]  372 	and	a, #0x0f
      008190 89               [ 2]  373 	pushw	x
      008191 1A 02            [ 1]  374 	or	a, (2, sp)
      008193 85               [ 2]  375 	popw	x
      008194 1E 01            [ 2]  376 	ldw	x, (0x01, sp)
      008196 F7               [ 1]  377 	ld	(x), a
                                    378 ;	src/uart.c: 69: UART->BRR1 = (div >> 4) & 0x00FF;
      008197 CE 00 13         [ 2]  379 	ldw	x, _UART+0
      00819A 5C               [ 1]  380 	incw	x
      00819B 5C               [ 1]  381 	incw	x
      00819C A6 10            [ 1]  382 	ld	a, #0x10
      00819E 90 62            [ 2]  383 	div	y, a
      0081A0 90 9F            [ 1]  384 	ld	a, yl
      0081A2 F7               [ 1]  385 	ld	(x), a
                                    386 ;	src/uart.c: 70: }
      0081A3 5B 04            [ 2]  387 	addw	sp, #4
      0081A5 81               [ 4]  388 	ret
                                    389 ;	src/uart.c: 72: uint8_t uart_recv()
                                    390 ;	-----------------------------------------
                                    391 ;	 function uart_recv
                                    392 ;	-----------------------------------------
      0081A6                        393 _uart_recv:
                                    394 ;	src/uart.c: 74: return UART->DR;
      0081A6 CE 00 13         [ 2]  395 	ldw	x, _UART+0
      0081A9 E6 01            [ 1]  396 	ld	a, (0x1, x)
                                    397 ;	src/uart.c: 75: }
      0081AB 81               [ 4]  398 	ret
                                    399 ;	src/uart.c: 77: void uart_send(uint8_t data)
                                    400 ;	-----------------------------------------
                                    401 ;	 function uart_send
                                    402 ;	-----------------------------------------
      0081AC                        403 _uart_send:
                                    404 ;	src/uart.c: 79: while(!((UART->SR)&(1<<7)));
      0081AC                        405 00101$:
      0081AC CE 00 13         [ 2]  406 	ldw	x, _UART+0
      0081AF F6               [ 1]  407 	ld	a, (x)
      0081B0 2A FA            [ 1]  408 	jrpl	00101$
                                    409 ;	src/uart.c: 80: UART->DR = data;
      0081B2 5C               [ 1]  410 	incw	x
      0081B3 7B 03            [ 1]  411 	ld	a, (0x03, sp)
      0081B5 F7               [ 1]  412 	ld	(x), a
                                    413 ;	src/uart.c: 81: }
      0081B6 81               [ 4]  414 	ret
                                    415 ;	src/main.c: 11: void tim2_update(void) __interrupt(13)
                                    416 ;	-----------------------------------------
                                    417 ;	 function tim2_update
                                    418 ;	-----------------------------------------
      0081B7                        419 _tim2_update:
                                    420 ;	src/main.c: 13: millis+=1;
      0081B7 CE 00 17         [ 2]  421 	ldw	x, _millis+0
      0081BA 5C               [ 1]  422 	incw	x
      0081BB CF 00 17         [ 2]  423 	ldw	_millis+0, x
                                    424 ;	src/main.c: 14: TIM2->SR1 &= ~TIM_SR1_UIF;
      0081BE CE 00 0F         [ 2]  425 	ldw	x, _TIM2+0
      0081C1 1C 00 04         [ 2]  426 	addw	x, #0x0004
      0081C4 F6               [ 1]  427 	ld	a, (x)
      0081C5 A4 FE            [ 1]  428 	and	a, #0xfe
      0081C7 F7               [ 1]  429 	ld	(x), a
                                    430 ;	src/main.c: 15: }
      0081C8 80               [11]  431 	iret
                                    432 ;	src/main.c: 17: void main()
                                    433 ;	-----------------------------------------
                                    434 ;	 function main
                                    435 ;	-----------------------------------------
      0081C9                        436 _main:
      0081C9 52 02            [ 2]  437 	sub	sp, #2
                                    438 ;	src/main.c: 19: CLK->CKDIVR=0;
      0081CB CE 00 03         [ 2]  439 	ldw	x, _CLK+0
      0081CE 6F 06            [ 1]  440 	clr	(0x0006, x)
                                    441 ;	src/main.c: 20: TIM2->PSCR=7;
      0081D0 CE 00 0F         [ 2]  442 	ldw	x, _TIM2+0
      0081D3 A6 07            [ 1]  443 	ld	a, #0x07
      0081D5 E7 0E            [ 1]  444 	ld	(0x000e, x), a
                                    445 ;	src/main.c: 21: TIM2->ARRH=0;
      0081D7 CE 00 0F         [ 2]  446 	ldw	x, _TIM2+0
      0081DA 6F 0F            [ 1]  447 	clr	(0x000f, x)
                                    448 ;	src/main.c: 22: TIM2->ARRL=125;
      0081DC CE 00 0F         [ 2]  449 	ldw	x, _TIM2+0
      0081DF A6 7D            [ 1]  450 	ld	a, #0x7d
      0081E1 E7 10            [ 1]  451 	ld	(0x0010, x), a
                                    452 ;	src/main.c: 20: TIM2->PSCR=7;
      0081E3 CE 00 0F         [ 2]  453 	ldw	x, _TIM2+0
                                    454 ;	src/main.c: 23: TIM2->IER|=TIM_IER_UIE;
      0081E6 1C 00 03         [ 2]  455 	addw	x, #0x0003
      0081E9 F6               [ 1]  456 	ld	a, (x)
      0081EA AA 01            [ 1]  457 	or	a, #0x01
      0081EC F7               [ 1]  458 	ld	(x), a
                                    459 ;	src/main.c: 20: TIM2->PSCR=7;
      0081ED CE 00 0F         [ 2]  460 	ldw	x, _TIM2+0
                                    461 ;	src/main.c: 24: TIM2->CR1|=TIM_CR1_CEN;
      0081F0 F6               [ 1]  462 	ld	a, (x)
      0081F1 AA 01            [ 1]  463 	or	a, #0x01
      0081F3 F7               [ 1]  464 	ld	(x), a
                                    465 ;	src/main.c: 25: uart_cfg(9600,0,UART_CR2_TEN,0);
      0081F4 4B 00            [ 1]  466 	push	#0x00
      0081F6 4B 08            [ 1]  467 	push	#0x08
      0081F8 4B 00            [ 1]  468 	push	#0x00
      0081FA 4B 80            [ 1]  469 	push	#0x80
      0081FC 4B 25            [ 1]  470 	push	#0x25
      0081FE CD 81 4C         [ 4]  471 	call	_uart_cfg
      008201 5B 05            [ 2]  472 	addw	sp, #5
                                    473 ;	src/main.c: 26: gpio_cfg(GPIO_B,5,GPIO_OUT);
      008203 4B 01            [ 1]  474 	push	#0x01
      008205 4B 05            [ 1]  475 	push	#0x05
      008207 3B 00 08         [ 1]  476 	push	_GPIO_B+1
      00820A 3B 00 07         [ 1]  477 	push	_GPIO_B+0
      00820D CD 80 78         [ 4]  478 	call	_gpio_cfg
      008210 5B 04            [ 2]  479 	addw	sp, #4
                                    480 ;	src/main.c: 27: int_all();
      008212 9A               [ 1]  481 	rim
                                    482 ;	src/main.c: 28: while(1)
      008213                        483 00105$:
                                    484 ;	src/main.c: 30: unsigned int old = millis;
      008213 CE 00 17         [ 2]  485 	ldw	x, _millis+0
      008216 1F 01            [ 2]  486 	ldw	(0x01, sp), x
                                    487 ;	src/main.c: 31: while(millis-old<1000);
      008218                        488 00101$:
      008218 CE 00 17         [ 2]  489 	ldw	x, _millis+0
      00821B 72 F0 01         [ 2]  490 	subw	x, (0x01, sp)
      00821E A3 03 E8         [ 2]  491 	cpw	x, #0x03e8
      008221 25 F5            [ 1]  492 	jrc	00101$
                                    493 ;	src/main.c: 32: gpio_set(GPIO_B,5,!gpio_get(GPIO_B,5));
      008223 4B 05            [ 1]  494 	push	#0x05
      008225 3B 00 08         [ 1]  495 	push	_GPIO_B+1
      008228 3B 00 07         [ 1]  496 	push	_GPIO_B+0
      00822B CD 81 24         [ 4]  497 	call	_gpio_get
      00822E 5B 03            [ 2]  498 	addw	sp, #3
      008230 A0 01            [ 1]  499 	sub	a, #0x01
      008232 4F               [ 1]  500 	clr	a
      008233 49               [ 1]  501 	rlc	a
      008234 88               [ 1]  502 	push	a
      008235 4B 05            [ 1]  503 	push	#0x05
      008237 3B 00 08         [ 1]  504 	push	_GPIO_B+1
      00823A 3B 00 07         [ 1]  505 	push	_GPIO_B+0
      00823D CD 80 F5         [ 4]  506 	call	_gpio_set
      008240 5B 04            [ 2]  507 	addw	sp, #4
                                    508 ;	src/main.c: 33: uart_send('A');
      008242 4B 41            [ 1]  509 	push	#0x41
      008244 CD 81 AC         [ 4]  510 	call	_uart_send
      008247 84               [ 1]  511 	pop	a
      008248 20 C9            [ 2]  512 	jra	00105$
                                    513 ;	src/main.c: 35: }
      00824A 5B 02            [ 2]  514 	addw	sp, #2
      00824C 81               [ 4]  515 	ret
                                    516 	.area CODE
                                    517 	.area CONST
                                    518 	.area INITIALIZER
      008060                        519 __xinit__RST:
      008060 50 B3                  520 	.dw #0x50b3
      008062                        521 __xinit__CLK:
      008062 50 C0                  522 	.dw #0x50c0
      008064                        523 __xinit__GPIO_A:
      008064 50 00                  524 	.dw #0x5000
      008066                        525 __xinit__GPIO_B:
      008066 50 05                  526 	.dw #0x5005
      008068                        527 __xinit__GPIO_C:
      008068 50 0A                  528 	.dw #0x500a
      00806A                        529 __xinit__GPIO_D:
      00806A 50 0F                  530 	.dw #0x500f
      00806C                        531 __xinit__TIM1:
      00806C 52 50                  532 	.dw #0x5250
      00806E                        533 __xinit__TIM2:
      00806E 53 00                  534 	.dw #0x5300
      008070                        535 __xinit__TIM4:
      008070 53 40                  536 	.dw #0x5340
      008072                        537 __xinit__UART:
      008072 52 30                  538 	.dw #0x5230
      008074                        539 __xinit__EXTI:
      008074 50 A0                  540 	.dw #0x50a0
      008076                        541 __xinit__millis:
      008076 00 00                  542 	.dw #0x0000
                                    543 	.area CABS (ABS)
