//
//  noteDecoderTests.swift
//  noteDecoderTests
//
//  Created by Holly Gummerson on 2024-11-28.
//  Test the noteDecoder functionality

import XCTest
@testable import noteDecoder

final class noteDecoderTests: XCTestCase {
    
    var textParser: TextParser!

    override func setUpWithError() throws {
        // This method is called before the invocation of each test method in the class
        super.setUp()
        textParser = TextParser() // initialize test object
    }

    override func tearDownWithError() throws {
        // This method is called after the invocation of each test method in the class
        textParser = nil
        super.tearDown()
    }

    func testOneWord() throws {
        // tests that one group of symbols is properly translated to its mapped letters
        let input = "$3””9"
        let expectedOutput = "HELLO"
        
        let actualOutput = TextParser().parse(input)
        
        XCTAssertEqual(actualOutput, expectedOutput, "translateText should correctly map symbols for one word")
    }
    
    func testMultiWord() throws {
        // tests that multiple groups of symbols are properly translated to its mapped letters
        let input = "$3””9 ‘6 !-‘3 8/ $9””6"
        let expectedOutput = "HELLO MY NAME IS HOLLY"
        
        let actualOutput = TextParser().parse(input)
        
        XCTAssertEqual(actualOutput, expectedOutput, "translateText should correctly map symbols for multiple words")
    }
    
    func testCorrectedSpelling() throws {
        // tests that spelling is properly corrected in a group of words
        let input = "$3””8 ‘6 $3””9"
        let expectedOutput = "HELLO MY HELLO"
        
        let actualOutput = TextParser().parse(input)
        
        XCTAssertEqual(actualOutput, expectedOutput, "translateText should correct spelling in a group of words")
    }
    
    func testAlreadyTranslated() throws {
        // tests that nothing is modified when the input is already translated
        let input = "THIS IS A TEST"
        let expectedOutput = "THIS IS A TEST"
        
        let actualOutput = TextParser().parse(input)
        
        XCTAssertEqual(actualOutput, expectedOutput, "translateText should not translate already translated words")
    }
    
    func testMixedTranslated() throws {
        // tests that only the symbols are translated in mixed input
        let input = "HELLO ‘6 NAME 8/ HOLLY"
        let expectedOutput = "HELLO MY NAME IS HOLLY"
        
        let actualOutput = TextParser().parse(input)
        
        XCTAssertEqual(actualOutput, expectedOutput, "translateText should only translate symbols")
    }

}
