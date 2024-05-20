/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_math_utils.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apaula-l <apaula-l@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/18 15:47:30 by apaula-l          #+#    #+#             */
/*   Updated: 2024/05/20 10:20:42 by apaula-l         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "fractol.h"

double map(double unscaled_num, double new_min, double new_max, double old_min, double old_max)
{
    return (new_max - new_min) * (unscaled_num - old_min) / (old_max - old_min) + new_min;
}

t_complex   sum_complex(t_complex z1, t_complex z2)
{
    t_complex   result;

    result.x = z1.x + z2.x;
    result.y = z1.y + z2.y;
    return result;
}

t_complex   square_complex(t_complex z)
{
    t_complex   result;
    
    result.x = (z.x * z.x) - (z.y * z.y);
    result.y = 2 * z.x * z.y;
    return result;
}