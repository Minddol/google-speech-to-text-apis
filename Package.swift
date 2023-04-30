// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "googleapis",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "googleapis",
            targets: ["Messages", "Services"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-protobuf.git",
            from: "1.18.0"
        ),
        .package(
            url: "https://github.com/grpc/grpc-swift.git",
            from: "1.2.0"
        )
    ],
    targets: [
        .target(
            name: "Messages",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ],
            path: "google",
            sources: [
                "**/*.pbobjc.h",
                "**/*.pbobjc.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../"),
                .unsafeFlags(["-fno-objc-arc"])
            ]
        ),
        .target(
            name: "Services",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .target(name: "Messages")
            ],
            path: "google",
            sources: [
                "**/*.pbrpc.h",
                "**/*.pbrpc.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../"),
                .unsafeFlags(["-fobjc-arc"])
            ]
        )
    ],
    cxxLanguageStandard: .cxx14
)

