#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
''' File operations in current folder. '''

import sys
import os
import getopt
sys.path.append('.')
import util

help_msg = '''File operations in current folder.

usage:
    filer [option] -d/--delete <filetype>               delete all files that has <filetype>.
    filer [option] -r/--replace <old> <new> <filetype>  swap <old> with <new> for all files that has <filetype>.
    filer [option] -l/--list <filetype>                 list all files that has <filetype>.

option:
    -i/--include-hidden                                 operations include hidden folder, by default False.

flag:
    filer -h/--help                                     show help message.
'''


def help():
    print(help_msg)
    exit(0)


def file_replace(old, new, filetype, include_hidden):
    root = os.getcwd()
    files = [
        os.path.relpath(f, root) for f in util.walk_dir('.', include_hidden)
    ]
    filetype = '.%s' % (filetype)
    for f in files:
        if f.startswith('.'):
            continue
        if not f.endswith(filetype):
            continue
        try:
            with open(f, 'r') as fp:
                content = fp.read()
                fp.close()
            with open(f, 'w') as fp:
                new_content = content.replace(old, new)
                fp.write(new_content)
        except Exception as e:
            print("Error! replace <%s> with <%s> in <%s> exception:%s" %
                  (old, new, f, str(e)))
    exit(0)


def file_delete(filetype, include_hidden):
    root = os.getcwd()
    files = [
        os.path.relpath(f, root) for f in util.walk_dir('.', include_hidden)
    ]
    filetype = '.%s' % filetype
    for f in files:
        relname = os.path.relpath(f)
        if relname.startswith('.'):
            continue
        if relname.endswith(filetype):
            print('[lin-command] remove %s' % f)
            os.remove(f)
    exit(0)


def file_list(filetype, include_hidden):
    root = os.getcwd()
    files = [
        os.path.relpath(f, root) for f in util.walk_dir('.', include_hidden)
    ]
    filetype = '.%s' % filetype
    for f in files:
        if f.endswith(filetype):
            print('%s' % (os.path.relpath(f, root)))
    exit(0)


if __name__ == '__main__':
    try:
        opts, args = getopt.getopt(
            sys.argv[1:], 'd:r:l:ih',
            ['delete=', 'replace=', 'list=', 'include-hidden', 'help'])
        include_hidden = False
        for opt in opts:
            if opt[0] in ('-i', '--include-hidden'):
                include_hidden = True
                break
        for opt in opts:
            if opt[0] in ('-d', '--delete'):
                file_delete(opt[1], include_hidden)
            elif opt[0] in ('-r', '--replace'):
                file_replace(opt[1], opt[2], opt[3], include_hidden)
            elif opt[0] in ('-l', '--list'):
                file_list(opt[1], include_hidden)
            elif opt[0] in ('-h', '--help'):
                help()
        help()
    except getopt.GetoptError as e:
        print(str(e) + '\n')
        help()
