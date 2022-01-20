/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/

part of 'semi_log_level.dart';

extension SemiLogLevelX on SemiLogLevel {
  /// use for log a block
  SemiLogLevelData msg(String message) {
    return SemiLogLevelData(this, message);
  }

  /// another log print
  void log(String message) {
    SemiLogger().log(message: message, level: this);
  }

  SemiLogLevelData custom(List<SemiLogContent> contents,
      [String separator = ' ']) {
    return SemiLogLevelData(
      SemiLogLevel.print,
      contents.map((e) => e.apply()).join(separator),
    );
  }

  SemiLogContent toContent(String message) {
    return SemiLogger().styleData.getStyle(this).toContent(message);
  }
}

/// data for block print
///
class SemiLogLevelData {
  const SemiLogLevelData(this.level, this.msg);

  factory SemiLogLevelData.fromContents(List<SemiLogContent> contents,
      [String separator = ' ']) {
    return SemiLogLevelData(
        SemiLogLevel.print, contents.map((e) => e.apply()).join(separator));
  }

  /// massage use for block print
  final String msg;

  /// level use for block print
  final SemiLogLevel level;
}
