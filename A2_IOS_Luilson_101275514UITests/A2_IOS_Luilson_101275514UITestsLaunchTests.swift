//
//  A2_IOS_Luilson_101275514UITestsLaunchTests.swift
//  A2_IOS_Luilson_101275514UITests
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-22.
//

import XCTest

final class A2_IOS_Luilson_101275514UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
