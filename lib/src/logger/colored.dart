/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
 Powered by https://github.com/iamsalnikov/colorize open source
*/

/// Base on ANSI Escape code,
/// this enum define the support print log style and color
///
enum ANSIStyles {
  // reset char
  reset,

  // fontStyle
  bold,

  // fontStyle
  dark,

  // fontStyle
  italic,

  // fontStyle
  underline,

  // fontStyle
  blink,

  // fontStyle
  reverse,

  // fontStyle
  concealed,

  // fontStyle
  defaultStyle,

  // text color
  black,

  // text color
  red,

  // text color
  green,

  // text color
  yellow,

  // text color
  blue,

  // text color
  magenta,

  // text color
  cyan,

  // text color
  lightGray,

  // text color
  lightCyan,

  // text color
  darkGray,

  // text color
  lightRed,

  // text color
  lightGreen,

  // text color
  lightYellow,

  // text color
  lightBlue,

  // text color
  lightMagenta,

  // text color
  white,

  // text background
  bgDefault,

  // text background
  bgBlack,

  // text background
  bgRed,

  // text background
  bgGreen,

  // text background
  bgYellow,

  // text background
  bgBlue,

  // text background
  bgMagenta,

  // text background
  bgCyan,

  // text background
  bgLightGray,

  // text background
  bgDarkGray,

  // text background
  bgLightRed,

  // text background
  bgLightGreen,

  // text background
  bgLightYellow,

  // text background
  bgLightBlue,

  // text background
  bgLightMagenta,

  // text background
  bgLightCyan,

  // text background
  bgWhite,
}

String _getStyle(ANSIStyles style) {
  switch (style) {
    case ANSIStyles.reset:
      return '0';
    case ANSIStyles.bold:
      return '1';
    case ANSIStyles.dark:
      return '2';
    case ANSIStyles.italic:
      return '3';
    case ANSIStyles.underline:
      return '4';
    case ANSIStyles.blink:
      return '5';
    case ANSIStyles.reverse:
      return '7';
    case ANSIStyles.concealed:
      return '8';
    case ANSIStyles.defaultStyle:
      return '39';
    case ANSIStyles.black:
      return '30';
    case ANSIStyles.red:
      return '31';
    case ANSIStyles.green:
      return '32';
    case ANSIStyles.yellow:
      return '33';
    case ANSIStyles.blue:
      return '34';
    case ANSIStyles.magenta:
      return '35';
    case ANSIStyles.cyan:
      return '36';
    case ANSIStyles.lightGray:
      return '37';
    case ANSIStyles.darkGray:
      return '90';
    case ANSIStyles.lightRed:
      return '91';
    case ANSIStyles.lightGreen:
      return '92';
    case ANSIStyles.lightYellow:
      return '93';
    case ANSIStyles.lightBlue:
      return '94';
    case ANSIStyles.lightMagenta:
      return '95';
    case ANSIStyles.lightCyan:
      return '96';
    case ANSIStyles.white:
      return '97';
    case ANSIStyles.bgDefault:
      return '49';
    case ANSIStyles.bgBlack:
      return '40';
    case ANSIStyles.bgRed:
      return '41';
    case ANSIStyles.bgGreen:
      return '42';
    case ANSIStyles.bgYellow:
      return '43';
    case ANSIStyles.bgBlue:
      return '44';
    case ANSIStyles.bgMagenta:
      return '45';
    case ANSIStyles.bgCyan:
      return '46';
    case ANSIStyles.bgLightGray:
      return '47';
    case ANSIStyles.bgDarkGray:
      return '100';
    case ANSIStyles.bgLightRed:
      return '101';
    case ANSIStyles.bgLightGreen:
      return '102';
    case ANSIStyles.bgLightYellow:
      return '103';
    case ANSIStyles.bgLightBlue:
      return '104';
    case ANSIStyles.bgLightMagenta:
      return '105';
    case ANSIStyles.bgLightCyan:
      return '106';
    case ANSIStyles.bgWhite:
      return '107';
  }
}

/// return text with ANSI format
/// example: print('\u{1B}[31m\u{1B}[103mHello World!\u{1B}[0m');
///
String apply(
  String text, {
  ANSIStyles? color,
  ANSIStyles? bg,
  ANSIStyles? fontStyle,
}) {
  String rs = text;

  if (color != null) {
    rs = '\u{1B}[${_getStyle(color)}m' + rs;
  }
  if (bg != null) {
    rs = '\u{1B}[${_getStyle(bg)}m' + rs;
  }
  if (fontStyle != null) {
    rs = '\u{1B}[${_getStyle(fontStyle)}m' + rs;
  }
  rs = rs + '\u{1B}[0m';
  return rs;
}
