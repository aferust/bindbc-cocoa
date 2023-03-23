module bindbc.cocoa.controls.nscontrol;

import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;
import bindbc.cocoa.controls.nscell;
import bindbc.cocoa.controls.nsfont;

alias NSTextAlignment = NSUInteger;
enum : NSTextAlignment {
    left, right, center, justified, natural
}

struct NSControl
{
nothrow @nogc:
    NSView parent;
    alias parent this;

    mixin NSObjectTemplate!(NSControl, "NSControl");

    Class cellClass(){
        alias fun_t = extern(C) Class function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"cellClass");
    }

    void setCellClass(Class factoryId){

        alias fun_t = extern(C) void function (id, SEL, Class) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setCellClass:", factoryId);
    }

    id cell(){
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"cell");
    }

    void setCell(NSCell aCell){

        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setCell:", aCell._id);
    }

    BOOL isEnabled(){
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isEnabled");
    }
    
    void setEnabled(BOOL flag){

        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setEnabled:", flag);
    }

    id selectedCell(){
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"selectedCell");
    }
    
    void setDoubleValue(double aDouble){

        alias fun_t = extern(C) void function (id, SEL, double) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setDoubleValue:", aDouble);
    }
    
    double doubleValue(){
        alias fun_t = extern(C) double function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"doubleValue");
    }

    void setFloatValue(float aFloat){

        alias fun_t = extern(C) void function (id, SEL, float) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setFloatValue:", aFloat);
    }
    
    float floatValue(){
        alias fun_t = extern(C) float function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"floatValue");
    }

    void setIntValue(int anInt){

        alias fun_t = extern(C) void function (id, SEL, int) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setIntValue:", anInt);
    }
    
    int intValue(){
        alias fun_t = extern(C) int function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"intValue");
    }

    void setIntegerValue(NSInteger anInt){

        alias fun_t = extern(C) void function (id, SEL, NSInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setIntValue:", anInt);
    }
    
    NSInteger integerValue(){
        alias fun_t = extern(C) NSInteger function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"integerValue");
    }

    void takeIntegerValueFrom(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"takeIntegerValueFrom:", sender);
    }

    NSSize sizeThatFits(NSSize size){
        alias fun_t = extern(C) NSSize function (id, SEL, NSSize) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"sizeThatFits:", size);
    }

    void setStringValue(NSString aString)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setStringValue:", aString._id);
    }
    
    NSString stringValue()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSString((cast(fun_t)objc_msgSend)(_id, sel!"stringValue"));
    }

    void setObjectValue(id anObject)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setStringValue:", anObject);
    }

    id objectValue(){
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"objectValue");
    }

    void setNeedsDisplay()
    {
        alias fun_t = extern(C) void function (id, SEL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setNeedsDisplay");
    }

    void takeDoubleValueFrom(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"takeDoubleValueFrom:", sender);
    }
    
    void takeFloatValueFrom(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"takeFloatValueFrom:", sender);
    }
    
    void takeIntValueFrom(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"takeIntValueFrom:", sender);
    }
    
    void takeStringValueFrom(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"takeStringValueFrom:", sender);
    }
    
    void takeObjectValueFrom(id sender)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"takeObjectValueFrom:", sender);
    }

    NSTextAlignment alignment(){
        alias fun_t = extern(C) NSTextAlignment function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"alignment");
    }

    NSFont font(){
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSFont((cast(fun_t)objc_msgSend)(_id, sel!"font"));
    }

    void setAlignment(NSTextAlignment mode){
        alias fun_t = extern(C) void function (id, SEL, NSTextAlignment) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAlignment:", mode);
    }

    void setFont(NSFont fontObject){
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setFont:", fontObject._id);
    }

    // TODO 
    /+
    - (void)setFloatingPointFormat:(BOOL)autoRange
                left:(NSUInteger)leftDigits
                right:(NSUInteger)rightDigits;
    #if OS_API_VERSION(GS_API_MACOSX, GS_API_LATEST)
    - (void)setFormatter:(NSFormatter*)newFormatter;
    - (id)formatter;
    #endif
    #if OS_API_VERSION(MAC_OS_X_VERSION_10_4, GS_API_LATEST)
    - (NSWritingDirection)baseWritingDirection;
    - (void)setBaseWritingDirection:(NSWritingDirection)direction;
    #endif

    //
    // Managing the Field Editor 
    //
    - (BOOL)abortEditing;
    - (NSText *)currentEditor;
    - (void)validateEditing;

    //
    // Resizing the Control 
    //
    - (void)calcSize;
    - (void)sizeToFit;

    //
    // Displaying the Control and Cell 
    //
    - (void)drawCell:(NSCell *)aCell;
    - (void)drawCellInside:(NSCell *)aCell;
    - (void)selectCell:(NSCell *)aCell;
    - (void)updateCell:(NSCell *)aCell;
    - (void)updateCellInside:(NSCell *)aCell;

    //
    // Target and Action 
    +/

    NSInteger selectedTag(){
        alias fun_t = extern(C) NSInteger function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"selectedTag");
    }

    SEL action(){
        alias fun_t = extern(C) SEL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"action");
    }

    void setAction(void function(id, SEL, ...) fun){
        
        import core.stdc.stdio;
        
        char* _cp = cast(char*)_id;

        char[32] m_name;
        sprintf(m_name.ptr, "%p_action", _cp);

        SEL _sel = varsel_registerName(m_name.ptr);

        class_addMethod(_id.isa, _sel, cast(IMP)fun, "v@:i@");
        alias fun_t = extern(C) void function (id, SEL, SEL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAction:", _sel);
    }

    void setTarget(id anObject){

        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setTarget:", anObject);
    }

    void setTag(NSInteger anInt){

        alias fun_t = extern(C) void function (id, SEL, NSInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setTag:", anInt);
    }

    NSInteger tag(){
        alias fun_t = extern(C) NSInteger function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"tag");
    }
}

/+ TODO


//
// Enabling and Disabling the Control 
//
- (BOOL)isEnabled;
- (void)setEnabled:(BOOL)flag;

//
// Identifying the Selected Cell 
//
- (id)selectedCell;
- (NSInteger)selectedTag;

//
// Setting the Control's Value 
//
- (void) setDoubleValue: (double)aDouble;
- (double) doubleValue;

- (void) setFloatValue: (float)aFloat;
- (float) floatValue;

- (void) setIntValue: (int)anInt;
- (int) intValue;

#if OS_API_VERSION(MAC_OS_X_VERSION_10_5, GS_API_LATEST)
- (NSInteger) integerValue;
- (void) setIntegerValue: (NSInteger)anInt;
- (void) takeIntegerValueFrom: (id)sender;
#endif

#if OS_API_VERSION(MAC_OS_X_VERSION_10_10, GS_API_LATEST)
- (NSSize) sizeThatFits: (NSSize)size;
#endif

- (void) setStringValue: (NSString *)aString;
- (NSString *) stringValue;

- (void) setObjectValue: (id)anObject;
- (id) objectValue;

- (void) setNeedsDisplay;

//
// Interacting with Other Controls 
//
- (void) takeDoubleValueFrom: (id)sender;
- (void) takeFloatValueFrom: (id)sender;
- (void) takeIntValueFrom: (id)sender;
- (void) takeStringValueFrom: (id)sender;
- (void) takeObjectValueFrom: (id)sender;

+/