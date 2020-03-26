# -*- coding: utf-8 -*-
from __future__ import print_function

import sys
import plistlib as plist

from clu.predicates import tuplize
from clu.importing import ModuleBase, ProxyModule
from clu.importing import initialize_types
from tmi.exporting import Exporter

exporter = Exporter(path=__file__)
export = exporter.decorator()

Module, Finder, Loader = initialize_types('tmi', appspace='app')

overrides = dict()

class PListLibAdapter(ProxyModule):
    targets = tuplize(plist)

class plistlib(PListLibAdapter[Module]):
    targets = tuple()

export(ModuleBase,  name='ModuleBase')
export(Module,      name='Module')
export(Finder,      name='Finder')
export(Loader,      name='Loader')

# Assign the modules’ `__all__` and `__dir__` using the exporter:
__all__, __dir__ = exporter.all_and_dir()

def test():
    
    from clu.testing.utils import inline
    
    @inline.precheck
    def show_types():
        print('Module:', Module)
        print('Finder:', Finder)
        print('Loader:', Loader)
    
    @inline
    def test_one():
        """ Polymer type sanity checks """
        assert Module.appname == 'tmi'
        assert Module.appspace == 'app'
        
        assert Finder.appname == 'tmi'
        assert Loader.appname == 'tmi'
    
    @inline
    def test_two():
        """ PListLibAdapter and plistlib import checks """
        from tmi.app import PListLibAdapter as adapter
        from tmi.app import plistlib
        
        assert adapter
        assert plistlib
    
    return inline.test(100)

if __name__ == '__main__':
    sys.exit(test())
