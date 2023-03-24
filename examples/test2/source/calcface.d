module calcface;

import bindbc.cocoa;

import calcbrain;

struct CalcFace
{
    NSWindow parent;
    alias parent this;
    mixin NSObjectTemplate!(NSWindow, "NSWindow");

    NSButton[18] buttons;
    NSTextField display;

    void build(){
        display = NSTextField.alloc; display.initWithFrame(NSMakeRect (40, 84, 182, 24));
        display.setEditable(NO);
        display.setBezeled(YES);
        display.setDrawsBackground(YES);
        display.setAlignment(right);

        buttons[0] = NSButton.alloc; buttons[0].initWithFrame(NSMakeRect (77, 3, 34, 24));
        buttons[0].setButtonType(NSToggleButton);
        buttons[0].setTitle(NSString.stringWith("0"w));
        buttons[0].setTag(0);
        buttons[0].setState(NO);
        buttons[0].setKeyEquivalent(NSString.stringWith("0"w));

        buttons[1] = NSButton.alloc; buttons[1].initWithFrame(NSMakeRect (114, 3, 34, 24));
        buttons[1].setButtonType(NSToggleButton);
        buttons[1].setTitle(NSString.stringWith("1"w));
        buttons[1].setTag(1);
        buttons[1].setState(NO);
        buttons[1].setKeyEquivalent(NSString.stringWith("1"w));

        buttons[2] = NSButton.alloc; buttons[2].initWithFrame(NSMakeRect (151, 3, 34, 24));
        buttons[2].setButtonType(NSToggleButton);
        buttons[2].setTitle(NSString.stringWith("2"w));
        buttons[2].setTag(2);
        buttons[2].setState(NO);
        buttons[2].setKeyEquivalent(NSString.stringWith("2"w));

        buttons[3] = NSButton.alloc; buttons[3].initWithFrame(NSMakeRect (188, 3, 34, 24));
        buttons[3].setButtonType(NSToggleButton);
        buttons[3].setTitle(NSString.stringWith("3"w));
        buttons[3].setTag(3);
        buttons[3].setState(NO);
        buttons[3].setKeyEquivalent(NSString.stringWith("3"w));

        buttons[4] = NSButton.alloc; buttons[4].initWithFrame(NSMakeRect (114, 30, 34, 24));
        buttons[4].setButtonType(NSToggleButton);
        buttons[4].setTitle(NSString.stringWith("4"w));
        buttons[4].setTag(4);
        buttons[4].setState(NO);
        buttons[4].setKeyEquivalent(NSString.stringWith("4"w));

        buttons[5] = NSButton.alloc; buttons[5].initWithFrame(NSMakeRect (151, 30, 34, 24));
        buttons[5].setButtonType(NSToggleButton);
        buttons[5].setTitle(NSString.stringWith("5"w));
        buttons[5].setTag(5);
        buttons[5].setState(NO);
        buttons[5].setKeyEquivalent(NSString.stringWith("5"w));

        buttons[6] = NSButton.alloc; buttons[6].initWithFrame(NSMakeRect (188, 30, 34, 24));
        buttons[6].setButtonType(NSToggleButton);
        buttons[6].setTitle(NSString.stringWith("6"w));
        buttons[6].setTag(6);
        buttons[6].setState(NO);
        buttons[6].setKeyEquivalent(NSString.stringWith("6"w));

        buttons[7] = NSButton.alloc; buttons[7].initWithFrame(NSMakeRect (114, 57, 34, 24));
        buttons[7].setButtonType(NSToggleButton);
        buttons[7].setTitle(NSString.stringWith("7"w));
        buttons[7].setTag(7);
        buttons[7].setState(NO);
        buttons[7].setKeyEquivalent(NSString.stringWith("7"w));

        buttons[8] = NSButton.alloc; buttons[8].initWithFrame(NSMakeRect (151, 57, 34, 24));
        buttons[8].setButtonType(NSToggleButton);
        buttons[8].setTitle(NSString.stringWith("8"w));
        buttons[8].setTag(8);
        buttons[8].setState(NO);
        buttons[8].setKeyEquivalent(NSString.stringWith("8"w));

        buttons[9] = NSButton.alloc; buttons[9].initWithFrame(NSMakeRect (188, 57, 34, 24));
        buttons[9].setButtonType(NSToggleButton);
        buttons[9].setTitle(NSString.stringWith("9"w));
        buttons[9].setTag(9);
        buttons[9].setState(NO);
        buttons[9].setKeyEquivalent(NSString.stringWith("9"w));
        
        foreach (i; 0..10){
            buttons[i].setAction(&calcbrain.digit);
        }

        buttons[10] = NSButton.alloc; buttons[10].initWithFrame(NSMakeRect (77, 30, 34, 24));
        buttons[10].setButtonType(NSToggleButton);
        buttons[10].setTitle(NSString.stringWith("."w));
        buttons[10].setState(NO);
        buttons[10].setKeyEquivalent(NSString.stringWith("."w));
        // [buttons[10] setAction: @selector(decimalSeparator:)];

        buttons[11] = NSButton.alloc; buttons[11].initWithFrame(NSMakeRect (77, 57, 34, 24));
        buttons[11].setButtonType(NSToggleButton);
        buttons[11].setTitle(NSString.stringWith("SQR"w));
        buttons[11].setState(NO);
        buttons[11].setKeyEquivalent(NSString.stringWith("S"w));
        // [buttons[11] setAction: @selector(squareRoot:)];

        buttons[12] = NSButton.alloc; buttons[12].initWithFrame(NSMakeRect (3, 30, 34, 24));
        buttons[12].setButtonType(NSToggleButton);
        buttons[12].setTitle(NSString.stringWith("+"w));
        buttons[12].setTag(addition);
        buttons[12].setState(NO);
        buttons[12].setKeyEquivalent(NSString.stringWith("+"w));
        // [buttons[12] setAction: @selector(operation:)];

        buttons[13] = NSButton.alloc; buttons[13].initWithFrame(NSMakeRect (40, 30, 34, 24));
        buttons[13].setButtonType(NSToggleButton);
        buttons[13].setTitle(NSString.stringWith("-"w));
        buttons[13].setTag(subtraction);
        buttons[13].setState(NO);
        buttons[13].setKeyEquivalent(NSString.stringWith("-"w));
        // [buttons[13] setAction: @selector(operation:)];

        buttons[14] = NSButton.alloc; buttons[14].initWithFrame(NSMakeRect (3, 57, 34, 24));
        buttons[14].setButtonType(NSToggleButton);
        buttons[14].setTitle(NSString.stringWith("*"w));
        buttons[14].setTag(multiplication);
        buttons[14].setState(NO);
        buttons[14].setKeyEquivalent(NSString.stringWith("*"w));
        // [buttons[14] setAction: @selector(operation:)];

        buttons[15] = NSButton.alloc; buttons[15].initWithFrame(NSMakeRect (40, 57, 34, 24));
        buttons[15].setButtonType(NSToggleButton);
        buttons[15].setTitle(NSString.stringWith("/"w));
        buttons[15].setTag(division);
        buttons[15].setState(NO);
        buttons[15].setKeyEquivalent(NSString.stringWith("/"w));
        // [buttons[15] setAction: @selector(operation:)];

        buttons[16] = NSButton.alloc; buttons[16].initWithFrame(NSMakeRect (3, 84, 34, 24));
        buttons[16].setButtonType(NSToggleButton);
        buttons[16].setTitle(NSString.stringWith("CL"w));
        buttons[16].setState(NO);
        buttons[16].setKeyEquivalent(NSString.stringWith("C"w));
        // [buttons[16] setAction: @selector(clear:)];

        buttons[17] = NSButton.alloc; buttons[17].initWithFrame(NSMakeRect (3, 3, 34, 24));
        buttons[17].setButtonType(NSToggleButton);
        buttons[17].setTitle(NSString.stringWith("="w));
        buttons[17].setState(NO);
        buttons[17].setKeyEquivalent(NSString.stringWith("="w));
        // [buttons[17] setAction: @selector(equal:)];

        this.makeFirstResponder(NSResponder(buttons[17]._id));

        foreach (ref but; buttons)
        {
            this.contentView().addSubview(but.contentView());
            but.release;
        }

        this.contentView().addSubview(display.contentView());
        display.release;

        this.setTitle(NSString.stringWith("Calculator"w));
        
        this.center();

        calcbrain.setFace(this);
    }

    void setDisplayedNumber(double aNumber, BOOL displayDecimalSeparator, int fractionalDigits)
    {
        import std.format, std.conv;
        if (displayDecimalSeparator)
        {
            display.setStringValue(NSString.stringWith(format(format!"%%#.%df"(fractionalDigits), aNumber).to!wstring));
        }
        else // !displayDecimalSeparator
            display.setStringValue(NSString.stringWith(format("%.0f", aNumber).to!wstring));

    }

    void setError(){
        display.setStringValue(NSString.stringWith("Error"w));
    }
}

/*
void onClicked(id self, SEL sel, ...){
    import std.conv;
    import std.stdio;
    writefln("You clicked the button with title `%s`", NSButton(self).title.UTF8String.to!string);
}
*/
enum : NSInteger{
    none,
    addition,
    subtraction,
    multiplication,
    division
}