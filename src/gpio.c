#define GPIO_OUT(port,pin) port->DDR|=1<<pin
#define GPIO_IN(port,pin) port->DDR&=~(1<<pin)
#define GPIO_PULLUP(port,pin) port->CR1|=1<<pin
#define GPIO_FLOAT(port,pin) port->CR1&=~(1<<pin)
#define GPIO_FAST(port,pin) port->CR2|=1<<pin
#define GPIO_SLOW(port,pin) port->CR2&=~(1<<pin)
#define GPIO_INT(port,pin) port->CR2|=1<<pin
#define GPIO_NOINT(port,pin) port->CR2&=~(1<<pin)
#define GPIO_SET(port,pin,state) port->ODR ^=(port->ODR)^((state>0)<<pin)
#define GPIO_GET(port,pin) ((port->IDR&(1<<pin))>0)

struct PORT
{
	uint8_t ODR;
	uint8_t IDR;
	uint8_t DDR;
	uint8_t CR1;
	uint8_t CR2;
};

struct PORT *GPIO_A = 0x5000;
struct PORT *GPIO_B = 0x5005;
struct PORT *GPIO_C = 0x500a;
struct PORT *GPIO_D = 0x500f;