#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
''' Searching in current folder by ag. '''

import sys
import os
import getopt
sys.path.append('.')
import util

slash = '\\' if util.is_windows() else '/'
db = util.get_command_home() + slash + 'ager.ignore'

help_msg = '''Searching in current folder by ag.

usage:
    ager [option] <text>            search all <text>.
    ager [option] -w/--word <word>  search all <word>.
    ager [option] -c/--count <text> search files and occurrences that contains <text>.
    ager [option] -f/--file <text>  search files that contains <text>.
    ager -i/--ignore <filetype>     add <filetype> in searcher ignore configuration.

option:
    -r/--recursive                  searching recursively from current folder, by default False.

flag:
    ager -p/--purge                 purge all filetypes in searcher configuration.
    ager -s/--show                  show all filetypes in searcher configuration.
    ager -h/--help                  show help message.
'''


def help():
    print(help_msg)
    exit(0)


def search_text(text, depth):
    os.system('ag --smart-case --depth %d -p %s %s .' % (depth, db, text))
    exit(0)


def search_count(text, depth):
    os.system('ag -c --smart-case --depth %d -p %s %s .' % (depth, db, text))
    exit(0)


def search_file(text, depth):
    os.system('ag -l --smart-case --depth %d -p %s %s .' % (depth, db, text))
    exit(0)


def word(word, depth):
    os.system('ag -w --smart-case --depth %d -p %s %s .' % (depth, db, word))
    exit(0)


def ignore_filetype(filetype):
    if not filetype.startswith('.'):
        filetype = '.%s' % filetype
    filetype = '%s\n' % filetype.strip()
    util.append_file(db, filetype)
    exit(0)


def purge_filetype():
    util.purge_file(db)
    exit(0)


def show_filetype():
    ignore_list = util.readlines_file(db)
    ignore_list = [x.strip() for x in ignore_list]
    ignore_str = ' '.join(ignore_list).strip()
    print('[lin-command] search ignore: %s' %
          (None if len(ignore_str) == 0 else ignore_str))
    exit(0)


if __name__ == '__main__':
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'w:c:f:i:rpsh', [
            'word=', 'count=', 'file=', 'ignore=', 'recursive', 'purge',
            'show', 'help'
        ])
        depth = 1
        for opt in opts:
            if opt[0] in ('-r', '--recursive'):
                depth = 99
                break
        for opt in opts:
            if opt[0] in ('-w', '--word'):
                word(opt[1], depth)
            elif opt[0] in ('-c', '--count'):
                search_count(opt[1], depth)
            elif opt[0] in ('-f', '--file'):
                search_file(opt[1], depth)
            elif opt[0] in ('-i', '--ignore'):
                ignore_filetype(opt[1])
            elif opt[0] in ('-p', '--purge'):
                purge_filetype()
            elif opt[0] in ('-s', '--show'):
                show_filetype()
            elif opt[0] in ('-h', '--help'):
                help()
        search_text(args[0], depth)
    except getopt.GetoptError as e:
        print(str(e) + '\n')
        help()
