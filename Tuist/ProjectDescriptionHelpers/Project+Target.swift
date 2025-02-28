@preconcurrency import ProjectDescription

fileprivate let minimumOSVersion: String = "17.0"

extension Project {
    public static func makeAppTargets(
        rootPath: String = ".",
        name: String,
        destinations: ProjectDescription.Destinations = [.iPhone, .iPad],
        dependencies: [TargetDependency] = [],
        baseBundleID: String
    ) -> [Target] {
        let mainTarget: Target = .target(
            name: name,
            destinations: destinations,
            product: .app,
            bundleId: "${BUNDLE_IDENTIFIER}",
            deploymentTargets: .iOS(minimumOSVersion),
            infoPlist: .extendingDefault(with: Project.infoPlist()),
            sources: ["\(rootPath)/\(name)/Sources/**"],
            resources: ["\(rootPath)/\(name)/Resources/**"],
            dependencies: dependencies,
            settings: .settings(
                base: Project.baseSettings(),
                configurations: [
                    .debug(
                        name: "Debug",
                        settings: [
                            "BUNDLE_IDENTIFIER": "\(baseBundleID)",
                            "DISPLAY_NAME": "\(name)-dev",
                            // TODO: 해당 정보는 xcconfig 이관 예정
                            "PROVISIONING_PROFILE_SPECIFIER": "",
                            "DEVELOPMENT_TEAM": ""
                        ]
                    ),
                    .release(
                        name: "Release",
                        settings: [
                            "BUNDLE_IDENTIFIER": "\(baseBundleID)",
                            "DISPLAY_NAME": "\(name)",
                            // TODO: 해당 정보는 xcconfig 이관 예정
                            "PROVISIONING_PROFILE_SPECIFIER": "",
                            "DEVELOPMENT_TEAM": ""
                        ]
                    )
                ]
            )
        )

        return [mainTarget]
    }

    public static func makeFrameworkTargets(
        rootPath: String = ".",
        name: String,
        destinations: ProjectDescription.Destinations = [.iPhone, .iPad],
        dependencies: [TargetDependency],
        testDependencies: [TargetDependency] = [],
        baseBundleID: String,
        useTestTarget: Bool = true,
        useResources: Bool = false
    ) -> [Target] {
        let sources: Target = .target(
            name: name,
            destinations: destinations,
            product: .framework,
            bundleId: "\(baseBundleID).\(name)",
            deploymentTargets: .iOS(minimumOSVersion),
            infoPlist: .default,
            sources: ["\(rootPath)/\(name)/Sources/**"],
            resources: useResources ? ["\(rootPath)/\(name)/Resources/**"] : [],
            dependencies: dependencies,
            settings: .settings(
                base: Project.baseSettings(),
                configurations: [
                    .debug(
                        name: "Debug",
                        settings: [
                            "BUNDLE_IDENTIFIER": "\(baseBundleID).\(name)"
                        ]
                    ),
                    .release(
                        name: "Release",
                        settings: [
                            "BUNDLE_IDENTIFIER": "\(baseBundleID).\(name)"
                        ]
                    )
                ]
            )
        )

        let tests: Target = .target(
            name: "\(name)Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: "\(baseBundleID).\(name)Tests",
            deploymentTargets: .iOS(minimumOSVersion),
            infoPlist: .default,
            sources: ["\(rootPath)/\(name)/Tests/**"],
            resources: [],
            dependencies: [.target(name: name)] + testDependencies,
            settings: .settings(
                base: Project.baseSettings(),
                configurations: [
                    .debug(
                        name: "Debug",
                        settings: [
                            "BUNDLE_IDENTIFIER": "\(baseBundleID).\(name)Tests"
                        ]
                    ),
                    .release(
                        name: "Release",
                        settings: [
                            "BUNDLE_IDENTIFIER": "\(baseBundleID).\(name)Tests"
                        ]
                    )
                ]
            )
        )

        return useTestTarget ? [sources, tests] : [sources]
    }
}
