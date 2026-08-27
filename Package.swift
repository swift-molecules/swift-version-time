// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-version-time",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Version Time",
            targets: ["Version Time"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-molecules/swift-version.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-ascii.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-ascii-parser.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-byte.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-byte-parser.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-parser.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-serializer.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-text.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-time.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Version Time",
            dependencies: [
                .product(name: "Version", package: "swift-version"),
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "ASCII Decimal Parser", package: "swift-ascii-parser"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Byte Standard Library Integration", package: "swift-byte"),
                .product(name: "Byte Parser", package: "swift-byte-parser"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Parser", package: "swift-parser"),
                .product(name: "Serializer", package: "swift-serializer"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Text", package: "swift-text"),
                .product(name: "Time", package: "swift-time"),
            ]
        ),
        .testTarget(
            name: "Version Time Tests",
            dependencies: [
                "Version Time",
                .product(name: "Version", package: "swift-version"),
                .product(name: "Time", package: "swift-time"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
