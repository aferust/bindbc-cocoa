module bindbc.cocoa.dynloadfoundation;

import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

import bindbc.loader;

private {
    SharedLib lib;
    FoundationSupport loadedVersion;
}

enum FoundationSupport {
    noLibrary,
    badLibrary,
    foundationLibrary
}

void unloadFoundation()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

FoundationSupport loadedFoundationVersion() { return loadedVersion; }

bool isFoundationLoaded() { return lib != invalidHandle; }

FoundationSupport loadFoundation(const(char)* libName)
{
    // If the library isn't yet loaded, load it now.
    if(lib == invalidHandle) {
        lib = load(libName);
        if(lib == invalidHandle) {
            return FoundationSupport.noLibrary;
        }
    }

    auto errCount = errorCount();

    lib.bindSymbol(cast(void**)&NSLog, "NSLog");
    lib.bindSymbol(cast(void**)&NSAllocateMemoryPages, "NSAllocateMemoryPages");
    lib.bindSymbol(cast(void**)&NSDeallocateMemoryPages, "NSDeallocateMemoryPages");

    lib.bindSymbol(cast(void**)&NSClassFromString, "NSClassFromString");
    lib.bindSymbol(cast(void**)&NSStringFromClass, "NSStringFromClass");
    lib.bindSymbol(cast(void**)&NSSelectorFromString, "NSSelectorFromString");
    lib.bindSymbol(cast(void**)&NSStringFromSelector, "NSStringFromSelector");
    lib.bindSymbol(cast(void**)&NSStringFromProtocol, "NSStringFromProtocol");
    lib.bindSymbol(cast(void**)&NSProtocolFromString, "NSProtocolFromString");

    // MAYDO: load from proper global variables
    NSRunLoopCommonModes = NSString.stringWith("kCFRunLoopCommonModes"w);

    kCAContentsFormatRGBA8Uint = NSString.stringWith("RGBA8"w); // value from Big Sur

    // For debugging purpose
    //NSLog(NSString.stringWith("%@\n")._id, NSDefaultRunLoopMode._id);
    //NSLog(NSString.stringWith("%@\n")._id, NSRunLoopCommonModes._id);
    
    if(errorCount() != errCount) loadedVersion = FoundationSupport.badLibrary;
    else loadedVersion = FoundationSupport.foundationLibrary;

    return loadedVersion;
}
