// swift-tools-version:5.9
import PackageDescription

// The NGA SDK for iOS, 0.1.0-rc.4: two dynamic xcframeworks, each with its own privacy manifest. A game that shows no NGA
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
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.4/NGASDK.xcframework.zip",
            checksum: "1bd4aefdaebebf224aef05d53f583249196ac9a8bfb1563bcadc6610a3bd17a1"
        ),
        .binaryTarget(
            name: "NGASDKRender",
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.4/NGASDKRender.xcframework.zip",
            checksum: "cea2ef7b7c0d8a920d10881edd992057f30a9645daed73d58205618452832fbe"
        ),
        .target(name: "NGASDKRenderLink", dependencies: ["NGASDK", "NGASDKRender"], path: "Sources/NGASDKRenderLink"),
    ]
)
