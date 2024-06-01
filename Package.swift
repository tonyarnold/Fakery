// swift-tools-version:5.10
import PackageDescription

/// General Swift-settings for all targets.
var swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals")
]

let package = Package(
    name: "SamplePack",
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
            name: "SamplePack",
            targets: ["SamplePack"]
        )
    ],
    targets: [
        .target(
            name: "SamplePack",
            resources: [
                .copy("Resources/Locales")
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "SamplePackTests",
            dependencies: [
                .target(name: "SamplePack")
            ],
            swiftSettings: swiftSettings
        )
    ]
)
