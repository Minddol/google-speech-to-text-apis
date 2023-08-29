// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SwiftGoogleApis",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "SwiftGoogleApis",
            targets: ["SwiftGoogleApis"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-protobuf.git",
            from: "1.22.1"
        ),
        .package(
            url: "https://github.com/grpc/grpc-swift.git",
            from: "1.19.1"
        )
    ],
    targets: [
        .target(
            name: "SwiftGoogleApis",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ]
        )
    ]
)

