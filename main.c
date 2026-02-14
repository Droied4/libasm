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

static void test_write()
{
	printf("\n----WRITE TEST----\n");
	printf("bytes write -> %ld\n", ft_write(1, "funciona\n", 10));
	printf("[o] bytes write -> %ld\n", write(1, "funciona\n", 10));

	errno = 0;
	ssize_t n; 
	n = ft_write(42, "error\n", 6);
	if (n == -1)
		perror("ft_write fallo");
	errno = 0;
	n = 0;
	n = write(42, "error\n", 6);
	if (n == -1)
		perror("write fallo");
}

static void test_read()
{
	int fd = open("./test", O_CREAT);
	char buf[9];
	char obuf[9];
	
	printf("\n----READ TEST----\n");
	printf("bytes read -> %ld\n", ft_read(fd, buf, 8));
	buf[9] = '\0';
	printf("%s\n", buf);
	lseek(fd, 0, SEEK_SET);
	printf("[o] bytes read -> %ld\n", read(fd, obuf, 8));
	obuf[9] = '\0';
	printf("%s\n", obuf);
	close(fd);
	errno = 0;
	ssize_t n; 
	n = ft_read(42, buf, 8);
	if (n == -1)
		perror("ft_read fallo");
	errno = 0;
	n = 0;
	n = read(42, obuf, 8);
	if (n == -1)
		perror("read fallo");

}

static void test_strdup()
{
	char *test;
	char *otest;

	printf("\n----STRDUP TEST----\n");
	test = ft_strdup("hola");
	otest = strdup("hola");
	
	if (!test)
	{
		perror(test);
		exit(1);
	}
	printf("string -> %s address -> %p\n", test, &test);
	printf("[o] string -> %s address -> %p\n", otest, &otest);
}

int main (void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
	return (0);
}
