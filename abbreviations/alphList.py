#!/usr/bin/env python3
# -*- coding: utf-8 -*-

srcString = 'cmd a1 b1  c1'
srcList = ['cmd', ' a1', 'b1 ', ' c1 ']

splitList = srcString.split() # whitespace delimited
print('splitList:')
print(splitList)
print('\n')

srcLen = len(splitList)
if srcLen >= 3:
    cmd  = splitList[0]
    alias = splitList[1]
    # concat all the other elements into the target string
    target_str = ' '.join(splitList[2:])
    print(cmd)
    print(alias)
    print(target_str)
else:
    print('Invalid source')

print('later')
print(splitList[2:])
