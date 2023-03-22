module bindbc.cocoa.controls.nscontrol;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

struct NSControl
{
nothrow @nogc:
    NSView parent;
    alias parent this;

    mixin NSObjectTemplate!(NSControl, "NSControl");

    void setAction(void function(id, SEL, ...) fun){
        
        import core.stdc.stdio;
        
        char* _cp = cast(char*)_id;

        char[32] m_name;
        sprintf(m_name.ptr, "%p_action", _cp);

        SEL _sel = varsel_registerName(m_name.ptr);

        class_addMethod(_id.isa, _sel, cast(IMP)fun, "v@:i@");
        alias fun_t = extern(C) void function (id, SEL, SEL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAction:", _sel);
    }

    void setTag(NSInteger anInt){

        alias fun_t = extern(C) void function (id, SEL, NSInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setTag:", anInt);
    }

    NSInteger tag(){
        alias fun_t = extern(C) NSInteger function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"tag");
    }
}

/+ TODO
//
// Target and Action 
//
- (SEL)action;
- (BOOL)isContinuous;
- (BOOL)sendAction:(SEL)theAction
		to:(id)theTarget;
- (NSInteger)sendActionOn:(NSInteger)mask;
- (void)setAction:(SEL)aSelector;
- (void)setContinuous:(BOOL)flag;
- (void)setTarget:(id)anObject;
- (id)target;

+/