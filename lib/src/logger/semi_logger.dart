/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'dart:core';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';
import 'package:flutter_semi_logger/src/logger/style/semi_log_style.dart';
import 'dart:core' as core;

import 'package:flutter_semi_logger/src/native/channel_connect.dart';

SemiLogger _inst = SemiLogger.setup();

bool _decoration = Platform.isAndroid && kDebugMode;

/// The logger is static in app.
/// That mean is the logger config will be apply on all logger object
/// on your app.
/// Use instance for custom a special logger.
///
class SemiLogger {
  const SemiLogger._({
    required this.name,
    required this.styleData,
    required this.separatorChar,
    required this.separatorLength,
  }) : debugMode = kDebugMode;

  static SemiLogger get instance => _inst;

  /// Define your logger,
  /// it will be overrides all next logger print
  factory SemiLogger.setup({
    core.String name = 'semi-log',
    SemiLogStyleData styleData = const SemiLogStyleData(),
    core.String lineChar = '=',
    core.int lineLength = 50,
  }) {
    _inst = SemiLogger._(
      name: name,
      styleData: styleData,
      separatorChar: lineChar,
      separatorLength: lineLength,
    );
    return _inst;
  }

  /// When your want to define a special logger,
  /// it will not change when re-setup logger
  factory SemiLogger(
          {core.String? name = 'semi-log',
          core.bool? debugMode = true,
          core.String? lineChar = '=',
          core.int? lineLength = 50}) =>
      SemiLogger._(
          name: name ?? _inst.name,
          styleData: _inst.styleData,
          separatorChar: lineChar ?? _inst.separatorChar,
          separatorLength: lineLength ?? _inst.separatorLength);

  /// The logger name, text will appear on log header
  final core.String name;

  /// Some log only print on debugMode
  final core.bool debugMode;

  /// Your styles of logger
  final SemiLogStyleData styleData;

  /// The char will be fill in line separator
  final core.String separatorChar;

  /// The number char in line separator
  final core.int separatorLength;

  /// Enable decoration mode,
  core.bool get decoration => _decoration;

  core.String get _header {
    if(decoration) {
      return styleData.header.apply('[$name]');
    }else{
      return '[$name]';
    }
  }

  /// print your object without format
  /// doesn't depend on debugMode
  void print(core.dynamic object, [SemiLogLevel level = SemiLogLevel.debug]) {
    // core.print(object);
    var error = ErrorLog.assertLog;
    switch (level) {
      case SemiLogLevel.print:
      case SemiLogLevel.header:
      case SemiLogLevel.separator:
        error = ErrorLog.assertLog;
        break;
      case SemiLogLevel.warning:
        error = ErrorLog.warn;
        break;
      case SemiLogLevel.error:
        error = ErrorLog.error;
        break;
      case SemiLogLevel.info:
        error = ErrorLog.info;
        break;
      case SemiLogLevel.debug:
        error = ErrorLog.debug;
        break;
      case SemiLogLevel.success:
      case SemiLogLevel.fail:
        error = ErrorLog.verbose;
        break;
    }
    ChannelConnect().print(object, log: error, tag: _header);
  }

  /// print the message with level format in debugMode
  /// except error, warning and info
  void log({
    SemiLogLevel level = SemiLogLevel.debug,
    required core.String message,
    core.bool hasHeader = true,
  }) {
    if (debugMode ||
        [
          SemiLogLevel.error,
          SemiLogLevel.warning,
          SemiLogLevel.info,
          SemiLogLevel.print,
          SemiLogLevel.separator
        ].contains(level)) {

      if (level == SemiLogLevel.print) {
        print(message, level);
      } else if (hasHeader && !Platform.isAndroid) {
        print('$_header ${styleData.apply(message, level)}', level);
      } else {
        print(styleData.apply(message, level));
      }
    }
  }

  /// print a line with custom
  void custom(List<SemiLogContent> contents,
      {String separator = ' ',
      hasHeader = true,
      SemiLogLevel level = SemiLogLevel.debug}) {
    String msg = contents.map((e) => e.apply()).join(separator);
    if (hasHeader && !Platform.isAndroid) {
      print('$_header $msg', level);
    } else {
      print(msg, level);
    }
  }

  /// print the message in error level
  void e(core.String message) {
    log(message: message, level: SemiLogLevel.error);
  }

  /// print the message in info level
  void i(core.String message) {
    log(message: message, level: SemiLogLevel.info);
  }

  /// print the message in warning level
  void w(core.String message) {
    log(message: message, level: SemiLogLevel.warning);
  }

  /// print the message in debug level
  void d(core.String message) {
    log(message: message, level: SemiLogLevel.debug);
  }

  /// print the start line
  void separator([core.String message = '', bool hasHeader = false]) {
    log(
        message: message.padRight(separatorLength, separatorChar),
        level: SemiLogLevel.separator,
        hasHeader: hasHeader);
  }

  /// print the message in success level
  void success(core.String message) {
    log(message: message, level: SemiLogLevel.success);
  }

  /// print the message in fail level
  void fail(core.String message) {
    log(message: message, level: SemiLogLevel.fail);
  }

  /// print empty line
  void breakLine() {
    log(message: '', level: SemiLogLevel.info, hasHeader: false);
  }

  /// print the multi line message
  void block(
    List<SemiLogLevelData> messages, {
    core.String? linePrefix,
    core.bool lineNumber = false,
    bool headerSeparator = false,
  }) {
    headerSeparator ? separator('', true) : log(message: '');
    int padRight = messages.length.toString().length;
    for (int i = 0; i < messages.length; i++) {
      final data = messages[i];
      var msg = data.msg;
      if (data.level == SemiLogLevel.separator) {
        separator(msg, false);
      } else {
        if (linePrefix != null) {
          msg = '$linePrefix $msg';
        }
        if (lineNumber) {
          msg = '${i.toString().padRight(padRight)} $msg';
        }
        log(message: msg, level: data.level, hasHeader: false);
      }
    }
  }
}
