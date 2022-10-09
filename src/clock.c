struct
{
	uint8_t ICKR;
	uint8_t ECKR;
	uint8_t RESV1;
	uint8_t CMSR;
	uint8_t SWR;
	uint8_t SWCR;
	uint8_t CKDIVR;
	uint8_t PCKENR1;
	uint8_t CSSR;
	uint8_t CCOR;
	uint8_t PCKENR2;
	uint8_t HSITRIMR;
	uint8_t SWIMCCR;
} * CLK = 0x50c0;