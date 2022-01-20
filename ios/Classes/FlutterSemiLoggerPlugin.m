#import "FlutterSemiLoggerPlugin.h"
#if __has_include(<flutter_semi_logger/flutter_semi_logger-Swift.h>)
#import <flutter_semi_logger/flutter_semi_logger-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_semi_logger-Swift.h"
#endif

@implementation FlutterSemiLoggerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSemiLoggerPlugin registerWithRegistrar:registrar];
}
@end
