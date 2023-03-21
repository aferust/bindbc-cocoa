module app;

import std.stdio;
import core.stdc.stdio;

import bindbc.cocoa;

void main(string[] args){
    // with Apple's cocoa
    auto _rt = loadRT("D:/GNUstep/x64/Release/bin/objc.dll"); writeln(_rt);
    auto _fo = loadFoundation("D:/GNUstep/x64/Release/bin/gnustep-base-1_29.dll"); writeln(_fo); 
    auto _cg = loadCoreGraphics("D:/GNUstep/x64/Release/bin/gnustep-gui-0.dll"); writeln(_cg);
    auto _ak = loadAppkit("D:/GNUstep/x64/Release/bin/gnustep-gui-0.dll"); writeln(_ak); /// ????

    //NSApplicationLoad();
    NSLog(NSString.stringWith("Hello from Cocoa, here is some number: %d/n"w)._id, 3);

    NSApplication app = NSApplication.sharedApplication();

    NSWindow win = NSWindow.alloc();
    NSRect rect = NSRect(NSPoint(0.0, 0.0), NSSize(200.0, 200.0));

    //win.init_;
    win.initWithContentRect(rect, 
        NSTitledWindowMask | NSMiniaturizableWindowMask | NSClosableWindowMask, 
        NSBackingStoreBuffered, NO);
    
    NSView nv = NSView.alloc;
    nv.initWithFrame(NSMakeRect (77, 3, 34, 24));
    win.contentView.addSubview(nv);
    win.makeFirstResponder(nv);
    
    alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
    (cast(fun_t)objc_msgSend)(win._id, sel!"setTitle:", NSString.stringWith("My Test App"w)._id);
    

    app.setDelegate(win.getClassID);
    
    win.contentView.setFrameSize(NSSize(200.0, 200.0));

    app.run();
    
    // does not work. no windows displayed!
}