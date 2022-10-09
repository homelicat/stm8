#define TIM_IER_BIE (1 << 7)
#define TIM_IER_TIE (1 << 6)
#define TIM_IER_COMIE (1 << 5)
#define TIM_IER_CC4IE (1 << 4)
#define TIM_IER_CC3IE (1 << 3)
#define TIM_IER_CC2IE (1 << 2)
#define TIM_IER_CC1IE (1 << 1)
#define TIM_IER_UIE (1 << 0)

#define TIM_CR1_APRE (1 << 7)
#define TIM_CR1_CMSH (1 << 6)
#define TIM_CR1_CMSL (1 << 5)
#define TIM_CR1_DIR (1 << 4)
#define TIM_CR1_OPM (1 << 3)
#define TIM_CR1_URS (1 << 2)
#define TIM_CR1_UDIS (1 << 1)
#define TIM_CR1_CEN (1 << 0)

#define TIM_SR1_BIF (1 << 7)
#define TIM_SR1_TIF (1 << 6)
#define TIM_SR1_COMIF (1 << 5)
#define TIM_SR1_CC4IF (1 << 4)
#define TIM_SR1_CC3IF (1 << 3)
#define TIM_SR1_CC2IF (1 << 2)
#define TIM_SR1_CC1IF (1 << 1)
#define TIM_SR1_UIF (1 << 0)

struct
{
	uint8_t CR1;
	uint8_t CR2;
	uint8_t SMCR;
	uint8_t ETR;
	uint8_t IER;
	uint8_t SR1;
	uint8_t SR2;
	uint8_t EGR;
	uint8_t CCMR1;
	uint8_t CCMR2;
	uint8_t CCMR3;
	uint8_t CCMR4;
	uint8_t CCER1;
	uint8_t CCER2;
	uint8_t CNTRH;
	uint8_t CNTRL;
	uint8_t PSCRH;
	uint8_t PSCRL;
	uint8_t ARRH;
	uint8_t ARRL;
	uint8_t RCR;
	uint8_t CCR1H;
	uint8_t CCR1L;
	uint8_t CCR2H;
	uint8_t CCR2L;
	uint8_t CCR3H;
	uint8_t CCR3L;
	uint8_t CCR4H;
	uint8_t CCR4L;
	uint8_t BKR;
	uint8_t DTR;
	uint8_t OISR;
} *TIM1 = 0x5250;

struct
{
	uint8_t CR1;
	uint8_t CR2;
	uint8_t SMCR;
	uint8_t IER;
	uint8_t SR1;
	uint8_t SR2;
	uint8_t EGR;
	uint8_t CCMR1;
	uint8_t CCMR2;
	uint8_t CCMR3;
	uint8_t CCER1;
	uint8_t CCER2;
	uint8_t CNTRH;
	uint8_t CNTRL;
	uint8_t PSCR;
	uint8_t ARRH;
	uint8_t ARRL;
	uint8_t CCR1H;
	uint8_t CCR1L;
	uint8_t CCR2H;
	uint8_t CCR2L;
	uint8_t CCR3H;
	uint8_t CCR3L;
} * TIM2 = 0x5300;

struct
{
	uint8_t CR1;
	uint8_t CR2;
	uint8_t SMCR;
	uint8_t IER;
	uint8_t SR;
	uint8_t EGR;
	uint8_t CNTR;
	uint8_t PSCR;
	uint8_t ARR;
} * TIM4 = 0x5340;

