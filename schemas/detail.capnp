
using Cpp = import "/capnp/c++.capnp";

@0xb52194d414274fa1;
$Cpp.namespace("tmi");

using String = Text;
using Email = Text;
using Path = Text;
using URL = Text;

struct Time {
    union {
        undefined   @0 :Void;
        timestamp   @1 :UInt64;
        formatted   @2 :String;
    }
}

struct UUID {
    union {
        undefined   @0 :Void;
        unbounded   @1 :Data;
        bytearray   @2 :List(UInt8);
        longwords      :group {
               hi   @3 :UInt64;
               lo   @4 :UInt64;
        }
    }
}

struct MapT(K, T) {
    
    entries         @0 :List(Pair);
    
    struct Pair {
        
        key         @0 :K;
        value       @1 :T;
        
        nextHint :union {
            undefined   @2 :Void;
            reference   @3 :AnyPointer;
        }
    }
    
}

using StringMap     = MapT(String, String);
using KeychainT     = StringMap;
