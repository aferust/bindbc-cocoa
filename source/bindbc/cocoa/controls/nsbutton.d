module bindbc.cocoa.controls.nsbutton;

import bindbc.cocoa.controls.nscontrol;
import bindbc.cocoa.controls.nsimage;
import bindbc.cocoa.controls.nssound;
import bindbc.cocoa.runtime;
import bindbc.cocoa.foundation;
import bindbc.cocoa.appkit;

alias NSButtonType = NSUInteger;
enum : NSButtonType
{
    NSMomentaryLightButton,
    NSPushOnPushOffButton,
    NSToggleButton,
    NSSwitchButton,
    NSRadioButton,
    NSMomentaryChangeButton,
    NSOnOffButton,
    NSMomentaryPushInButton,

    NSAcceleratorButton,
    NSMultiLevelAcceleratorButton,

    // These are old names
    NSMomentaryLight = NSMomentaryPushInButton,
    NSMomentaryPushButton = NSMomentaryLightButton
}

alias NSBezelStyle = NSUInteger;
enum : NSBezelStyle {
  NSRoundedBezelStyle = 1,
  NSLargeIconButtonBezelStyle
}

struct NSButton
{
nothrow @nogc:
    NSControl parent;
    alias parent this;

    mixin NSObjectTemplate!(NSButton, "NSButton");

    NSView contentView()
    {
        return NSView(_id);
    }

    NSControl control(){
        return NSControl(_id);
    }

    void initWithFrame(NSRect rect)
    {
        alias fun_t = extern(C) void function (id, SEL, NSRect) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"initWithFrame:", rect);
    }

    void setButtonType(NSButtonType aType)
    {
        alias fun_t = extern(C) void function (id, SEL, NSButtonType) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setButtonType:", aType);
    }

    void setHighlightsBy(NSInteger aType)
    {
        alias fun_t = extern(C) void function (id, SEL, NSInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setHighlightsBy:", aType);
    }

    void setShowsStateBy(NSInteger aType)
    {
        alias fun_t = extern(C) void function (id, SEL, NSInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setShowsStateBy:", aType);
    }

    void setState(NSInteger value)
    {
        alias fun_t = extern(C) void function (id, SEL, NSInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setState:", value);
    }

    NSInteger state()
    {
        alias fun_t = extern(C) NSInteger function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"state");
    }

    BOOL allowsMixedState()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"allowsMixedState");
    }

    void setAllowsMixedState(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAllowsMixedState:", flag);
    }

    void setNextState()
    {
        alias fun_t = extern(C) void function (id, SEL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setNextState");
    }

    void getPeriodicDelay(CGFloat* delay, CGFloat* interval)
    {
        alias fun_t = extern(C) void function (id, SEL, CGFloat*, CGFloat*) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"getPeriodicDelay:", delay, interval);
    }

    void setPeriodicDelay(CGFloat delay, CGFloat interval)
    {
        alias fun_t = extern(C) void function (id, SEL, CGFloat, CGFloat) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setPeriodicDelay:", delay, interval);
    }

    NSString alternateTitle()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSString((cast(fun_t)objc_msgSend)(_id, sel!"alternateTitle"));
    }

    void setAlternateTitle(NSString aString)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAlternateTitle:", aString._id);
    }

    void setTitle(NSString title)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setTitle:", title._id);
    }

    NSString title()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSString((cast(fun_t)objc_msgSend)(_id, sel!"title"));
    }
    /+
    #if OS_API_VERSION(GS_API_MACOSX, GS_API_LATEST)
    - (NSAttributedString *)attributedAlternateTitle;
    - (NSAttributedString *)attributedTitle;
    - (void)setAttributedAlternateTitle:(NSAttributedString *)aString;
    - (void)setAttributedTitle:(NSAttributedString *)aString;
    - (void)setTitleWithMnemonic:(NSString *)aString;
    #endif
    +/

    NSImage alternateImage()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSImage((cast(fun_t)objc_msgSend)(_id, sel!"alternateImage"));
    }

    NSImage image()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSImage((cast(fun_t)objc_msgSend)(_id, sel!"image"));
    }

    NSCellImagePosition imagePosition()
    {
        alias fun_t = extern(C) NSCellImagePosition function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"imagePosition");
    }

    void setAlternateImage(NSImage anImage)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setAlternateImage:", anImage._id);
    }

    void setImage(NSImage anImage)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setImage:", anImage._id);
    }

    void setImagePosition(NSCellImagePosition aPosition)
    {
        alias fun_t = extern(C) void function (id, SEL, NSCellImagePosition) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setImagePosition:", aPosition);
    }

    BOOL isBordered()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isBordered");
    }

    BOOL isTransparent()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"isTransparent");
    }

    void setBordered(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setBordered:", flag);
    }

    void setTransparent(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setTransparent:", flag);
    }

    NSBezelStyle bezelStyle()
    {
        alias fun_t = extern(C) NSBezelStyle function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"bezelStyle");
    }

    void setBezelStyle(NSBezelStyle bezelStyle)
    {
        alias fun_t = extern(C) void function (id, SEL, NSBezelStyle) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setBezelStyle:", bezelStyle);
    }

    void setShowsBorderOnlyWhileMouseInside(BOOL show)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setShowsBorderOnlyWhileMouseInside:", show);
    }

    BOOL showsBorderOnlyWhileMouseInside()
    {
        alias fun_t = extern(C) BOOL function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"showsBorderOnlyWhileMouseInside");
    }

    void highlight(BOOL flag)
    {
        alias fun_t = extern(C) void function (id, SEL, BOOL) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"highlight:", flag);
    }

    NSString keyEquivalent()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSString((cast(fun_t)objc_msgSend)(_id, sel!"keyEquivalent"));
    }

    NSUInteger keyEquivalentModifierMask()
    {
        alias fun_t = extern(C) NSUInteger function (id, SEL) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"keyEquivalentModifierMask");
    }

    void setKeyEquivalent(NSString aKeyEquivalent)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setKeyEquivalent:", aKeyEquivalent._id);
    }

    void setKeyEquivalentModifierMask(NSUInteger mask)
    {
        alias fun_t = extern(C) void function (id, SEL, NSUInteger) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setKeyEquivalentModifierMask:", mask);
    }

    BOOL performKeyEquivalent(NSEvent anEvent)
    {
        alias fun_t = extern(C) BOOL function (id, SEL, id) nothrow @nogc;
        return (cast(fun_t)objc_msgSend)(_id, sel!"performKeyEquivalent", anEvent._id);
    }

    void setSound(NSSound aSound)
    {
        alias fun_t = extern(C) void function (id, SEL, id) nothrow @nogc;
        (cast(fun_t)objc_msgSend)(_id, sel!"setSound:", aSound._id);
    }

    NSSound sound()
    {
        alias fun_t = extern(C) id function (id, SEL) nothrow @nogc;
        return NSSound((cast(fun_t)objc_msgSend)(_id, sel!"sound"));
    }
}