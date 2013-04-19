#!/usr/bin/env python

import sys

def yakyu(chars):
    """
    >>> yakyu("s")
    010
    >>> yakyu("ss")
    010,020
    >>> yakyu("sss")
    010,020,100
    >>> yakyu("ssbs")
    010,020,021,100
    >>> yakyu("bbb")
    001,002,003
    >>> yakyu("ssbbb")
    010,020,021,022,023
    >>> yakyu("ssbbbb")
    010,020,021,022,023,000
    >>> yakyu("hsbhfhbh")
    000,010,011,000,010,000,001,000
    >>> yakyu("bbssp")
    001,002,012,022,100
    >>> yakyu("ppp")
    100,200,000
    >>> yakyu("ppsbp")
    100,200,210,211,000
    >>> yakyu("ssffpffssp")
    010,020,020,020,100,110,120,200,210,000
    """
    osb = [0, 0, 0]
    result = []
    for c in chars:
        if c == 's': # strike
            new_s = osb[1] + 1
            if new_s == 3:
                osb[0] = (osb[0] + 1) % 3
                osb[2] = 0
            osb[1] = new_s % 3
        elif c == 'b': # ball
            new_b = osb[2] + 1
            if new_b == 4:
                osb[1] = 0
            osb[2] = new_b % 4
        elif c == 'f': # foul
            if osb[1] < 2:
                osb[1] = osb[1] + 1
        elif c == 'h': # hit
            osb[1] = 0
            osb[2] = 0
        elif c == 'p': # pitcher fly
            osb[0] = (osb[0] + 1) % 3
            osb[1] = 0
            osb[2] = 0
        result.append("%d%d%d" % (osb[0], osb[1], osb[2]))
    print ','.join(result)

if __name__ == '__main__':
    line = sys.stdin.readline()
    chars = line.strip()
    yakyu(chars)
