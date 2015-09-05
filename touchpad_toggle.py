#!/usr/bin/env python3

import subprocess
import re

## Get the ID of touchpad
getID = subprocess.check_output("xinput list | grep 'Trackpad'", shell=True)
res = re.search("id=..", str(getID))
if res == None:
    raise Exception
else:
    touchpadID = res.group(0)[-2:]

## Get the current status of touchpad
getStat = subprocess.getoutput("xinput list-props "+touchpadID+" | grep 'Device Enabled'")
subprocess.call("xinput set-prop "+touchpadID+" 'Device Enabled' "+str(1-int(getStat[-1])), shell=True)
