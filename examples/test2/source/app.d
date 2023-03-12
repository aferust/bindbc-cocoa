module app;

import std.stdio;

import bindbc.cocoa;

void main(){
    // with Apple's cocoa
    auto _rt = loadRT("C:/Program Files/iTunes/objc.dll"); writeln(_rt);
    auto _fo = loadFoundation("C:/Program Files/iTunes/Foundation.dll"); writeln(_fo);
    auto _cg = loadCoreGraphics("C:/Program Files/iTunes/CoreGraphics.dll"); writeln(_cg);
    //auto _ak = loadAppkit("C:/Program Files/iTunes/WebKit.dll"); writeln(_ak); /// ????

    NSLog(NSString.stringWith("Hello from Cocoa, here is some number: %d\n"w)._id, 3);


}