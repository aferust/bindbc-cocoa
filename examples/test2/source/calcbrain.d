module calcbrain;

import bindbc.cocoa;
import core.stdc.stdio;

import core.stdc.math : pow, sqrt, ceil;

import calcface;

CalcFace face;
double result = 0.0;
double enteredNumber = 0.0;
NSInteger op = none;
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
  result = 0;
  enteredNumber = 0;
  op = none;
  fractionalDigits = 0;
  decSep = NO;
  editing = YES;
  face.setError();
}

//extern (C):
// The various buttons 
void clear(id sender, SEL sel, ...){
  result = 0;
  enteredNumber = 0;
  op = none;
  fractionalDigits = 0;
  decSep = NO;
  editing = YES;
  face.setDisplayedNumber(0, NO, 0);
}

void equal(id sender){
  switch (op)
    {
    case none: 
      result = enteredNumber;
      enteredNumber = 0;
      decSep = NO;
      fractionalDigits = 0;
      return;
    case addition:
      result = result + enteredNumber;
      break;
    case subtraction:
      result = result - enteredNumber;
      break;
    case multiplication:
      result = result * enteredNumber;
      break;
    case division:
      if (enteredNumber == 0)
      {
        error();
        return;
      }
      else 
	      result = result / enteredNumber;
        break;
      default: assert(0);
    }
  face.setDisplayedNumber(result,	(ceil(result) != result), 7);
  enteredNumber = result;
  op = none;
  editing = NO;
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

void decimalSeparator(id sender){
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
    if (op == none)
    {
      result = enteredNumber;
      enteredNumber = 0;
      decSep = NO;
      fractionalDigits = 0;
      op = NSButton(sender).tag;
      
    }
  else // operation
    {	 
      equal(null);
      operation(sender, null);
    }
    
}

void squareRoot(id sender){
  if (op == none)
    {
      result = sqrt (enteredNumber);
      face.setDisplayedNumber(result, (ceil(result) != result ? YES : NO), 7);
      enteredNumber = result;
      editing = NO;
      op = none;  
    }
  else // operation
    {	 
      equal(null);
      squareRoot(sender);
    }
}