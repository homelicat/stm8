struct
{
	uint8_t CR1;
	uint8_t CR2;
	uint8_t NCR2;
	uint8_t FPR;
	uint8_t NFPR;
	uint8_t IAPSR;
	uint16_t RESV1;
	uint8_t PUKR;
	uint8_t RESV2;
	uint8_t DUKR;
} * FLASH = 0x505a;