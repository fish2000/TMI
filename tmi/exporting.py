# -*- coding: utf-8 -*-
from __future__ import print_function

import sys, os

from clu.exporting import ExporterBase

# The “basepath” is the directory enclosing the package root:
basepath = os.path.dirname(
           os.path.dirname(__file__))

class Exporter(ExporterBase, basepath=basepath, appname="tmi"):
    pass

exporter = Exporter(path=__file__)
export = exporter.decorator()

@export
def youlike():
    return "registries"

export(Exporter)

# Assign the modules’ `__all__` and `__dir__` using the exporter:
__all__, __dir__ = exporter.all_and_dir()

def test():
    
    from clu.testing.utils import inline
    
    @inline.precheck
    def show_exporter():
        print(exporter)
    
    @inline
    def test_one():
        """ Exporter sanity check """
        assert Exporter.basepath == basepath
        assert Exporter.appname == 'tmi'
        
        assert exporter.path == __file__
        assert exporter.dotpath == 'tmi.exporting'
        assert exporter.basepath == basepath
        assert exporter.appname == 'tmi'
    
    return inline.test(100)

if __name__ == '__main__':
    sys.exit(test())
