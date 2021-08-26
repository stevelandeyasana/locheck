//
//  LexedStringsdictStringsTests.swift
//  
//
//  Created by Steve Landey on 8/26/21.
//

import Foundation
@testable import LocheckLogic
import XCTest

class LexedStringsdictStringsTests: XCTestCase {
    func testLexJustConstant() {
        let parts = LexedStringsdictString(string: "abc").parts
        XCTAssertEqual(parts, [.constant("abc")])
    }

    func testLexJustName() {
        let parts = LexedStringsdictString(string: "%#@abc@").parts
        print(parts)
        XCTAssertEqual(parts, [.replacement("abc")])
    }

    func testLexConstantAndName() {
        let parts = LexedStringsdictString(string: "abc%#@def@").parts
        print(parts)
        XCTAssertEqual(parts, [.constant("abc"), .replacement("def")])
    }

    func testLexNameAndConstant() {
        let parts = LexedStringsdictString(string: "%#@abc@def").parts
        print(parts)
        XCTAssertEqual(parts, [.replacement("abc"), .constant("def")])
    }
}
