// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Bloombox",

    products: [
        .library(
            name: "Bloombox",
            targets: ["Client"])],

    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", .branch("master")),
        .package(url: "https://github.com/bloombox/grpc-swift.git", .branch("master"))],

    targets: [
        .target(
            name: "Client",
            dependencies: ["Schema"]),
        .target(
            name: "Schema",
            dependencies: ["SwiftProtobuf", "SwiftGRPC"])])
