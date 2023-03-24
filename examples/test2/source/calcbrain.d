module calcbrain;

import bindbc.cocoa;
import core.stdc.stdio;

import core.stdc.math : pow;

import calcface;

CalcFace face;
double result;
double enteredNumber = 0.0;
NSInteger op;
int fractionalDigits;
BOOL decSep = NO;
BOOL editing = YES;

// Set the corresponding face
void setFace(ref CalcFace aFace){
    face = aFace;
    face.setDisplayedNumber(enteredNumber, decSep, fractionalDigits);
}

// Jump here on calculation errors
void error(){

}

//extern (C):
// The various buttons 
void clear(id sender, SEL sel, ...){

}

void equal(id sender, SEL sel, ...){

}

void digit(id sender, SEL sel, ...){
    import std.conv;
    import std.stdio;
    //writefln("You clicked the button with tag `%s`", NSButton(sender).tag);
    if (!editing)
    {
      enteredNumber = 0;
      decSep = NO;
      fractionalDigits = 0;
      editing = YES;
    }
    if(decSep){
        enteredNumber = enteredNumber + NSButton(sender).tag * pow (0.1, 1+fractionalDigits);
        fractionalDigits++;
    }else{
        enteredNumber = enteredNumber * 10 + NSButton(sender).tag;
        if (enteredNumber > pow (10, 15)){
            error();
            return;
        }
    }
    face.setDisplayedNumber(enteredNumber, decSep, fractionalDigits);
}

void decimalSeparator(id sender, SEL sel, ...){
    if (!editing)
    {
      enteredNumber = 0;
      decSep = NO;
      fractionalDigits = 0;
      editing = YES;
    }
    if (!decSep)
    {
      decSep = YES;
      face.setDisplayedNumber(enteredNumber, YES, 0);
    }
}

void operation(id sender, SEL sel, ...){

}

void squareRoot(id sender, SEL sel, ...){

}