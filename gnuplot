###
### Gnuplot version 4.6 intialization file
### This file is loaded by gnuplot at the start of each run.
### It is provided as a template, with all commands commented out.
### Uncomment and customize lines for local use.
### Any commands placed here will affect all users.
### To customize gnuplot's initial state for an individual user,
### place commands in a private file ~/.gnuplot instead.

###
### Language initialization
###
# set locale
# set encoding locale

###
### Initialize the default loadpath for shared gnuplot scripts and data.
### Please confirm that this path is correct before uncommented the line below.
###
set loadpath "~/.gnuplot_data/"

###
### Use the colorbrewer Set1 default for plotting lines
###
load "/home/connor/.gnuplot_data/gnuplot-colorbrewer/qualitative/Set1.plt"
set for [i=1:8] style line i lw 2.5

###
### Some commonly used functions that are not built in
###
sinc(x) = sin(x)/x

###
### Other preferences
###
# set clip two
