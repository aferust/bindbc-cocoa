module app;

import std.stdio;
import core.stdc.stdio;

import bindbc.cocoa;

void main(string[] args){
    // with Apple's cocoa
    auto _rt = loadRT("D:/GNUstep/x64/Release/bin/objc.dll"); writeln(_rt);
    auto _fo = loadFoundation("D:/GNUstep/x64/Release/bin/gnustep-base-1_29.dll"); writeln(_fo); 
    //auto _cg = loadCoreGraphics("D:/GNUstep/x64/Release/bin/gnustep-gui-0.dll"); writeln(_cg);
    auto _ak = loadAppkit("D:/GNUstep/x64/Release/bin/gnustep-gui-0.dll"); writeln(_ak); /// ????

    NSLog(NSString.stringWith("Hello from Cocoa, here is some number: %d/n"w)._id, 3);

    NSApplication app = NSApplication.sharedApplication();
    
    NSWindow win = NSWindow.alloc();
    NSRect rect = NSRect(NSPoint(0.0, 0.0), NSSize(500.0, 500.0));

    win.initWithContentRect(rect, 
        NSTitledWindowMask | NSMiniaturizableWindowMask | NSClosableWindowMask | NSResizableWindowMask, 
        NSBackingStoreBuffered, NO);
    
    /*NSView nv = NSView.alloc;
    nv.initWithFrame(NSMakeRect (77, 3, 34, 24));
    win.contentView.addSubview(nv);
    win.makeFirstResponder(nv);*/
    
    NSButton but1 = NSButton.alloc();
    but1.initWithFrame(NSMakeRect (77, 3, 34, 24));
    but1.setTitle(NSString.stringWith("hello"w));
    //but1.setButtonType(NSRadioButton);
    but1.control.setAction(&onClicked);
    but1.setAlternateTitle(NSString.stringWith("my alter"w));
    
    win.contentView().addSubview(but1.contentView());

    win.setTitle(NSString.stringWith("My Test App"w));
    
    win.contentView.setFrameSize(NSSize(200.0, 200.0));
    win.center();
    win.setIsVisible(YES);

    app.setDelegate(win._id);
    app.run();
}

import std.conv;
extern (C) void onClicked(id self, SEL sel){
    writefln("You clicked the button with title `%s`", NSButton(self).title.UTF8String.to!string);
}