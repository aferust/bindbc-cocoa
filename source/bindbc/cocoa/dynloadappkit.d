module bindbc.cocoa.dynloadappkit;

import bindbc.cocoa.appkit;
import bindbc.cocoa.coreimage;

import bindbc.loader;

private {
    SharedLib lib;
    AppkitSupport loadedVersion;
}

enum AppkitSupport {
    noLibrary,
    badLibrary,
    appkitLibrary
}

void unloadAppkit()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

AppkitSupport loadedAppkitVersion() { return loadedVersion; }

bool isAppkitLoaded() { return lib != invalidHandle; }

AppkitSupport loadAppkit(const(char)* libName)
{
    // If the library isn't yet loaded, load it now.
    if(lib == invalidHandle) {
        lib = load(libName);
        if(lib == invalidHandle) {
            return AppkitSupport.noLibrary;
        }
    }

    auto errCount = errorCount();

    lib.bindSymbol(cast(void**)&NSApplicationLoad, "NSApplicationLoad");
    // Core Image
    // MAYDO load from proper global variables
    kCIFormatARGB8 = 23;
    kCIFormatRGBA16 = 27;
    kCIFormatRGBAf = 34;
    kCIFormatRGBAh = 31;
    
    if(errorCount() != errCount) loadedVersion = AppkitSupport.badLibrary;
    else loadedVersion = AppkitSupport.appkitLibrary;

    return loadedVersion;
}
