// swift-tools-version:5.9
import PackageDescription

// The NGA SDK for iOS, 0.1.0-rc.6: two dynamic xcframeworks, each with its own privacy manifest. A game that shows no NGA
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
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.6/NGASDK.xcframework.zip",
            checksum: "3980763168bec8126b63ac6a40391839b8d8013805a140ca71e736f39239f970"
        ),
        .binaryTarget(
            name: "NGASDKRender",
            url: "https://github.com/nga-io/nga-sdk-ios/releases/download/v0.1.0-rc.6/NGASDKRender.xcframework.zip",
            checksum: "949f79ecf781d8b8d4780cc071f811b7b6a423c999bc77859121cef375f13898"
        ),
        .target(name: "NGASDKRenderLink", dependencies: ["NGASDK", "NGASDKRender"], path: "Sources/NGASDKRenderLink"),
    ]
)
