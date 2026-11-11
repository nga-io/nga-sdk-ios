// swift-tools-version:5.9
import PackageDescription

// The NGA SDK for iOS, 0.1.0-rc.3: two dynamic xcframeworks, each with its own privacy manifest. A game that shows no NGA
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
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.3/NGASDK.xcframework.zip",
            checksum: "56fb97d2c1b20dc5399027a0319290d09b1a6a955ed29e0945dab0280b8dbc7a"
        ),
        .binaryTarget(
            name: "NGASDKRender",
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.3/NGASDKRender.xcframework.zip",
            checksum: "fc3f9a686809d81fcba334f8cf8731c06f20737b06b15f8fa391048cf6dbbea3"
        ),
        .target(name: "NGASDKRenderLink", dependencies: ["NGASDK", "NGASDKRender"], path: "Sources/NGASDKRenderLink"),
    ]
)
