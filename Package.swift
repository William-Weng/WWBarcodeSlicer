// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWBarcodeSlicer",
    platforms: [
        .iOS(.v14)
    ],
    products: [.library(name: "WWBarcodeSlicer", targets: ["WWBarcodeSlicer"]),
    ],
    targets: [
        .target(name: "WWBarcodeSlicer", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
