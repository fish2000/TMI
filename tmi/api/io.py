# -*- coding: utf-8 -*-
from __future__ import print_function
from enum import unique

import sys

from clu.enums import AliasingEnum, alias
from clu.exporting import Exporter

exporter = Exporter(path=__file__)
export = exporter.decorator()

@unique
class Status(AliasingEnum):
    
    DISCARD             = 200
    REPLACE_TEXT        = 201
    REPLACE_DOCUMENT    = 202
    INSERT_TEXT         = 203
    INSERT_SNIPPET      = 204
    SHOW_HTML           = 205
    SHOW_TOOLTIP        = 206
    NEW_DOCUMENT        = 207
    INSERT_SNIPPET_NOINDENT = 208
    NOP                 = alias(DISCARD)
    CREATE_NEW_DOCUMENT = alias(NEW_DOCUMENT)
    
    @property
    def code(self):
        return int(self.value)
    
    def exit(self, output):
        sys.stdout.write(output)
        sys.stdout.flush()
        sys.exit(self.code)

# Assign the modules’ `__all__` and `__dir__` using the exporter:
__all__, __dir__ = exporter.all_and_dir()

def test():
    
    # from clu.testing.utils import inline
    
    # @inline
    def test_one():
        pass # INSERT TESTING CODE HERE, pt. I
    
    #@inline
    def test_two():
        pass # INSERT TESTING CODE HERE, pt. II
    
    #@inline.diagnostic
    def show_me_some_values():
        pass # INSERT DIAGNOSTIC CODE HERE
    
    # return inline.test(100)

if __name__ == '__main__':
    sys.exit(test())

