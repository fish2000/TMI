
@0xf7b1168c865460f0;

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
        # nextHint    @4 :Pair.nullable;
        
        nextHint :union {
            undefined   @2 :Void;
            reference   @3 :AnyPointer;
        }
    }
    
}

# using StringKeyMapT = MapT(String);
using StringMap     = MapT(String, String);

struct Source {
    
    name            @0  :String;
    identifier      @1  :String;
    
    url             @2  :URL;
    path            @3  :Path;
    rank            @4  :Int32;
    disabled        @5  :Bool;
    
    keychain        @6  :StringMap;
    
    pathUpdated     @7  :Time;
    updateAvailable @8  :Bool; # née “needs_update”
}

struct Bundle {
    
    uuid            @0  :UUID;
    origin          @1  :String;
    name            @2  :String;
    category        @3  :String;
    
    htmlURL         @4  :URL;
    description     @5  :String;
    contactName     @6  :String;
    contactEmail    @7  :Email;
    
    url             @8  :URL;
    urlUpdated      @9  :Time;
    path            @10 :Path;
    pathUpdated     @11 :Time;
    
    rank            @12 :Int32;
    size            @13 :Int32;
    
    requisite       @14 :Bool;
    default         @15 :Bool;
    dependency      @16 :Bool;
    installed       @17 :Bool;
    updateAvailable @18 :Bool; # née “has_update”
    
    keychain        @19 :StringMap;
    
    grammars        @20 :List(Grammar);
    dependants      @21 :List(Bundle);
    source          @22 :Source;
}

struct Grammar {
    
    uuid            @0  :UUID;
    name            @2  :String;
    scope           @1  :String;
    fileTypes       @3  :List(String);
    modeLine        @4  :String;
    
}