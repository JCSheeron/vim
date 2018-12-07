#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

# imports
# import arg parser
import argparse

# import numerical manipulation libraries
import numpy as np
import pandas as pd

# **** argument parsing
# define the arguments
# create an epilog string to further describe the input file
eplStr="""Specify the abbreviaiton list to alphabatize. The list is assumed to 
be in the format:
cmd abbreviation value.
This function will alphabetize the file by the abbreviation, so the list can
be easily searched for by abbreviation."""

descrStr="Alphabetize abbreviation list."
parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter, \
                                 description=descrStr,
                                 epilog=eplStr)
parser.add_argument('abl', default='', \
                    help='Input abbreviation file.')
args = parser.parse_args()

# At this point, the arguments will be:
# Argument          Values      Description
# args.abl          string      Abbreviation list file name

# *** Check for an input file.  It is required in all cases except for the
# template creation option handled above.
if args.abl == '':
    print('An input file name must be specified.')
    quit()

# *** Read the input file into an array
# This is simple, but only works for a fixed number of columns. 
# A works around may be to pass a list to the names param that is at least
# as long as there are columns. But then how many columns are needed? Don't
# know unless we pre-process the file first
# Get number of fields (cols)
with open(args.abl, 'r') as f:
    num_cols = max(len(line.split(' ')) for line in f)
    f.seek(0)
    df = pd.read_csv(f, names=range(num_cols), engine='python')

print('Num cols: ', num_cols)

# Another approach is to deal with each line and build the data frame, or a simple tuple
#with open(filepath, 'r') as f:
#    for line in f:
#        # build list of tuples or other container.

print(df)
