#!/bin/sh

find . \( -name '*.cm?' -o -name '*.o' -o -name '*.native' -o -name '*~' \) -exec rm {} \;
