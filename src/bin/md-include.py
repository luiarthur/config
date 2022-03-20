#!/usr/bin/env python

import sys
import re

INPUT_FILE = sys.argv[1]
OUTPUT_FILE = "." + INPUT_FILE.replace('.md', '-tmp.md')

def readFile(filepath):
    with open(filepath,"r") as f:
        s = ""
        for line in f:
            s += line
        f.close()
    return s

def writeFile(filepath, data):
    with open(filepath,"w") as f:
        f.write(data)
        f.close()

### MAIN ###
FILE_CONTENT = readFile(INPUT_FILE)
INCLUDE_TAGS = re.findall('<include\s+file=".+">', FILE_CONTENT)

in_quotes = re.compile('(?<=")[^"]+(?=")')


for t in INCLUDE_TAGS:
    file_to_include = re.findall(in_quotes, t)[0]
    include_file_content = readFile(file_to_include)
    FILE_CONTENT = FILE_CONTENT.replace(t, include_file_content)

writeFile(OUTPUT_FILE, FILE_CONTENT)
