// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "MyGame",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "MyGame",
            targets: ["MyGame"]),
        .library(
            name: "MyLibrary",
            type: .dynamic,
            targets: ["MyLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/EstevanBR/SwiftGodot", branch: "estevanBR"),
        .package(url: "https://github.com/EstevanBR/SwiftGodotKit", branch: "estevanBR")
    ],
    targets: [
        .executableTarget(
            name: "MyGame",
            dependencies: [
                "MyLibrary",
                .product(name: "SwiftGodot", package: "SwiftGodot"),
                .product(name: "SwiftGodotKit", package: "SwiftGodotKit"),
            ],
            exclude: ["Project"],
            resources: [
                .copy("Resources")
            ]
        ),
        .target(
            name: "MyLibrary",
            dependencies: [
                .product(name: "SwiftGodot", package: "SwiftGodot"),
            ])
    ]
)
