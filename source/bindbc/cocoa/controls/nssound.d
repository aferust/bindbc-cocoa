module bindbc.cocoa.controls.nssound;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

alias NSSoundRef = void*;

struct NSSound
{
nothrow @nogc:
    NSObject parent;
    alias parent this;

    mixin NSObjectTemplate!(NSSound, "NSSound");
    // TODO: bind methods
}