@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

private let baseBundleID: String = "com.gmail.hc.gwonii"
private let name: String = "Service"
private let organization: String = ""

let project = Project(
    name: name,
    organizationName: organization,
    targets: [
        Project.CommonFramework.allCases
            .flatMap { framework in
                Project.makeFrameworkTargets(
                    name: framework.rawValue,
                    dependencies: framework.dependcies,
                    baseBundleID: baseBundleID,
                    useTestTarget: false
                )
            },
        Project.FeatureFramework.allCases
            .flatMap { framework in
                Project.makeFrameworkTargets(
                    name: framework.rawValue,
                    dependencies: framework.dependcies,
                    testDependencies: Project.testDependencies,
                    baseBundleID: baseBundleID,
                    useTestTarget: true
                )
            }
    ].flatMap { $0 }
)
