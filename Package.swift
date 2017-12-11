// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "BloomboxClient",
    products: [
        .library(
            name: "BloomboxClient",
            targets: ["Client"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: Version(1, 0, 0)),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: Version(0, 2, 3))
    ],
    targets: [
        .target(
            name: "Client",
            dependencies: ["Schema"]),
        .target(
            name: "Schema",
            dependencies: []),
        .testTarget(
            name: "ClientTests",
            dependencies: ["Client"])
    ]
)
