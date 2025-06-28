//
//  Incubyte_assignmentTests.swift
//  Incubyte_assignmentTests
//
//  Created by Prajjwal on 28/06/25.
//

import XCTest
@testable import Incubyte_assignment

final class Incubyte_assignmentTests: XCTestCase {
    var calculator: StringCalculator!
   
    override func setUp() {
        calculator = StringCalculator()
    }
    
    func testEmptyInputReturnsZero() throws {
           XCTAssertEqual(try calculator.add(""), 0)
    }
    func testSingleNumberReturnsItself() throws {
         XCTAssertEqual(try calculator.add("1"), 1)
     }

     func testTwoCommaSeparatedNumbers() throws {
         XCTAssertEqual(try calculator.add("1,2"), 3)
     }

     func testNewlineAndCommaMixed() throws {
         XCTAssertEqual(try calculator.add("1\n2,3"), 6)
     }

     func testCustomDelimiter() throws {
         XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
     }

    func testMultipleNegativeNumbersThrows() {
        XCTAssertThrowsError(try calculator.add("1,-2,-3,4")) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
}
