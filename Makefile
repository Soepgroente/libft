# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vincent <vincent@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/03 18:04:48 by vvan-der          #+#    #+#              #
#    Updated: 2023/07/22 15:17:10 by vincent          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libft.a
PRINT_A	= ft_printf/libftprintf.a
PRINTF	= ft_printf
RM		= rm -rf
CC		= gcc
CFLAGS	= -Wall -Werror -Wextra #-g3 -fsanitize=address
OBJDIR	= libft_obj

SRCS	= ft_ato_double.c ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c \
		ft_iswhitespace.c ft_itoa.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_pow.c ft_pow_fl.c ft_putchar_fd.c \
		ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c ft_strcpy.c ft_strdup.c ft_striteri.c ft_strjoin.c \
		ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c \
		ft_substr.c ft_tolower.c ft_toupper.c ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
		ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c ft_tolower_str.c

OBJS	= $(SRCS:%.c=$(OBJDIR)/%.o)

all:	$(NAME)

$(PRINTF):
	git submodule init git@github.com:Soepgroente/ft_printf.git

$(PRINT_A): $(PRINTF)
	$(MAKE) -C $(PRINTF)

$(NAME): $(PRINT_A) $(OBJDIR) $(OBJS)
	ar rcs $(NAME) $(PRINT_A) $(OBJS)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o : %.c
	$(CC) -c $(CFLAGS) -o $@ $^

clean:
	$(RM) $(OBJDIR)
	make clean -C $(PRINTF)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(PRINT_A)

re: fclean all

.PHONY: all clean fclean re test
