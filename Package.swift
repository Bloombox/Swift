// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Bloombox",

    products: [
        .library(
            name: "Bloombox",
            targets: ["Client"])],

    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMinor(from: "1.1.2")),
        .package(url: "https://github.com/bloombox/grpc-swift.git", .branch("update-0-6-0"))],

    targets: [
        .target(
            name: "Client",
            dependencies: ["Schema", "SwiftGRPC"]),
        .target(
            name: "Schema",
            dependencies: ["SwiftProtobuf", "SwiftGRPC"]),
        .testTarget(name: "SchemaTests", dependencies: ["Schema"]),
        .testTarget(name: "ClientTests", dependencies: ["Client"])])

