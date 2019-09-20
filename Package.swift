// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Bloombox",

    products: [
        .library(
            name: "Bloombox",
            targets: ["Bloombox"])],

    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMinor(from: "1.5.0")),
        .package(url: "https://github.com/grpc/grpc-swift.git", .upToNextMinor(from: "0.9.0"))],

    targets: [
        .target(
            name: "Bloombox",
            dependencies: ["OpenCannabis", "BloomboxServices", "SwiftProtobuf", "SwiftGRPC"],
            path: "Sources/Client"),

        .target(
            name: "BloomboxServices",
            dependencies: ["OpenCannabis", "SwiftProtobuf", "SwiftGRPC"],
            path: "Sources/Services"),

        .target(
            name: "OpenCannabis",
            dependencies: ["SwiftProtobuf"],
            path: "Sources/Schema"),

        .testTarget(name: "SchemaTests", dependencies: ["OpenCannabis", "BloomboxServices", "Bloombox"]),
        .testTarget(name: "ClientTests", dependencies: ["Bloombox"])],

    swiftLanguageVersions: [4],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11)
