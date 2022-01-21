/*
 Created by Thanh Son on 21/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:flutter_semi_logger/flutter_semi_logger.dart';

abstract class LogDelegate {
  String apply(String text, Set<ANSIStyles> styles);

  void print(String message,
      {String? header, SemiLogLevel? level, String tag = ''});
}
