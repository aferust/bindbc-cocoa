module bindbc.cocoa.controls.nscolor;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

struct NSColor
{
nothrow @nogc:
    NSObject parent;
    alias parent this;

    mixin NSObjectTemplate!(NSColor, "NSColor");
    // TODO: bind methods
}