#define I2C_CR1_NOSTRETCH (1<<7) //Clock stretching disable (Slave mode)
#define I2C_CR1_ENGC (1<<6) //General call enable
#define I2C_CR1_PE (1<<0) //Peripheral enable

#define I2C_CR2_SWRST (1<<7) //Software reset
#define I2C_CR2_POS (1<<3) //Acknowledge position (for data reception)
#define I2C_CR2_ACK (1<<2) //Acknowledge enable
#define I2C_CR2_STOP (1<<1) //Stop generation
#define I2C_CR2_START (1<<0) //Start generation

#define I2C_FREQR_1 (1<<0) //1MHz

//#define 

struct
{
	uint8_t CR1;
	uint8_t CR2;
	uint8_t FREQR;
	uint8_t OARL;
	uint8_t OARH;
	uint8_t DR;
	uint8_t SR1;
	uint8_t SR2;
	uint8_t SR3;
	uint8_t ITR;
	uint8_t CCRL;
	uint8_t CCRH;
	uint8_t TRISER;
	uint8_t PECR;
} * I2C = 0x5210;

void i2c_cfg();