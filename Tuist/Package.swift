// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: ["ComposableArchitecture": .framework]
    )
#endif

let package = Package(
    name: "App",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "1.17.1"))
    ]
)
