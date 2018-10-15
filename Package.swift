// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Bloombox",

    products: [
        .library(
            name: "Bloombox",
            targets: ["Bloombox"])],

    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMinor(from: "1.1.2")),
        .package(url: "https://github.com/bloombox/grpc-swift.git", .branch("update-0-6-0"))],

    targets: [
        .target(
            name: "Bloombox",
            dependencies: ["OpenCannabis", "SwiftProtobuf", "SwiftGRPC"],
            path: "Sources/Client"),
        .target(
            name: "OpenCannabis",
            dependencies: ["SwiftProtobuf"],
            path: "Sources/Schema"),
        .testTarget(name: "SchemaTests", dependencies: ["OpenCannabis"]),
        .testTarget(name: "ClientTests", dependencies: ["Bloombox"])])


