# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apaula-l <apaula-l@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/20 14:31:25 by apaula-l          #+#    #+#              #
#    Updated: 2024/05/20 14:52:59 by apaula-l         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol
# INCS := -I./include -I/usr/include/ -I./ -I/usr/include/minilibx-linux
CC = cc
CFLAGS = -Wall -Wextra -Werror
# CPPFLAGS := $(addprefix -I,$(INCS)) -MMD -MP
# LIBS = -L/usr/lib -lmlx -lXext -lX11 -lm
MLXFLAGS = -lX11 -lXext -lmlx
MLXINCLUDE    = -Imlx
# MLX_PATH = minilibx-linux
MLX = $(MLX_PATH)/libmlx.a

SRCS = main.c \
	ft_init.c \
	ft_render.c \
	ft_events.c \
	ft_string_utils.c \
	ft_math_utils.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS) $(MLX)
#	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(NAME) -L$(MLX_PATH) -lmlx_Linux -lX11 -lXext -o fractol
    cc $(CFLAGS) $^ $(MLXINCLUDE) $(MLXFLAGS) -o $@
%.o: %.c
    $(CC) $(CFLAGS) -c $< $(MLXINCLUDE) -o $@

$(MLX):
	@$(MAKE) -C $(MLX_PATH)

clean:
#	@$(MAKE) clean -C $(MLX_PATH)
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: clean fclean re all bonus
