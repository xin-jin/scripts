#!/usr/bin/env python3

import subprocess,os

url = "http://projecteuler.net/problem="
args = ['wget','-k','-p','-e','robots=off']
problems_from = 101
problems_to = 150

for i in range(problems_from,problems_to+1):
    subprocess.call(args+[url+str(i)])

os.rename("projecteuler.net","Problems"+str(problems_from)+"-"+str(problems_to))
