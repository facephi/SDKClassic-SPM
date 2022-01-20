#import "TrackingPlugin.h"
#if __has_include(<tracking_plugin/tracking_plugin-Swift.h>)
#import <tracking_plugin/tracking_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tracking_plugin-Swift.h"
#endif

@implementation TrackingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTrackingPlugin registerWithRegistrar:registrar];
}
@end
