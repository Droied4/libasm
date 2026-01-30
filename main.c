#include "libasm.h"

static void test_strlen()
{
	printf("\n----STRLEN TEST----\n");
	printf("size of 'Hola mundo' -> %ld\n", ft_strlen("Hola mundo"));
	printf("[o] size of 'Hola mundo' -> %ld\n", strlen("Hola mundo"));
}

static void test_strcpy()
{
	char dst[4];
	char odst[4];
	char src[6] = "Hola!";

	printf("\n----STRCPY TEST----\n");
	printf("returned pointer value -> %s\n", ft_strcpy(dst, src));
	printf("string dst copied -> %s\n", dst);
	printf("[o] returned pointer value -> %s\n", strcpy(odst, src));
	printf("[o] string dst copied -> %s\n", odst);
}

static void test_strcmp()
{
	printf("\n----STRCMP TEST----\n");
}

int main (void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	return (0);
}
