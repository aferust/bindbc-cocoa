module app;

import std.stdio;

import bindbc.cocoa;

void main(){
    version(Windows){
        // with GNUstep on Windows
        //auto _rt = loadRT("D:/developer_tools/GNUstep/x64/Release/bin/objc.dll"); writeln(_rt);
        //auto _fo = loadFoundation("D:/developer_tools/GNUstep/x64/Release/bin/gnustep-base-1_28.dll"); writeln(_fo);
        // with Apple's cocoa on Windows
        auto _rt = loadRT("C:/Program Files/iTunes/objc.dll"); writeln(_rt);
        auto _fo = loadFoundation("C:/Program Files/iTunes/Foundation.dll"); writeln(_fo);
    }else version(OSX){
        auto _rt = loadRT("/System/Library/Frameworks/Cocoa.framework/Cocoa"); writeln(_rt);
        auto _fo = loadFoundation("/System/Library/Frameworks/Cocoa.framework/Cocoa"); writeln(_fo);
    }else static assert(0);

    NSLog(NSString.stringWith("Hello from Cocoa, here is some number: %d\n"w)._id, 3);
}