//
//  noteDecoderUITests.swift
//  noteDecoderUITests
//
//  Created by Holly Gummerson on 2024-11-28.
//

import XCTest

final class noteDecoderUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationTextView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // verify homescreen
        XCTAssertTrue(app.staticTexts["Hello Ava!"].exists, "Home screen should display 'Hello Ava!' text")
        XCTAssertTrue(app.buttons["GoToDecoderButton"].exists, "navigation button should exist")
        
        // Tap the button to navigate, verify we are on the text screen
        app.buttons["GoToDecoderButton"].tap()
        XCTAssertTrue(app.textViews["TextEditor"].exists, "The Text Editor should be visible after navigation.")
        
        // test you can return to homescreen
        app.navigationBars.buttons["Back"].tap()
        XCTAssertTrue(app.staticTexts["Hello Ava!"].exists, "The HomeScreen should be visible after back button action")
        
    }
}
