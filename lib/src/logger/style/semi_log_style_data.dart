/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/

part of 'semi_log_style.dart';

/// Your styles of logger
class SemiLogStyleData {
  const SemiLogStyleData({
    this.header = const SemiLogStyle({ANSIStyles.lightGray}),
    this.separator = const SemiLogStyle({ANSIStyles.lightGray}),
    this.debug = const SemiLogStyle(),
    this.warn = const SemiLogStyle({ANSIStyles.yellow}),
    this.error = const SemiLogStyle({ANSIStyles.red}),
    this.info = const SemiLogStyle(),
    this.fail = const SemiLogStyle({ANSIStyles.lightRed}),
    this.success = const SemiLogStyle({ANSIStyles.green}),
  });

  final SemiLogStyle header;
  final SemiLogStyle separator;
  final SemiLogStyle debug;
  final SemiLogStyle warn;
  final SemiLogStyle error;
  final SemiLogStyle info;
  final SemiLogStyle success;
  final SemiLogStyle fail;

  /// return your style with level
  Set<ANSIStyles> getStyle(SemiLogLevel level) {
    switch (level) {
      case SemiLogLevel.header:
        return header.styles;
      case SemiLogLevel.separator:
        return separator.styles;
      case SemiLogLevel.debug:
        return debug.styles;
      case SemiLogLevel.warn:
        return warn.styles;
      case SemiLogLevel.error:
        return error.styles;
      case SemiLogLevel.info:
        return info.styles;
      case SemiLogLevel.success:
        return success.styles;
      case SemiLogLevel.fail:
        return fail.styles;
      case SemiLogLevel.print:
        return info.styles;
    }
  }
}
