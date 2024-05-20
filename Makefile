# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apaula-l <apaula-l@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/20 14:31:25 by apaula-l          #+#    #+#              #
#    Updated: 2024/05/23 03:33:59 by apaula-l         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol
INCS := -I./include -I/usr/include/ -I/usr/include/minilibx-linux
CC = cc
CFLAGS = -Wall -Wextra -Werror -Ofast
CPPFLAGS := $(addprefix -I,$(INCS)) -MMD -MP
LIBS = -L/usr/lib -lmlx -lXext -lX11 -lm
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
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(NAME) -L$(MLX_PATH) -lmlx_Linux -lX11 -lXext -o fractol

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -I$(MLX_PATH) -c $< -o $@

$(MLX):
	@$(MAKE) -C $(MLX_PATH)

clean:
	@$(MAKE) -C $(MLX_PATH) clean
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: clean fclean re all bonus