// swift-tools-version:5.10
import PackageDescription

/// General Swift-settings for all targets.
var swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals")
]

let package = Package(
    name: "Mockery",
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
            name: "Mockery",
            targets: ["Mockery"]
        )
    ],
    targets: [
        .target(
            name: "Mockery",
            resources: [
                .copy("Resources/Locales")
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "MockeryTests",
            dependencies: [
                .target(name: "Mockery")
            ],
            swiftSettings: swiftSettings
        )
    ]
)
