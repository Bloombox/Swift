// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Bloombox",

    platforms: [
       .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
    ],

    products: [
        .library(name: "Bloombox", targets: ["Bloombox"]),
        .library(name: "BloomboxServices", targets: ["BloomboxServices", "OpenCannabis"]),
        .library(name: "OpenCannabis", targets: ["OpenCannabis"])],

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

    swiftLanguageVersions: [.version("4"), .version("4.2"), .version("5")],

    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11)

