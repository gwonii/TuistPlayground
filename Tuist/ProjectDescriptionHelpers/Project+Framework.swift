@preconcurrency import ProjectDescription

extension Project {
    public enum Framework: String {
        case appStore = "AppStore"

        public var dependcies: [TargetDependency] {
            switch self {
                case .appStore:
                    return [
                        Project.FeatureFramework.allCases
                            .map { framework in
                                TargetDependency.project(
                                    target: framework.rawValue,
                                    path: "../service"
                                )
                            }
                    ].flatMap { $0 }
            }
        }
    }
}

extension Project {
    public enum CommonFramework: String, CaseIterable {
        case commonPresenter = "CommonPresenter"
        case commonUI = "CommonUI"

        public var dependcies: [TargetDependency] {
            switch self {
                case .commonPresenter:
                    return []
                case .commonUI:
                    return []
            }
        }
    }

    public enum FeatureFramework: String, CaseIterable {
        case searchPresenter = "SearchPresenter"
        case searchUI = "SearchUI"

        public var dependcies: [TargetDependency] {
            switch self {
                case .searchPresenter:
                    return [
                        .target(name: CommonFramework.commonPresenter.rawValue)
                    ]
                case .searchUI:
                    return [
                        .target(name: Self.searchPresenter.rawValue),
                        .target(name: CommonFramework.commonUI.rawValue),
                        .target(name: CommonFramework.commonPresenter.rawValue)
                    ]
            }
        }
    }
}

extension Project {
    public static var testDependencies: [TargetDependency] {
        return [
            .xctest
        ]
    }
}
