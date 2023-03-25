module bindbc.cocoa.dynloadruntime;

import bindbc.cocoa.runtime;

import bindbc.loader;

private {
    SharedLib lib;
    RTSupport loadedVersion;
}

enum RTSupport {
    noLibrary,
    badLibrary,
    rtLibrary
}

void unloadRT()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

RTSupport loadedRTVersion() { return loadedVersion; }

bool isRTLoaded() { return lib != invalidHandle; }

RTSupport loadRT(const(char)* libName)
{
    // If the library isn't yet loaded, load it now.
    if(lib == invalidHandle) {
        lib = load(libName);
        if(lib == invalidHandle) {
            return RTSupport.noLibrary;
        }
    }

    auto errCount = errorCount();

    lib.bindSymbol(cast(void**)&objc_registerClassPair, "objc_registerClassPair");
    lib.bindSymbol(cast(void**)&varclass_addIvar, "class_addIvar");
    lib.bindSymbol(cast(void**)&varclass_addMethod, "class_addMethod");
    lib.bindSymbol(cast(void**)&varobjc_allocateClassPair, "objc_allocateClassPair");
    lib.bindSymbol(cast(void**)&objc_disposeClassPair, "objc_disposeClassPair");
    lib.bindSymbol(cast(void**)&varobjc_getClass, "objc_getClass");
    lib.bindSymbol(cast(void**)&objc_getMetaClass, "objc_getMetaClass");
    lib.bindSymbol(cast(void**)&varobjc_lookUpClass, "objc_lookUpClass");

    lib.bindSymbol(cast(void**)&objc_msgSend, "objc_msgSend");
    lib.bindSymbol(cast(void**)&objc_msgSendSuper, "objc_msgSendSuper");
    version(AnyX86) lib.bindSymbol(cast(void**)&objc_msgSend_stret, "objc_msgSend_stret");
    version(X86) lib.bindSymbol(cast(void**)&objc_msgSend_fpret, "objc_msgSend_fpret");

    lib.bindSymbol(cast(void**)&varobject_getClassName, "object_getClassName");
    lib.bindSymbol(cast(void**)&object_getInstanceVariable, "object_getInstanceVariable");
    lib.bindSymbol(cast(void**)&object_setInstanceVariable, "object_setInstanceVariable");
    lib.bindSymbol(cast(void**)&varsel_registerName, "sel_registerName");

    lib.bindSymbol(cast(void**)&varclass_getInstanceMethod, "class_getInstanceMethod");
    lib.bindSymbol(cast(void**)&method_setImplementation, "method_setImplementation");

    lib.bindSymbol(cast(void**)&class_addProtocol, "class_addProtocol");
    lib.bindSymbol(cast(void**)&objc_getProtocol, "objc_getProtocol");
    lib.bindSymbol(cast(void**)&objc_allocateProtocol, "objc_allocateProtocol"); // min 10.7
    lib.bindSymbol(cast(void**)&objc_registerProtocol, "objc_registerProtocol"); // min 10.7
    lib.bindSymbol(cast(void**)&class_conformsToProtocol, "class_conformsToProtocol"); // min 10.5
    lib.bindSymbol(cast(void**)&protocol_addMethodDescription, "protocol_addMethodDescription"); // min 10.7
    
    if(errorCount() != errCount) loadedVersion = RTSupport.badLibrary;
    else loadedVersion = RTSupport.rtLibrary;

    return loadedVersion;
}
