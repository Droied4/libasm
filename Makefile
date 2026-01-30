NAME = libasm.a 

CA = nasm 
AR = ar rcs 
CC = gcc

OBJS_PATH=./build

FLAGS = -f elf64

SRC = ft_strlen.s
HEADER = -I ./libasm.h
OBJ = $(addprefix $(OBJS_PATH)/, ${SRC:.s=.o})

BONUS = bonus
BONUS_HEADER = -I $(BONUS)/libasm_bonus.h
BONUS_CFLAGS = $(FLAGS) $(BONUS_HEADER) 
BONUS_SCR = $(BONUS)/.s
BONUS_OBJ = $(addprefix $(OBJS_PATH)/, ${BONUS_SCR:.c=.o})

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ) 

$(OBJS_PATH)/%.o: %.s Makefile  
	@mkdir -p $(dir $@)
	$(CA) $(FLAGS) $< -o $@

#cuando haga el bonus modificar esto
bonus: $(NAME_BONUS)

$(NAME_BONUS): $(BONUS_OBJ)
	$(CC) $(BONUS_CFLAGS) $^ -o $@

$(OBJS_PATH)/bonus/%.o: bonus/%.c Makefile
	@mkdir -p $(dir $@)
	$(CC) $(BONUS_CFLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJS_PATH)

fclean: clean
	@rm -f $(NAME)

re: fclean all

droied:
	@echo
	@echo "By Droied"
	@echo

.PHONY: all clean fclean re droied 
