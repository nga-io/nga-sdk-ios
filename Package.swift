// swift-tools-version:5.9
import PackageDescription

// The NGA SDK for iOS, 0.1.0-rc.1: two dynamic xcframeworks, each with its own privacy manifest. A game that shows no NGA
// ads adds the product NGASDK. A game that shows them adds NGASDKRender, which brings NGASDK: a binary target cannot
// declare dependencies, so the product names a thin source target, one empty Swift file, that depends on both.
let package = Package(
    name: "NGASDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NGASDK", targets: ["NGASDK"]),
        .library(name: "NGASDKRender", targets: ["NGASDKRenderLink"]),
    ],
    targets: [
        .binaryTarget(
            name: "NGASDK",
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.1/NGASDK.xcframework.zip",
            checksum: "5e39a4d5341178a64ec195e26246caf5a7b9ef2e9a4f8bffc2c3a58b2525cd8a"
        ),
        .binaryTarget(
            name: "NGASDKRender",
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.1/NGASDKRender.xcframework.zip",
            checksum: "a0283c7fda533851a5f27c78f6fb6dd942bbdd2af0a02774b9a34f1c771a2d55"
        ),
        .target(name: "NGASDKRenderLink", dependencies: ["NGASDK", "NGASDKRender"], path: "Sources/NGASDKRenderLink"),
    ]
)
