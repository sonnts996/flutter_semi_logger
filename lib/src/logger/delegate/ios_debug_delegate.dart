/*
 Created by Thanh Son on 21/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'dart:io' as io;
import 'package:flutter_semi_logger/flutter_semi_logger.dart';
import 'package:flutter_semi_logger/src/logger/colored.dart' as colored;
import 'package:flutter_semi_logger/src/logger/delegate/log_delegate.base.dart';
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';
import 'package:flutter_semi_logger/src/native/channel_connect.dart';

class IosDebugDelegate extends LogDelegate {
  @override
  String apply(String text, Set<colored.ANSIStyles> styles) {
    if (io.stdout.supportsAnsiEscapes) {
      return colored.apply(text, styles);
    }
    return text;
  }

  @override
  void print(String message,
      {String? header, SemiLogLevel? level, String tag = ''}) {
    final finalTag = header != null ? '[$header]' : '';
    ChannelConnect()
        .print('$finalTag $message', tag: finalTag, log: ErrorLog.assertLog);
  }
}
