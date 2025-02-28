@preconcurrency import ProjectDescription

extension Project {
    public static let servicePackages: [ProjectDescription.Package] = [
        .remote(url: "https://github.com/pointfreeco/swift-composable-architecture.git", requirement: .exact("1.17.1")),
    ]

    public static let testPackages: [ProjectDescription.Package] = []
}
