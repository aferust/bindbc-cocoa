module app;

import std.stdio;

import bindbc.cocoa;

import calcface;
import calcbrain;

void main(string[] args){
    // with Apple's cocoa
    version(OSX){
        auto _rt = loadRT("/System/Library/Frameworks/Cocoa.framework/Cocoa"); writeln(_rt);
        auto _fo = loadFoundation("/System/Library/Frameworks/Cocoa.framework/Cocoa"); writeln(_fo);
        auto _ak = loadAppkit("/System/Library/Frameworks/Cocoa.framework/Cocoa"); writeln(_ak);
    // with GNUstep
    }else version(Windows){
        auto _rt = loadRT("D:/GNUstep/x64/Release/bin/objc.dll"); writeln(_rt);
        auto _fo = loadFoundation("D:/GNUstep/x64/Release/bin/gnustep-base-1_29.dll"); writeln(_fo); 
        auto _ak = loadAppkit("D:/GNUstep/x64/Release/bin/gnustep-gui-0.dll"); writeln(_ak);
    }else static assert(0);

    NSApplication app = NSApplication.sharedApplication();
    
    CalcFace win; win.parent = CalcFace.alloc();
    
    NSRect rect = NSRect(NSPoint(100.0, 100.0), NSSize(225.0, 111.0));

    win.initWithContentRect(rect, 
        NSTitledWindowMask | NSMiniaturizableWindowMask | NSClosableWindowMask | NSResizableWindowMask, 
        NSBackingStoreBuffered, NO);
    win.build();
    
    win.setIsVisible(YES);

    app.setDelegate(win._id);
    app.run();
}

