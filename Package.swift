// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MJRefreshSwift",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "JRefresh",
            targets: ["JRefresh"]),
    ],
    targets: [
        .target(
            name: "JRefresh",
            path: "JRefresh",
            resources: [
                .process("JRefresh.bundle")
            ]
        ),
    ]
)
