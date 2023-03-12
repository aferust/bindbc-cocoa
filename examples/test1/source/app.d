module app;

import std.stdio;

import bindbc.cocoa;

void main(){
    
    auto _rt = loadRT("D:/developer_tools/GNUstep/x64/Release/bin/objc.dll"); writeln(_rt);
    auto _fo = loadFoundation("D:/developer_tools/GNUstep/x64/Release/bin/gnustep-base-1_28.dll"); writeln(_fo);

    NSLog(NSString.stringWith("Hello from Cocoa, here is some number: %d\n"w)._id, 3);
}