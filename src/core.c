struct
{
	uint8_t SR;
} * RST = 0x50b3;

#define nop()                 {__asm__("nop\n");}  /* No Operation */
#define F_MASTER 16000000UL

//return status of reset
uint8_t rst_get()
{
	return RST->SR;
}