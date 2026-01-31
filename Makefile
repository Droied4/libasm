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

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s
HEADER = -I ./
OBJ = $(addprefix $(OBJS_PATH)/, ${SRC:.s=.o})

BONUS = bonus
BONUS_HEADER = -I $(BONUS)/
BONUS_CFLAGS = $(FLAGS) $(BONUS_HEADER) 
BONUS_SCR = $(BONUS)/.s
BONUS_OBJ = $(addprefix $(OBJS_PATH)/, ${BONUS_SCR:.s=.o})

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ) 

$(OBJS_PATH)/%.o: %.s Makefile  
	@mkdir -p $(dir $@)
	$(CA) $(FLAGS) $< -o $@

#por ahora luego se va a la basura jeje
$(CTEST): $(NAME) 
	$(CC) $(CFLAGS) main.c $< $(HEADER) -o $@ 

$(ATEST): $(OBJ) $(NAME)
	$(CA) $(FLAGS) main.s -o main.o
	$(LD) main.o $(OBJ) -o $@

#cuando haga el bonus modificar esto
bonus: $(NAME_BONUS)

$(NAME_BONUS): $(BONUS_OBJ)
	$(CC) $(BONUS_CFLAGS) $^ -o $@

$(OBJS_PATH)/bonus/%.o: bonus/%.c Makefile
	@mkdir -p $(dir $@)
	$(CC) $(BONUS_CFLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJS_PATH)
	@rm -f main.o 

fclean: clean
	@rm -f $(NAME)
	@rm -f $(ATEST)
	@rm -f $(CTEST)

re: fclean all

droied:
	@echo
	@echo "By Droied"
	@echo

.PHONY: all clean fclean re droied 
