# -*- coding: utf-8 -*-
from __future__ import print_function

import logging
import runpy
import sys, os

def run(argv):
    """ Main script-runner CLI entry point """
    
    if not argv:
        argv = sys.argv[1:]
    
    if not argv:
        raise RuntimeError("no valid arguments to %s" % os.path.basename(__file__))
    
    script_arg = argv[0]
    
    if not script_arg:
        raise RuntimeError("invalid script argument to %s" % os.path.basename(__file__))
    
    script_path = os.path.abspath(script_arg)
    
    if not os.path.exists(script_path):
        raise RuntimeError("invalid script path to %s" % os.path.basename(__file__))
    
    try:
        runpy.run_path(script_path, run_name='__main__')
    
    except SystemExit:
        pass
    
    except:
        logging.traceback.print_exc()
        return os.EX_IOERR
    
    return os.EX_OK

if __name__ == '__main__':
    # sys.exit(run(sys.argv[1:]))
    dirname = os.path.dirname(__file__)
    path = os.path.join(dirname, 'importing.py')
    sys.exit(run([path]))