@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "TuistPlayground",
    projects: [
        "application",
        "service"
    ]
)
