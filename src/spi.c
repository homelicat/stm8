struct
{
	uint8_t CR1;
	uint8_t CR2;
	uint8_t ICR;
	uint8_t SR;
	uint8_t DR;
	uint8_t CRCPR;
	uint8_t RXCRCR;
	uint8_t TXCRCR;
} * SPI = 0x5200;

void spi_cfg(uint32_t);
void spi_send(uint8_t data);
uint8_t spi_recv();