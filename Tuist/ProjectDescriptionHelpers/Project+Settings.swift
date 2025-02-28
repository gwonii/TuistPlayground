@preconcurrency import ProjectDescription

extension Project {
    enum BaseSetting: CaseIterable {
        case swiftLanguageVersion
        case strictConcurrencyChecking
        case enableUserScriptSandboxing

        var key: String {
            switch self {
                case .swiftLanguageVersion:
                    return "SWIFT_VERSION"
                case .strictConcurrencyChecking:
                    return "SWIFT_STRICT_CONCURRENCY"
                case .enableUserScriptSandboxing:
                    return "ENABLE_USER_SCRIPT_SANDBOXING"
            }
        }

        var value: ProjectDescription.SettingValue {
            switch self {
                case .swiftLanguageVersion:
                    return .string("6.0")
                case .strictConcurrencyChecking:
                    return .string("Complete")
                case .enableUserScriptSandboxing:
                    return .string("Yes")
            }
        }
    }

    static func baseSettings() -> [String : ProjectDescription.SettingValue] {
        var settings = SettingsDictionary()

        BaseSetting.allCases.forEach { setting in
            settings.updateValue(setting.value, forKey: setting.key)
        }

        return settings
    }
}
