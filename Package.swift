// swift-tools-version:5.10
import PackageDescription

/// General Swift-settings for all targets.
var swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals")
]

let package = Package(
    name: "Fakery",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .macCatalyst(.v13),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "Fakery",
            targets: ["Fakery"]
        )
    ],
    targets: [
        .target(
            name: "Fakery",
            resources: [
                .copy("Resources/Locales")
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FakeryTests",
            dependencies: [
                .target(name: "Fakery")
            ],
            swiftSettings: swiftSettings
        )
    ]
)
