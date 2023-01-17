// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NHL Scores Package",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "NHL Scores Package",
            targets: ["NHL Scores Package"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
    ],
    targets: [
        .target(
            name: "NHL Scores Package",
            dependencies: ["SnapKit"]),
        .testTarget(
            name: "NHL Scores PackageTests",
            dependencies: ["NHL Scores Package"]),
    ]
)
