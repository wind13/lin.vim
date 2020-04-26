#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" list files which contains the text in current directory """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    list files which contain [text] in current directory")
    print("Usage:")
    print("    %s [text]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) != 2:
        help_msg()
    os.system('ag -l --smart-case --depth -1 -p %s %s .' %
              (util.get_ag_ignore_file(), util.get_sys_args_one_line()))