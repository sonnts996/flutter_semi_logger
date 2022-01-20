/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:flutter_semi_logger/src/logger/colored.dart' as colored;
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';
import 'package:flutter_semi_logger/src/logger/semi_logger.dart';

part 'semi_log_style_data.dart';

/// The style for each level
///
class SemiLogStyle {
  const SemiLogStyle({
    this.color = colored.ANSIStyles.defaultStyle,
    this.bg = colored.ANSIStyles.bgDefault,
    this.fontStyle = colored.ANSIStyles.defaultStyle,
  });

  /// The text color
  final colored.ANSIStyles color;

  /// The text background
  final colored.ANSIStyles bg;

  /// The text's font style
  final colored.ANSIStyles fontStyle;

  /// return your string with code style
  String apply(String text) {
    return SemiLogger().decoration
        ? colored.apply(text, color: color, bg: bg, fontStyle: fontStyle)
        : text;
  }

  SemiLogContent toContent(String message) {
    return SemiLogContent(message, color: color, bg: bg, fontStyle: fontStyle);
  }
}

class SemiLogContent {
  const SemiLogContent(
    this._msg, {
    this.color = colored.ANSIStyles.defaultStyle,
    this.bg = colored.ANSIStyles.bgDefault,
    this.fontStyle = colored.ANSIStyles.defaultStyle,
  });

  /// The text color
  final colored.ANSIStyles color;

  /// The text background
  final colored.ANSIStyles bg;

  /// The text's font style
  final colored.ANSIStyles fontStyle;

  /// The message
  final String _msg;

  /// return your string with code style
  String apply() {
    return SemiLogger().decoration
        ? colored.apply(_msg, color: color, bg: bg, fontStyle: fontStyle)
        : _msg;
  }
}
