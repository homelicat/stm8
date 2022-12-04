#include <stdint.h>
#include <core.c>
#include <clock.c>
#include <gpio.c>
#include <timer.c>
#include <uart.c>
#include <int.c>
#include <i2c.c>

unsigned int millis = 0;

void tim2_update(void) __interrupt(13)
{
	millis+=1;
	TIM2->SR1 &= ~TIM_SR1_UIF;
}

void main()
{
	CLK->CKDIVR=0;
	TIM2->PSCR=7;
	TIM2->ARRH=0;
	TIM2->ARRL=125;
	TIM2->IER|=TIM_IER_UIE;
	TIM2->CR1|=TIM_CR1_CEN;
	UART_BAUD(9600);
	UART_TEN();
	UART_REN();
	GPIO_OUT(GPIO_B,5);
	int_all();
	while(1)
	{
		
	}
}