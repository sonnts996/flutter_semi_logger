/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/

part of 'semi_log_style.dart';

/// Your styles of logger
class SemiLogStyleData {
  const SemiLogStyleData({
    this.header = const SemiLogStyle(color: colored.ANSIStyles.lightGray),
    this.separator = const SemiLogStyle(color: colored.ANSIStyles.magenta),
    this.debug = const SemiLogStyle(),
    this.warning = const SemiLogStyle(color: colored.ANSIStyles.yellow),
    this.error = const SemiLogStyle(color: colored.ANSIStyles.red),
    this.info = const SemiLogStyle(),
    this.fail = const SemiLogStyle(color: colored.ANSIStyles.lightRed),
    this.success = const SemiLogStyle(color: colored.ANSIStyles.green),
  });

  final SemiLogStyle header;
  final SemiLogStyle separator;
  final SemiLogStyle debug;
  final SemiLogStyle warning;
  final SemiLogStyle error;
  final SemiLogStyle info;
  final SemiLogStyle success;
  final SemiLogStyle fail;

  /// return your style with level
  SemiLogStyle getStyle(SemiLogLevel level) {
    switch (level) {
      case SemiLogLevel.header:
        return header;
      case SemiLogLevel.separator:
        return separator;
      case SemiLogLevel.debug:
        return debug;
      case SemiLogLevel.warning:
        return warning;
      case SemiLogLevel.error:
        return error;
      case SemiLogLevel.info:
        return info;
      case SemiLogLevel.success:
        return success;
      case SemiLogLevel.fail:
        return fail;
      case SemiLogLevel.print:
        return info;
    }
  }

  /// return your string with code style
  String apply(String text, SemiLogLevel level) {
    return getStyle(level).apply(text);
  }
}
