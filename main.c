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
	char s1[5] = "Hola";
	char s2[5] = "Hola";

	char s1g[5] = "Holz";
	char s2g[5] = "Hola";

	char s1l[5] = "Hola";
	char s2l[5] = "Holz";

	printf("value equal -> %i\n", ft_strcmp(s1, s2));
	printf("[o] value equal -> %i\n", strcmp(s1, s2));

	printf("value great -> %i\n", ft_strcmp(s1g, s2g));
	printf("[o] value great -> %i\n", strcmp(s1g, s2g));

	printf("value less -> %i\n", ft_strcmp(s1l, s2l));
	printf("[o] value less -> %i\n", strcmp(s1l, s2l));
}

int main (void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	return (0);
}
