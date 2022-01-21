/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'dart:io';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter_semi_logger/src/logger/delegate/android_debug_delegate.dart';
import 'package:flutter_semi_logger/src/logger/delegate/ios_debug_delegate.dart';
import 'package:flutter_semi_logger/src/logger/delegate/log_delegate.base.dart';
import 'package:flutter_semi_logger/src/logger/delegate/release_delegate.dart';
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';
import 'package:flutter_semi_logger/src/logger/style/semi_log_style.dart';
import 'dart:core' as core;

part 'semi_logger_v1.dart';

SemiLogger _inst = SemiLogger.setup();

/// The logger is static in app.
/// That mean is the logger config will be apply on all logger object
/// on your app.
/// Use instance for custom a special logger.
///
abstract class SemiLogger {
  @protected
  const SemiLogger._({
    required this.name,
    required this.styleData,
    required this.separatorChar,
    required this.separatorLength,
  });

  static SemiLogger get instance => _inst;

  /// Define your logger,
  /// it will be overrides all next logger print
  factory SemiLogger.setup({
    core.String name = 'semi-log',
    SemiLogStyleData styleData = const SemiLogStyleData(),
    core.String lineChar = '=',
    core.int lineLength = 50,
  }) {
    _inst = _SemiLoggerV1(
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
          core.int? lineLength = 50,
          styleData}) =>
      _SemiLoggerV1(
          name: name ?? _inst.name,
          styleData: _inst.styleData,
          separatorChar: lineChar ?? _inst.separatorChar,
          separatorLength: lineLength ?? _inst.separatorLength);

  /// The logger name, text will appear on log header
  final core.String name;

  /// Some log only print on debugMode
  core.bool get debugMode;

  /// Your styles of logger
  final SemiLogStyleData styleData;

  /// The char will be fill in line separator
  final core.String separatorChar;

  /// The number char in line separator
  final core.int separatorLength;

  /// print your object without format
  /// doesn't depend on debugMode
  void print(core.dynamic object, [SemiLogLevel level = SemiLogLevel.debug]);

  /// print the message with level format in debugMode
  /// except error, warning and info
  void log({
    SemiLogLevel level = SemiLogLevel.debug,
    required core.String message,
    core.bool hasHeader = true,
  });

  /// print a line with custom
  void custom(List<SemiLogContent> contents,
      {String separator = ' ',
      hasHeader = true,
      SemiLogLevel level = SemiLogLevel.debug});

  /// print the message in error level
  void e(core.String message);

  /// print the message in info level
  void i(core.String message);

  /// print the message in warning level
  void w(core.String message);

  /// print the message in debug level
  void d(core.String message);

  /// print the start line
  void separator([core.String message = '', bool hasHeader = false]);

  /// print the message in success level
  void success(core.String message);

  /// print the message in fail level
  void fail(core.String message);

  /// print empty line
  void breakLine();

  /// print the multi line message
  void block(
    List<SemiLogData> messages, {
    core.String? linePrefix,
    core.bool lineNumber = false,
    bool headerSeparator = false,
  });
}
