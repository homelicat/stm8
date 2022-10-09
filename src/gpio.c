#define GPIO_OUT (1<<0)
#define GPIO_IN 0
#define GPIO_PULLUP (1<<1)
#define GPIO_FLOAT 0
#define GPIO_FAST (1<<2)
#define GPIO_SLOW 0
#define GPIO_INT (1<<2)
#define GPIO_NOINT 0

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

void gpio_cfg(struct PORT * port, uint8_t pin, uint8_t cfg)
{
	port->DDR |= ((cfg&(1<<0))>0)<<pin;
	port->CR1 |= ((cfg&(1<<1))>0)<<pin;
	port->CR2 |= ((cfg&(1<<2))>0)<<pin;
}

void gpio_set(struct PORT * port, uint8_t pin, uint8_t state)
{
	port->ODR ^= (port->ODR)^((state>0)<<pin);
}

uint8_t gpio_get(struct PORT * port, uint8_t pin)
{
	return ((port->IDR&(1<<pin))>0);
}