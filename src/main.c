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
	uart_cfg(9600,0,UART_CR2_TEN|UART_CR2_REN,0,0,0,0,0);
	gpio_cfg(GPIO_B,5,GPIO_OUT);
	int_all();
	while(1)
	{
		
	}
}