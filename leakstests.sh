#!/bin/bash

# Valid tests, should work without leaks or crash or anything
# of course, don't test leaks command with -fsanitize=address combined..
# test_battery.c and rt_write_errors.c are displaying informations on STDERR
# This script will display everything on STDOUT and in file leakstests_outfile.txt
# It will just add marks on leakstests_errfile.txt to complete test_battery display to see which test is done
# Refer to errors_list.md to see which error case is checked per file

if [ ! -f "../miniRT" ]
then
	printf $BOLD"\n\nNo binary found !\n\n"$RESET
	exit
fi

ft_print_lines()
{
	a=0
	while [ $a -lt 3 ]; do
		printf "====================================================================================================\n" >> leakstests_outfile.txt
		printf "====================================================================================================\n" >> leakstests_errfile.txt
		a=$(($a + 1))
	done
}

######################################################################################################################################################
# Valid tests ########################################################################################################################################
######################################################################################################################################################
printf "Valid tests & leaks\n\n" > leakstests_outfile.txt
printf "Valid tests & leaks\n\n" > leakstests_errfile.txt

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mValid\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"
x=1
while [ $x -le 20 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/valid/valid$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/valid/valid$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/valid/valid$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

######################################################################################################################################################
# Basic Error tests ##################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nBasic Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nBasic Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mBasic Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/empty.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/empty.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/empty.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missA.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missA.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/missA.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missC.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missC.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/missC.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missL.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missL.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/missL.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missO.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/missO.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/missO.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/nlonly.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/nlonly.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/nlonly.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/noext\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/noext\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/noext >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughAvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughAvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughAvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughCvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughCvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughCvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughCYvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughCYvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughCYvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughLvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughLvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughLvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughPLvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughPLvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughPLvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughSPvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughSPvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/notenoughSPvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/randomData.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/randomData.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/randomData.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/text.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/text.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/text.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchA.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchA.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchA.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchAvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchAvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchAvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchC.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchC.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchC.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchCvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchCvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchCvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchCYvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchCYvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchCYvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchL.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchL.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchL.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchLvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchLvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchLvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchPLvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchPLvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchPLvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchSPvalues.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchSPvalues.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/toomuchSPvalues.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/unknownID.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/unknownID.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/unknownID.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongext.rtr\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongext.rtr\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongext.rtr >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderA.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderA.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderA.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderC.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderC.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderC.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderCY.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderCY.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderCY.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderL.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderL.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderL.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderPL.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderPL.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderPL.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderSP.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderSP.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/wrongorderSP.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/DoesNotExist.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/basic_errors/DoesNotExist.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/basic_errors/DoesNotExist.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

######################################################################################################################################################
# A Error tests ######################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nA Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nA Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mA RATIO Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

x=1
while [ $x -le 10 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/a_errors/a_ratio/a.ratio.$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/a_errors/a_ratio/a.ratio.$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/error/a_errors/a_ratio/a.ratio.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mA RGB Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/a_errors/a_rgb/a.rgb.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/a_errors/a_rgb/a.rgb.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/a_errors/a_rgb/a.rgb.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 10 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/a_errors/a_rgb/a_rgb$y/a.rgb$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/a_errors/a_rgb/a_rgb$y/a.rgb$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/a_errors/a_rgb/a_rgb$y/a.rgb$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

######################################################################################################################################################
# C Error tests ######################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nC Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nC Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mC POS Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_pos/c.pos.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_pos/c.pos.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/c_errors/c_pos/c.pos.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 9 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_pos/c_pos$y/c.pos$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_pos/c_pos$y/c.pos$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/c_errors/c_pos/c_pos$y/c.pos$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mC DIR Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_dir/c.dir.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_dir/c.dir.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/c_errors/c_dir/c.dir.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 11 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_dir/c_dir$y/c.dir$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_dir/c_dir$y/c.dir$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/c_errors/c_dir/c_dir$y/c.dir$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mC FOV Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

x=1
while [ $x -le 9 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_fov/c.fov.$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/c_errors/c_fov/c.fov.$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/error/c_errors/c_fov/c.fov.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

######################################################################################################################################################
# L Error tests ######################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nL Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nL Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mL POS Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_pos/l.pos.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_pos/l.pos.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/l_errors/l_pos/l.pos.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 9 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_pos/l_pos$y/l.pos$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_pos/l_pos$y/l.pos$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/l_errors/l_pos/l_pos$y/l.pos$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mL RATIO Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

x=1
while [ $x -le 10 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_ratio/l.ratio.$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_ratio/l.ratio.$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/error/l_errors/l_ratio/l.ratio.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mL RGB Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_rgb/l.rgb.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_rgb/l.rgb.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/l_errors/l_rgb/l.rgb.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 10 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_rgb/l_rgb$y/l.rgb$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/l_errors/l_rgb/l_rgb$y/l.rgb$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/l_errors/l_rgb/l_rgb$y/l.rgb$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

######################################################################################################################################################
# SP Error tests #####################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nSP Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nSP Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mSP POS Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_pos/sp.pos.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_pos/sp.pos.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_pos/sp.pos.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 9 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_pos/sp_pos$y/sp.pos$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_pos/sp_pos$y/sp.pos$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_pos/sp_pos$y/sp.pos$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mSP DIAMETER Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

x=1
while [ $x -le 9 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_diameter/sp.diameter.$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_diameter/sp.diameter.$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_diameter/sp.diameter.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mSP RGB Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_rgb/sp.rgb.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_rgb/sp.rgb.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_rgb/sp.rgb.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 10 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_rgb/sp_rgb$y/sp.rgb$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_rgb/sp_rgb$y/sp.rgb$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/sp_errors/sp_rgb/sp_rgb$y/sp.rgb$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

######################################################################################################################################################
# PL Error tests #####################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nPL Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nPL Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mPL POS Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_pos/pl.pos.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_pos/pl.pos.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_pos/pl.pos.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 9 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_pos/pl_pos$y/pl.pos$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_pos/pl_pos$y/pl.pos$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_pos/pl_pos$y/pl.pos$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mPL DIR Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_dir/pl.dir.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_dir/pl.dir.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_dir/pl.dir.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 11 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_dir/pl_dir$y/pl.dir$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_dir/pl_dir$y/pl.dir$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_dir/pl_dir$y/pl.dir$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mPL RGB Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_rgb/pl.rgb.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_rgb/pl.rgb.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_rgb/pl.rgb.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 10 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_rgb/pl_rgb$y/pl.rgb$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_rgb/pl_rgb$y/pl.rgb$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/pl_errors/pl_rgb/pl_rgb$y/pl.rgb$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

######################################################################################################################################################
# CY Error tests #####################################################################################################################################
######################################################################################################################################################
ft_print_lines
ft_print_lines
ft_print_lines
printf "\n\nCY Error tests & leaks\n\n" >> leakstests_outfile.txt
printf "\n\nCY Error tests & leaks\n\n" >> leakstests_errfile.txt
printf "\033[2K\rCurrently Doing \033[36mCY POS Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_pos/cy.pos.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_pos/cy.pos.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_pos/cy.pos.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 9 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_pos/cy_pos$y/cy.pos$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_pos/cy_pos$y/cy.pos$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_pos/cy_pos$y/cy.pos$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mCY DIR Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_dir/cy.dir.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_dir/cy.dir.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_dir/cy.dir.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 11 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_dir/cy_dir$y/cy.dir$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_dir/cy_dir$y/cy.dir$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_dir/cy_dir$y/cy.dir$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mCY DIAMETER Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

x=1
while [ $x -le 9 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_diameter/cy.diameter.$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_diameter/cy.diameter.$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_diameter/cy.diameter.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mCY HEIGHT Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

x=1
while [ $x -le 9 ]; do
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_height/cy.height.$x.rt\n" >> leakstests_outfile.txt
	printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_height/cy.height.$x.rt\n" >> leakstests_errfile.txt
	leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_height/cy.height.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
	x=$(($x + 1))
done

ft_print_lines
printf "\033[2K\rCurrently Doing \033[36mCY RGB Error\033[0m tests, \033[33m\033[1m\033[4mPlease Wait\033[0m"

printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_rgb/cy.rgb.0.rt\n" >> leakstests_outfile.txt
printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_rgb/cy.rgb.0.rt\n" >> leakstests_errfile.txt
leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_rgb/cy.rgb.0.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt

y=1
while [ $y -le 3 ]; do
	x=1
	while [ $x -le 10 ]; do
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_rgb/cy_rgb$y/cy.rgb$y.$x.rt\n" >> leakstests_outfile.txt
		printf "\nleaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_rgb/cy_rgb$y/cy.rgb$y.$x.rt\n" >> leakstests_errfile.txt
		leaks -atExit -q -- ../miniRT scenes/error/cy_errors/cy_rgb/cy_rgb$y/cy.rgb$y.$x.rt >> leakstests_outfile.txt 2>> leakstests_errfile.txt
		x=$(($x + 1))
	done
	y=$(($y + 1))
done

######################################################################################################################################################
# End ################################################################################################################################################
######################################################################################################################################################
printf "\033[2K\r\033[32m\033[1mTest Script Done !\033[0m"