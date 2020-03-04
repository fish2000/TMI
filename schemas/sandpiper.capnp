
using Cpp = import "/capnp/c++.capnp";

@0xc3e8e535eee1a9d9;
$Cpp.namespace("tmi::sandpiper");

using Detail = import "detail.capnp";

enum Ops {
    auth        @0;
    join        @1;
    quit        @2;
    stat        @3;
    twit        @4;
    post        @5;
    fdbk        @6;
    ofmg        @7;
    noop        @8;
}