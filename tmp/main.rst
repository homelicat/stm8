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
                                     13 	.globl _rst_get
                                     14 	.globl _millis
                                     15 	.globl _I2C
                                     16 	.globl _EXTI
                                     17 	.globl _UART
                                     18 	.globl _TIM4
                                     19 	.globl _TIM2
                                     20 	.globl _TIM1
                                     21 	.globl _GPIO_D
                                     22 	.globl _GPIO_C
                                     23 	.globl _GPIO_B
                                     24 	.globl _GPIO_A
                                     25 	.globl _CLK
                                     26 	.globl _RST
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
      000001                         35 _RST::
      000001                         36 	.ds 2
      000003                         37 _CLK::
      000003                         38 	.ds 2
      000005                         39 _GPIO_A::
      000005                         40 	.ds 2
      000007                         41 _GPIO_B::
      000007                         42 	.ds 2
      000009                         43 _GPIO_C::
      000009                         44 	.ds 2
      00000B                         45 _GPIO_D::
      00000B                         46 	.ds 2
      00000D                         47 _TIM1::
      00000D                         48 	.ds 2
      00000F                         49 _TIM2::
      00000F                         50 	.ds 2
      000011                         51 _TIM4::
      000011                         52 	.ds 2
      000013                         53 _UART::
      000013                         54 	.ds 2
      000015                         55 _EXTI::
      000015                         56 	.ds 2
      000017                         57 _I2C::
      000017                         58 	.ds 2
      000019                         59 _millis::
      000019                         60 	.ds 2
                                     61 ;--------------------------------------------------------
                                     62 ; Stack segment in internal ram 
                                     63 ;--------------------------------------------------------
                                     64 	.area	SSEG
      FFFFFF                         65 __start__stack:
      FFFFFF                         66 	.ds	1
                                     67 
                                     68 ;--------------------------------------------------------
                                     69 ; absolute external ram data
                                     70 ;--------------------------------------------------------
                                     71 	.area DABS (ABS)
                                     72 
                                     73 ; default segment ordering for linker
                                     74 	.area HOME
                                     75 	.area GSINIT
                                     76 	.area GSFINAL
                                     77 	.area CONST
                                     78 	.area INITIALIZER
                                     79 	.area CODE
                                     80 
                                     81 ;--------------------------------------------------------
                                     82 ; interrupt vector 
                                     83 ;--------------------------------------------------------
                                     84 	.area HOME
      008000                         85 __interrupt_vect:
      008000 82 00 80 43             86 	int s_GSINIT ; reset
      008004 82 00 00 00             87 	int 0x000000 ; trap
      008008 82 00 00 00             88 	int 0x000000 ; int0
      00800C 82 00 00 00             89 	int 0x000000 ; int1
      008010 82 00 00 00             90 	int 0x000000 ; int2
      008014 82 00 00 00             91 	int 0x000000 ; int3
      008018 82 00 00 00             92 	int 0x000000 ; int4
      00801C 82 00 00 00             93 	int 0x000000 ; int5
      008020 82 00 00 00             94 	int 0x000000 ; int6
      008024 82 00 00 00             95 	int 0x000000 ; int7
      008028 82 00 00 00             96 	int 0x000000 ; int8
      00802C 82 00 00 00             97 	int 0x000000 ; int9
      008030 82 00 00 00             98 	int 0x000000 ; int10
      008034 82 00 00 00             99 	int 0x000000 ; int11
      008038 82 00 00 00            100 	int 0x000000 ; int12
      00803C 82 00 80 7F            101 	int _tim2_update ; int13
                                    102 ;--------------------------------------------------------
                                    103 ; global & static initialisations
                                    104 ;--------------------------------------------------------
                                    105 	.area HOME
                                    106 	.area GSINIT
                                    107 	.area GSFINAL
                                    108 	.area GSINIT
      008043                        109 __sdcc_gs_init_startup:
      008043                        110 __sdcc_init_data:
                                    111 ; stm8_genXINIT() start
      008043 AE 00 00         [ 2]  112 	ldw x, #l_DATA
      008046 27 07            [ 1]  113 	jreq	00002$
      008048                        114 00001$:
      008048 72 4F 00 00      [ 1]  115 	clr (s_DATA - 1, x)
      00804C 5A               [ 2]  116 	decw x
      00804D 26 F9            [ 1]  117 	jrne	00001$
      00804F                        118 00002$:
      00804F AE 00 1A         [ 2]  119 	ldw	x, #l_INITIALIZER
      008052 27 09            [ 1]  120 	jreq	00004$
      008054                        121 00003$:
      008054 D6 80 5F         [ 1]  122 	ld	a, (s_INITIALIZER - 1, x)
      008057 D7 00 00         [ 1]  123 	ld	(s_INITIALIZED - 1, x), a
      00805A 5A               [ 2]  124 	decw	x
      00805B 26 F7            [ 1]  125 	jrne	00003$
      00805D                        126 00004$:
                                    127 ; stm8_genXINIT() end
                                    128 	.area GSFINAL
      00805D CC 80 40         [ 2]  129 	jp	__sdcc_program_startup
                                    130 ;--------------------------------------------------------
                                    131 ; Home
                                    132 ;--------------------------------------------------------
                                    133 	.area HOME
                                    134 	.area HOME
      008040                        135 __sdcc_program_startup:
      008040 CC 80 91         [ 2]  136 	jp	_main
                                    137 ;	return from main will return to caller
                                    138 ;--------------------------------------------------------
                                    139 ; code
                                    140 ;--------------------------------------------------------
                                    141 	.area CODE
                                    142 ;	src/core.c: 10: uint8_t rst_get()
                                    143 ;	-----------------------------------------
                                    144 ;	 function rst_get
                                    145 ;	-----------------------------------------
      00807A                        146 _rst_get:
                                    147 ;	src/core.c: 12: return RST->SR;
      00807A CE 00 01         [ 2]  148 	ldw	x, _RST+0
      00807D F6               [ 1]  149 	ld	a, (x)
                                    150 ;	src/core.c: 13: }
      00807E 81               [ 4]  151 	ret
                                    152 ;	src/main.c: 12: void tim2_update(void) __interrupt(13)
                                    153 ;	-----------------------------------------
                                    154 ;	 function tim2_update
                                    155 ;	-----------------------------------------
      00807F                        156 _tim2_update:
                                    157 ;	src/main.c: 14: millis+=1;
      00807F CE 00 19         [ 2]  158 	ldw	x, _millis+0
      008082 5C               [ 1]  159 	incw	x
      008083 CF 00 19         [ 2]  160 	ldw	_millis+0, x
                                    161 ;	src/main.c: 15: TIM2->SR1 &= ~TIM_SR1_UIF;
      008086 CE 00 0F         [ 2]  162 	ldw	x, _TIM2+0
      008089 1C 00 04         [ 2]  163 	addw	x, #0x0004
      00808C F6               [ 1]  164 	ld	a, (x)
      00808D A4 FE            [ 1]  165 	and	a, #0xfe
      00808F F7               [ 1]  166 	ld	(x), a
                                    167 ;	src/main.c: 16: }
      008090 80               [11]  168 	iret
                                    169 ;	src/main.c: 18: void main()
                                    170 ;	-----------------------------------------
                                    171 ;	 function main
                                    172 ;	-----------------------------------------
      008091                        173 _main:
                                    174 ;	src/main.c: 20: CLK->CKDIVR=0;
      008091 CE 00 03         [ 2]  175 	ldw	x, _CLK+0
      008094 6F 06            [ 1]  176 	clr	(0x0006, x)
                                    177 ;	src/main.c: 21: TIM2->PSCR=7;
      008096 CE 00 0F         [ 2]  178 	ldw	x, _TIM2+0
      008099 A6 07            [ 1]  179 	ld	a, #0x07
      00809B E7 0E            [ 1]  180 	ld	(0x000e, x), a
                                    181 ;	src/main.c: 22: TIM2->ARRH=0;
      00809D CE 00 0F         [ 2]  182 	ldw	x, _TIM2+0
      0080A0 6F 0F            [ 1]  183 	clr	(0x000f, x)
                                    184 ;	src/main.c: 23: TIM2->ARRL=125;
      0080A2 CE 00 0F         [ 2]  185 	ldw	x, _TIM2+0
      0080A5 A6 7D            [ 1]  186 	ld	a, #0x7d
      0080A7 E7 10            [ 1]  187 	ld	(0x0010, x), a
                                    188 ;	src/main.c: 21: TIM2->PSCR=7;
      0080A9 CE 00 0F         [ 2]  189 	ldw	x, _TIM2+0
                                    190 ;	src/main.c: 24: TIM2->IER|=TIM_IER_UIE;
      0080AC 1C 00 03         [ 2]  191 	addw	x, #0x0003
      0080AF F6               [ 1]  192 	ld	a, (x)
      0080B0 AA 01            [ 1]  193 	or	a, #0x01
      0080B2 F7               [ 1]  194 	ld	(x), a
                                    195 ;	src/main.c: 21: TIM2->PSCR=7;
      0080B3 CE 00 0F         [ 2]  196 	ldw	x, _TIM2+0
                                    197 ;	src/main.c: 25: TIM2->CR1|=TIM_CR1_CEN;
      0080B6 F6               [ 1]  198 	ld	a, (x)
      0080B7 AA 01            [ 1]  199 	or	a, #0x01
      0080B9 F7               [ 1]  200 	ld	(x), a
                                    201 ;	src/main.c: 26: UART_BAUD(9600);
      0080BA CE 00 13         [ 2]  202 	ldw	x, _UART+0
      0080BD A6 02            [ 1]  203 	ld	a, #0x02
      0080BF E7 03            [ 1]  204 	ld	(0x0003, x), a
      0080C1 CE 00 13         [ 2]  205 	ldw	x, _UART+0
      0080C4 5C               [ 1]  206 	incw	x
      0080C5 5C               [ 1]  207 	incw	x
      0080C6 A6 68            [ 1]  208 	ld	a, #0x68
      0080C8 F7               [ 1]  209 	ld	(x), a
      0080C9 CE 00 13         [ 2]  210 	ldw	x, _UART+0
                                    211 ;	src/main.c: 27: UART_TEN();
      0080CC 1C 00 05         [ 2]  212 	addw	x, #0x0005
      0080CF F6               [ 1]  213 	ld	a, (x)
      0080D0 AA 08            [ 1]  214 	or	a, #0x08
      0080D2 F7               [ 1]  215 	ld	(x), a
                                    216 ;	src/main.c: 26: UART_BAUD(9600);
      0080D3 CE 00 13         [ 2]  217 	ldw	x, _UART+0
                                    218 ;	src/main.c: 27: UART_TEN();
      0080D6 1C 00 05         [ 2]  219 	addw	x, #0x0005
                                    220 ;	src/main.c: 28: UART_REN();
      0080D9 F6               [ 1]  221 	ld	a, (x)
      0080DA AA 04            [ 1]  222 	or	a, #0x04
      0080DC F7               [ 1]  223 	ld	(x), a
                                    224 ;	src/main.c: 29: GPIO_OUT(GPIO_B,5);
      0080DD CE 00 07         [ 2]  225 	ldw	x, _GPIO_B+0
      0080E0 5C               [ 1]  226 	incw	x
      0080E1 5C               [ 1]  227 	incw	x
      0080E2 F6               [ 1]  228 	ld	a, (x)
      0080E3 AA 20            [ 1]  229 	or	a, #0x20
      0080E5 F7               [ 1]  230 	ld	(x), a
                                    231 ;	src/main.c: 30: int_all();
      0080E6 9A               [ 1]  232 	rim
                                    233 ;	src/main.c: 31: while(1)
      0080E7                        234 00102$:
      0080E7 20 FE            [ 2]  235 	jra	00102$
                                    236 ;	src/main.c: 35: }
      0080E9 81               [ 4]  237 	ret
                                    238 	.area CODE
                                    239 	.area CONST
                                    240 	.area INITIALIZER
      008060                        241 __xinit__RST:
      008060 50 B3                  242 	.dw #0x50b3
      008062                        243 __xinit__CLK:
      008062 50 C0                  244 	.dw #0x50c0
      008064                        245 __xinit__GPIO_A:
      008064 50 00                  246 	.dw #0x5000
      008066                        247 __xinit__GPIO_B:
      008066 50 05                  248 	.dw #0x5005
      008068                        249 __xinit__GPIO_C:
      008068 50 0A                  250 	.dw #0x500a
      00806A                        251 __xinit__GPIO_D:
      00806A 50 0F                  252 	.dw #0x500f
      00806C                        253 __xinit__TIM1:
      00806C 52 50                  254 	.dw #0x5250
      00806E                        255 __xinit__TIM2:
      00806E 53 00                  256 	.dw #0x5300
      008070                        257 __xinit__TIM4:
      008070 53 40                  258 	.dw #0x5340
      008072                        259 __xinit__UART:
      008072 52 30                  260 	.dw #0x5230
      008074                        261 __xinit__EXTI:
      008074 50 A0                  262 	.dw #0x50a0
      008076                        263 __xinit__I2C:
      008076 52 10                  264 	.dw #0x5210
      008078                        265 __xinit__millis:
      008078 00 00                  266 	.dw #0x0000
                                    267 	.area CABS (ABS)
