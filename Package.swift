// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Expanding",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "Expanding",
            targets: ["Expanding"]),
    ],
    targets: [
        .target(
            name: "Expanding",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ExpandingTests",
            dependencies: ["Expanding"]
         ),
    ],
    swiftLanguageVersions: [ .version("5.9") ]
)
