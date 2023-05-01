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
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ]
        ),
        .target(
            name: "Services",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .target(name: "Messages")
            ]
        )
    ]
)

