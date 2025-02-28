@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

private typealias Framework = Project.Framework

private let baseBundleID: String = "com.gmail.hc.gwonii"
private let name: String = "AppStore"
private let organization: String = ""

let project: Project = Project(
    name: name,
    organizationName: organization,
    targets: [
        Project.makeAppTargets(
            name: Framework.app.rawValue,
            dependencies: Framework.app.dependcies,
            baseBundleID: baseBundleID
        ),
    ].flatMap { $0 }
)
