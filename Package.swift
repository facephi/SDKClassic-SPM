// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "facephiSDK-ios-package",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "facephiSDK-ios-package",
            targets: ["facephiSDK-ios-package"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "facephiSDK-ios-package",
            dependencies: ["App", "auth_plugin", "device_info_plus", "Flutter", "selphid_plugin", "FlutterPluginRegistrant", "FPBExtractoriOS", "FPhiSelphIDWidgetiOS", "FPhiWidgetCore", "FPhiWidgetSelphi", "Microblink", "selphi_face_plugin", "tracking_plugin", "zipzap", "flutter_secure_storage", "geolocator_apple","bridge_plugin"]),
        .testTarget(
            name: "facephiSDK-ios-packageTests",
            dependencies: ["App", "auth_plugin", "device_info_plus", "Flutter", "selphid_plugin", "FlutterPluginRegistrant", "FPBExtractoriOS", "FPhiSelphIDWidgetiOS", "FPhiWidgetCore", "FPhiWidgetSelphi", "Microblink", "selphi_face_plugin", "tracking_plugin", "zipzap", "flutter_secure_storage", "geolocator_apple","bridge_plugin"]),
        .binaryTarget(name: "App", path: "flutter/App.xcframework"),
       .binaryTarget(name: "auth_plugin", path: "flutter/auth_plugin.xcframework"),
        .binaryTarget(name: "device_info_plus", path: "flutter/device_info_plus.xcframework"),
        .binaryTarget(name: "Flutter",url:  "https://github.com/facephi/onboarding-sdk-legacy-flutter-packages/raw/master/Flutter.xcframework.zip",checksum: "4a946dfd90ffcf54d1400999828293eeab78c372858ee3e3416a6db4c1666170"),
       // .binaryTarget(name: "Flutter", path: "flutter/Flutter.xcframework"),
        .binaryTarget(name: "FlutterPluginRegistrant", path: "flutter/FlutterPluginRegistrant.xcframework"),
        .binaryTarget(name: "selphid_plugin", path: "flutter/selphid_plugin.xcframework"),
        .binaryTarget(name: "selphi_face_plugin", path: "flutter/selphi_face_plugin.xcframework"),
        .binaryTarget(name: "tracking_plugin", path: "flutter/tracking_plugin.xcframework"),
        .binaryTarget(name: "zipzap", path: "flutter/zipzap.xcframework"),
        .binaryTarget(name: "flutter_secure_storage", path: "flutter/flutter_secure_storage.xcframework"),
        .binaryTarget(name: "geolocator_apple", path: "flutter/geolocator_apple.xcframework"),
        .binaryTarget(name: "bridge_plugin", path: "flutter/bridge_plugin.xcframework"),
        
        .binaryTarget(name: "FPhiSelphIDWidgetiOS", path: "FrameworkSelphID/FPhiSelphIDWidgetiOS.xcframework"),
        .binaryTarget(name: "Microblink", path: "FrameworkSelphID/Microblink.xcframework"),
        
        .binaryTarget(name: "FPhiWidgetCore", path: "FrameworkSelphi/FPhiWidgetCore.xcframework"),
        .binaryTarget(name: "FPhiWidgetSelphi", path: "FrameworkSelphi/FPhiWidgetSelphi.xcframework"),
        .binaryTarget(name: "FPBExtractoriOS", path: "FrameworkSelphi/FPBExtractoriOS.xcframework"),
        //.binaryTarget(name: "Flutter",url:  "https://drive.google.com/file/d/18yyN4RFh-QLCQH-2If6Bn04A_MHMfRlq/view?usp=sharing",checksum: "476b064f5cc6d7b6b81e11adb2f67543b30a3b92f6caf9a98afd1d5aabb9e064"),
    ]
)
