#define UART_SR_TXE (1<<7) //Transmit data register empty
#define UART_SR_TC (1<<6) //Transmission complete
#define UART_SR_RXNE (1<<5) //Read data register not empty
#define UART_SR_IDLE (1<<4) //IDLE line detected
#define UART_SR_OR (1<<3) //Overrun error/LIN Header Error (LIN slave mode)
#define UART_SR_NF (1<<2) //Noise flag
#define UART_SR_FE (1<<1) //Framing error
#define UART_SR_PE (1<<0) //Parity error

#define UART_CR1_R8 (1<<7) //Receive Data bit 8
#define UART_CR1_T8 (1<<6) //Transmit data bit 8
#define UART_CR1_UARTD (1<<5) //UART Disable
#define UART_CR1_M (1<<4) //Word length
#define UART_CR1_WAKE (1<<3) //Wakeup method
#define UART_CR1_PCEN (1<<2) //Parity control enable
#define UART_CR1_PS (1<<1) //Parity selection
#define UART_CR1_PIEN (1<<0) //Parity interrupt enable

#define UART_CR2_TIEN (1<<7) //Transmitter interrupt enable
#define UART_CR2_TCIEN (1<<6) //Transmission complete interrupt enable
#define UART_CR2_RIEN (1<<5) //Receiver interrupt enable
#define UART_CR2_ILIEN (1<<4) //IDLE Line interrupt enable
#define UART_CR2_TEN (1<<3) //Transmitter enable
#define UART_CR2_REN (1<<2) //Receiver enable
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

//configure uart by baud(value) cr1-5(defines) gt and prescale
void uart_cfg(int baud, uint8_t cr1, uint8_t cr2, uint8_t cr3, uint8_t cr4, uint8_t cr5, uint8_t gt, uint8_t prescale)
{
	UART->CR1 = cr1;
	UART->CR2 = cr2;
	UART->CR3 = cr3;
	UART->CR4 = cr4;
	UART->CR5 = cr5;
	UART->GTR = gt;
	UART->PSCR = prescale;
	uint16_t div = F_MASTER/baud;
	UART->BRR2 = ((div & 0xF000)>>8)|(div & 0x000F);
	UART->BRR1 = (div >> 4) & 0x00FF;
}

//check for data
uint8_t uart_check()
{
	return (UART->SR&UART_SR_RXNE)>0;
}

//receive data from uart
uint8_t uart_recv()
{
	return UART->DR;
}

//send data to uart
void uart_send(uint8_t data)
{
	while(!((UART->SR)&UART_SR_TXE));
	UART->DR = data;
}