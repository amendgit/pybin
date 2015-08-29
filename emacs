#!/usr/bin/env python

import sys
import os
import subprocess

def run():
    exe = "/usr/bin/emacs"
    cwd = os.getcwd()
    cmd = [exe]

    if len(sys.argv) >= 2:
        path = sys.argv[1]

        if path.startswith("file"):
            path = path[5:]

        if not os.path.isabs(path):
            path = os.path.join(os.getcwd(), path)

        cmd = [exe, path]
    
    env = dict(os.environ)
    env['XLIB_SKIP_ARGB_VISUALS'] = '1'
    env['LC_CTYPE'] = 'zh_CN.UTF-8'
    subprocess.Popen(cmd, env=env)

run()