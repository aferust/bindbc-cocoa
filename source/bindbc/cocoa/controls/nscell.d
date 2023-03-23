module bindbc.cocoa.controls.nscell;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

struct NSCell
{
nothrow @nogc:
    NSObject parent;
    alias parent this;

    mixin NSObjectTemplate!(NSCell, "NSCell");
    // TODO: bind methods
}