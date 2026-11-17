// swift-tools-version:5.9
import PackageDescription

// The NGA SDK for iOS, 0.1.0-rc.5: two dynamic xcframeworks, each with its own privacy manifest. A game that shows no NGA
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
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.5/NGASDK.xcframework.zip",
            checksum: "b1ac5ef376331a266796044ca5c7dcd81297387d6400c618a3d6f982be9054f9"
        ),
        .binaryTarget(
            name: "NGASDKRender",
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.5/NGASDKRender.xcframework.zip",
            checksum: "e84236f3e386b5a40ea0f062d9dfb68081ebc2710ebcf4f75fad89a969dc0417"
        ),
        .target(name: "NGASDKRenderLink", dependencies: ["NGASDK", "NGASDKRender"], path: "Sources/NGASDKRenderLink"),
    ]
)
