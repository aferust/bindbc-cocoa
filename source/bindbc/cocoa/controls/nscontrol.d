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

    void setAction(void* fun){
        // https://stackoverflow.com/questions/22570842/c-function-pointer-to-sel
        class_addMethod(getClass, sel!"myNewAction", cast(IMP)fun, "v@:@");
        alias fun_t = extern(C) void function (id, SEL, SEL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAction:", sel!"myNewAction");
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