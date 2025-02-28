@preconcurrency import ProjectDescription

extension Project {
    static func infoPlist() -> [String: Plist.Value] {
        return [
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1",
            "CFBundleDevelopmentRegion": "$(DEVELOPMENT_LANGUAGE)",
            "CFBundleDisplayName": "$(DISPLAY_NAME)",
            "CFBundleExecutable": "$(EXECUTABLE_NAME)",
            "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
            "CFBundleInfoDictionaryVersion": "6.0",
            "CFBundleName": "$(PRODUCT_NAME)",
            "CFBundlePackageType": "$(PRODUCT_BUNDLE_PACKAGE_TYPE)",
            "ITSAppUsesNonExemptEncryption": false,

            "LSRequiresIPhoneOS": true,
            "NSAppTransportSecurity": [
                "NSAllowsArbitraryLoads": true
            ],
            "UIApplicationSupportsIndirectInputEvents": true,
            "UILaunchStoryboardName": "LaunchScreen",
            "UIMainStoryboardFile": "",
            "UISupportedInterfaceOrientations~ipad": [
                "UIInterfaceOrientationPortrait",
                "UIInterfaceOrientationPortraitUpsideDown",
                "UIInterfaceOrientationLandscapeLeft",
                "UIInterfaceOrientationLandscapeRight"
            ],
            "UISupportedInterfaceOrientations~iphone": [
                "UIInterfaceOrientationPortrait"
            ]
        ]
    }
}
