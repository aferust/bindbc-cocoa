module bindbc.cocoa.controls.nsfont;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

struct NSFont
{
nothrow @nogc:
    NSObject parent;
    alias parent this;

    mixin NSObjectTemplate!(NSFont, "NSFont");
    // TODO: bind methods
}