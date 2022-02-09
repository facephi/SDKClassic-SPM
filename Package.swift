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
            dependencies: ["App", "auth_plugin", "device_info_plus", "Flutter", "selphid_plugin", "FlutterPluginRegistrant", "FPBExtractoriOS", "FPhiSelphIDWidgetiOS", "FPhiWidgetCore", "FPhiWidgetSelphi", "Microblink", "selphi_face_plugin", "tracking_plugin", "zipzap", "flutter_secure_storage", "geolocator_apple", "bridge_plugin","agora_plugin","agora_rtc_engine","permission_handler"]),

        .binaryTarget(name: "App", path: "Frameworks/App.xcframework"),
        .binaryTarget(name: "auth_plugin", path: "Frameworks/auth_plugin.xcframework"),
        .binaryTarget(name: "device_info_plus", path: "Frameworks/device_info_plus.xcframework"),
        .binaryTarget(name: "Flutter", path: "Frameworks/Flutter.xcframework"),
        .binaryTarget(name: "FlutterPluginRegistrant", path: "Frameworks/FlutterPluginRegistrant.xcframework"),
        .binaryTarget(name: "selphid_plugin", path: "Frameworks/selphid_plugin.xcframework"),
        .binaryTarget(name: "selphi_face_plugin", path: "Frameworks/selphi_face_plugin.xcframework"),
        .binaryTarget(name: "tracking_plugin", path: "Frameworks/tracking_plugin.xcframework"),
        .binaryTarget(name: "zipzap", path: "Frameworks/zipzap.xcframework"),
        .binaryTarget(name: "flutter_secure_storage", path: "Frameworks/flutter_secure_storage.xcframework"),
        .binaryTarget(name: "geolocator_apple", path: "Frameworks/geolocator_apple.xcframework"),
        .binaryTarget(name: "bridge_plugin", path: "Frameworks/bridge_plugin.xcframework"),
        .binaryTarget(name: "agora_plugin", path: "Frameworks/agora_plugin.xcframework"),
        .binaryTarget(name: "agora_rtc_engine", path: "Frameworks/agora_rtc_engine.xcframework"),
        .binaryTarget(name: "permission_handler", path: "Frameworks/permission_handler.xcframework"),

        .binaryTarget(name: "FPhiSelphIDWidgetiOS", path: "FrameworksSelphID/FPhiSelphIDWidgetiOS.xcframework"),
        .binaryTarget(name: "Microblink", path: "FrameworksSelphID/Microblink.xcframework"),

        .binaryTarget(name: "FPhiWidgetCore", path: "FrameworksSelphi/FPhiWidgetCore.xcframework"),
        .binaryTarget(name: "FPhiWidgetSelphi", path: "FrameworksSelphi/FPhiWidgetSelphi.xcframework"),
        .binaryTarget(name: "FPBExtractoriOS", path: "FrameworksSelphi/FPBExtractoriOS.xcframework"),
    ]
)
