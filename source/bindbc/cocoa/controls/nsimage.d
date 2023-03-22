module bindbc.cocoa.controls.nsimage;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

alias NSCellImagePosition = NSUInteger;
alias NSImageRef = void*;

struct NSImage
{
nothrow @nogc:
    NSObject parent;
    alias parent this;

    mixin NSObjectTemplate!(NSImage, "NSImage");
    // TODO: bind methods
}