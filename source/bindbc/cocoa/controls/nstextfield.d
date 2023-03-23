module bindbc.cocoa.controls.nstextfield;

import bindbc.cocoa.controls.nscontrol;
import bindbc.cocoa.controls.nscolor;
//import bindbc.cocoa.controls.nsimage;
//import bindbc.cocoa.controls.nssound;
import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

struct NSTextField
{
nothrow @nogc:
    NSControl parent;
    alias parent this;

    mixin NSObjectTemplate!(NSTextField, "NSTextField");

    NSView contentView()
    {
        return NSView(_id);
    }

    NSControl control(){
        return NSControl(_id);
    }

    BOOL isEditable()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isEditable");
    }

    BOOL isSelectable()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isSelectable");
    }

    void setEditable(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setEditable:", flag);
    }

    void setSelectable(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setSelectable:", flag);
    }

    void selectText(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setSelectable:", sender);
    }

    id nextText()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"nextText");
    }

    id previousText()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"previousText");
    }

    void setNextText(id anObject)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setNextText:", anObject);
    }

    void setPreviousText(id anObject)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setPreviousText:", anObject);
    }

    /+
    // Assigning a Delegate 
    //
    - (void)setDelegate:(id<NSTextFieldDelegate>)anObject;
    - (id<NSTextFieldDelegate>)delegate;
    +/

    NSColor backgroundColor()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSColor((cast(fun_t)objc_msgSend)(_id, sel!"backgroundColor"));
    }
    
    BOOL drawsBackground()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"drawsBackground");
    }
    
    BOOL isBezeled()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isBezeled");
    }
    
    BOOL isBordered()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isBordered");
    }

    void setBackgroundColor(NSColor aColor)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setBackgroundColor:", aColor._id);
    }
    
    void setBezeled(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setBezeled:", flag);
    }
    
    void setBordered(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setBordered:", flag);
    }
    
    void setDrawsBackground(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setDrawsBackground:", flag);
    }
    
    void setTextColor(NSColor aColor)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setTextColor:", aColor._id);
    }
    
    NSColor textColor()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSColor((cast(fun_t)objc_msgSend)(_id, sel!"textColor"));
    }
    
    void setPlaceholderString(NSString aString)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setPlaceholderString:", aString._id);
    }
    
    NSString placeholderString()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSString((cast(fun_t)objc_msgSend)(_id, sel!"placeholderString"));
    }
    //- (void) setPlaceholderAttributedString: (NSAttributedString *)string;
    //- (NSAttributedString *) placeholderAttributedString;
}

/*



*/