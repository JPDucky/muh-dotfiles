#!/usr/bin/env python3
import os
import re

file_contents = {}
new_files = {}
directory = '/home/palmerd/.config/hypr/conf'

for filename in os.listdir(directory):
    file_path = os.path.join(directory, filename)
    with open(file_path, 'r') as file:
        file_read = file.read()
        if 'config' in file_read and not re.match(r'unbind.*', filename):
            file_contents[filename] = file_read.split('\n')

for filename, lines in file_contents.items():
    new_filename = str("unbind_" + filename)
    for line in lines:
        match = re.search(r'bind =(.*?),(.*?),', line)
        if match:
            newline = str("unbind =" + match.group(1) + "," + match.group(2))
            if new_filename in new_files:
                new_files[new_filename] += '\n' + newline
            else:
                new_files[new_filename] = newline

for filename, content in new_files.items():
    with open(filename, 'w') as file:
        file.write(content)
