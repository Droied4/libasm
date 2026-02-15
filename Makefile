NAME = libasm.a 
CTEST = ctest
ATEST = atest

CA = nasm
LD = ld
AR = ar rcs 
CC = gcc

OBJS_PATH=./build

FLAGS = -f elf64
CFLAGS = -Wall -Werror -Wextra

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
HEADER = -I ./
OBJ = $(addprefix $(OBJS_PATH)/, ${SRC:.s=.o})

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ) 

$(OBJS_PATH)/%.o: %.s Makefile  
	@mkdir -p $(dir $@)
	$(CA) $(FLAGS) $< -o $@

#por ahora luego se va a la basura jeje
$(CTEST): $(NAME) 
	$(CC) $(CFLAGS) main.c $< $(HEADER) -o $@ 

clean:
	@rm -rf $(OBJS_PATH)
	@rm -f main.o 

fclean: clean
	@rm -f $(NAME)
	@rm -f $(CTEST)

re: fclean all

droied:
	@echo
	@echo "By Droied"
	@echo

.PHONY: all clean fclean re droied ctest
