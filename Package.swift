// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZujuAppSync",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ZujuAppSync",
            targets: ["ZujuAppSync"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(
        url: "https://github.com/awslabs/aws-mobile-appsync-sdk-ios.git",
        .upToNextMinor(from: "3.6.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ZujuAppSync",
            dependencies: [
              .product(name: "AWSAppSync", package: "aws-mobile-appsync-sdk-ios"),],
            exclude: ["mutations.graphql"]
        ),
        .testTarget(
            name: "ZujuAppSyncTests",
            dependencies: ["ZujuAppSync"]),
    ]
)
