
# N.B. This is a *relative import* from somewhere on Cap‘n’P’s
# include path – apparently “import "/capnp/c++.capnp"” (with
# the misleadingly absolute-path-looking slash prefix) is how
# Cap‘n’P says something like e.g. “#include <capnp/c++.capnp>”
# …I just spent like 45 minutes trying to figure out why it 
# didn’t work with only `using Cpp = import "c++.capnp"` and
# this comment will now stand here until the end of time to
# commemorate this completely irritating waste of my time. Yes.
using Cpp = import "/capnp/c++.capnp";

@0xf7b1168c865460f0;
$Cpp.namespace("tmi::bundleshop");

using Detail = import "detail.capnp";

struct Source {
    
    name            @0  :Detail.String;
    identifier      @1  :Detail.String;
    
    url             @2  :Detail.URL;
    path            @3  :Detail.Path;
    rank            @4  :Int32;
    disabled        @5  :Bool;
    
    keychain        @6  :Detail.KeychainT;
    
    pathUpdated     @7  :Detail.Time;
    updateAvailable @8  :Bool; # née “needs_update”
}

struct Bundle {
    
    uuid            @0  :Detail.UUID;
    origin          @1  :Detail.String;
    name            @2  :Detail.String;
    category        @3  :Detail.String;
    
    htmlURL         @4  :Detail.URL;
    description     @5  :Detail.String;
    contactName     @6  :Detail.String;
    contactEmail    @7  :Detail.Email;
    
    url             @8  :Detail.URL;
    urlUpdated      @9  :Detail.Time;
    path            @10 :Detail.Path;
    pathUpdated     @11 :Detail.Time;
    
    rank            @12 :Int32;
    size            @13 :Int32;
    
    requisite       @14 :Bool;
    default         @15 :Bool;
    dependency      @16 :Bool;
    installed       @17 :Bool;
    updateAvailable @18 :Bool; # née “has_update”
    
    keychain        @19 :Detail.KeychainT;
    
    grammars        @20 :List(Grammar);
    dependants      @21 :List(Bundle);
    source          @22 :Source;
}

struct Grammar {
    
    uuid            @0  :Detail.UUID;
    name            @2  :Detail.String;
    scope           @1  :Detail.String;
    fileTypes       @3  :List(Detail.String);
    modeLine        @4  :Detail.String;
    
}