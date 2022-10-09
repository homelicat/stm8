#define ADC_CSR_EOC (1 << 7)
#define ADC_CSR_AWD (1 << 6)
#define ADC_CSR_EOCIE (1 << 5)
#define ADC_CSR_AWDIE (1 << 4)

#define ADC_CR1_CONT (1 << 1)
#define ADC_CR1_ADON (1 << 0)

#define ADC_CR2_EXTTRIG (1 << 6)
#define ADC_CR2_EXTSEL (1 << 4)
#define ADC_CR2_ALIGN (1 << 3)
#define ADC_CR2_SCAN (1 << 1)

// не правильная структура TODO

struct
{
	uint8_t DB0RH;
	uint8_t DB0RL;
	uint8_t DB1RH;
	uint8_t DB1RL;
	uint8_t DB2RH;
	uint8_t DB2RL;
	uint8_t DB3RH;
	uint8_t DB3RL;
	uint8_t DB4RH;
	uint8_t DB4RL;
	uint8_t DB5RH;
	uint8_t DB5RL;
	uint8_t DB6RH;
	uint8_t DB6RL;
	uint8_t DB7RH;
	uint8_t DB7RL;
	uint8_t DB8RH;
	uint8_t DB8RL;
	uint8_t DB9RH;
	uint8_t DB9RL;
	uint8_t CSR;
	uint8_t CR1;
	uint8_t CR2;
	uint8_t CR3;
	uint8_t DRH;
	uint8_t DRL;
	uint8_t TDRH;
	uint8_t TDRL;
	uint8_t HTRH;
	uint8_t HTRL;
	uint8_t LTRH;
	uint8_t LTRL;
	uint8_t AWSRH;
	uint8_t AWSRL;
	uint8_t AWCRH;
	uint8_t AWCRL;
} * ADC = 0x53E0;