#define UART_CR1_WAKE (1<<3) //Wakeup method
#define UART_CR1_PCEN (1<<2) //Parity control enable
#define UART_CR1_PS (1<<1) //Parity selection
#define UART_CR1_PIEN (1<<0) //Parity interrupt enable

#define UART_CR2_TIEN (1<<7) //Transmitter interrupt enable
#define UART_CR2_TCIEN (1<<6) //Transmission complete interrupt enable
#define UART_CR2_RIEN (1<<5) //Receiver interrupt enable
#define UART_CR2_ILIEN (1<<4) //IDLE Line interrupt enable
#define UART_CR2_RWU (1<<1) //Receiver wakeup
#define UART_CR2_SBK (1<<0) //Send break

#define UART_CR3_LINEN (1<<6) //LIN mode enable
#define UART_CR3_STOP1 (1<<5) //STOP bits
#define UART_CR3_STOP0 (1<<4) 
#define UART_CR3_CLKEN (1<<3) //Clock enable
#define UART_CR3_CPOL (1<<2) //Clock polarity
#define UART_CR3_CPHA (1<<1) //Clock phase
#define UART_CR3_LBCL (1<<0) //Last bit clock pulse

#define UART_CR4_LBDIEN (1<<6) //LIN Break Detection Interrupt Enable
#define UART_CR4_LBDL (1<<5) //LIN Break Detection Length
#define UART_CR4_LBDF (1<<4) //LIN Break Detection Flag
#define UART_CR4_ADD3 (1<<3) //Address of the UART node
#define UART_CR4_ADD2 (1<<2)
#define UART_CR4_ADD1 (1<<1)
#define UART_CR4_ADD0 (1<<0)

#define UART_CR5_SCEN (1<<5) //Smartcard mode enable
#define UART_CR5_NACK (1<<4) //Smartcard NACK enable
#define UART_CR5_HDSEL (1<<3) //Half-Duplex Selection
#define UART_CR5_IRLP (1<<2) //IrDA Low Power
#define UART_CR5_IREN (1<<1) //IrDA mode Enable 

#define UART_BAUD(baud) UART->BRR2 = (((F_MASTER/baud) & 0xF000)>>8)|((F_MASTER/baud) & 0x000F); UART->BRR1 = ((F_MASTER/baud) >> 4) & 0x00FF
#define UART_PRESCALE(prescale) UART->PSCR = prescale
#define UART_TEN() UART->CR2|=(1<<3)
#define UART_NOTEN() UART->CR2&=~(1<<3)
#define UART_REN() UART->CR2|=(1<<2)
#define UART_NOREN() UART->CR2&=~(1<<2)
#define UART_9BIT() UART->CR1|=(1<<4)
#define UART_8BIT() UART->CR1&=~(1<<4)
#define UART_R8() (UART->CR1&(1<<7))>0
#define UART_T8() UART->CR1|=1<<6
#define UART_UARTD() UART->CR1|=1<<5

//#define UART_CHECK() (UART->SR&(1<<5))>0
#define UART_RECV() UART->DR
//#define UART_SEND(data) while(!((UART->SR)&(1<<7)); UART->DR = data

#define UART_TXE() (UART->SR&(1<<7))>0
#define UART_TC() (UART->SR&(1<<6))>0
#define UART_RXNE() (UART->SR&(1<<5))>0
#define UART_IDLE() (UART->SR&(1<<4))>0
#define UART_OR() (UART->SR&(1<<3))>0
#define UART_NF() (UART->SR&(1<<2))>0
#define UART_FE() (UART->SR&(1<<1))>0
#define UART_PE() (UART->SR&(1))>0
struct
{
	uint8_t SR;
	uint8_t DR;
	uint8_t BRR1;
	uint8_t BRR2;
	uint8_t CR1;
	uint8_t CR2;
	uint8_t CR3;
	uint8_t CR4;
	uint8_t CR5;
	uint8_t GTR;
	uint8_t PSCR;
} * UART = 0x5230;