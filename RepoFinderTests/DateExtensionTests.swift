//
//  RepoFinderTests.swift
//  RepoFinderTests
//
//  Created by Abdullah Tarek on 21/09/2024.
//

@testable import RepoFinder
import XCTest

class DateExtensionTests: XCTestCase {
    func testRandomDateIsNotNil() {
        // Test to ensure the randomDate function returns a non-nil value
        let randomDate = Date.randomDate()
        XCTAssertNotNil(randomDate, "The randomDate function should return a valid date")
    }

    func testRandomDateWithinLastTwoYears() {
        // Test to ensure the randomDate is within the last two years
        let randomDate = Date.randomDate()
        XCTAssertNotNil(randomDate, "The randomDate function should return a valid date")

        if let randomDate = randomDate {
            let currentYear = Calendar.current.component(.year, from: Date())
            let randomYear = Calendar.current.component(.year, from: randomDate)

            XCTAssertTrue((currentYear - 2) ... currentYear ~= randomYear, "The random date should be within the last two years")
        }
    }

    func testConvertStringToDateNotNill() {
        let date = "2008-10-11T07:06:01Z".toDate()

        XCTAssertNotNil(date, "The randomDate function should return a valid date")
    }

    func testConvertStringToDateNill() {
        let date = "2008-10-06:01Z".toDate()

        XCTAssertNil(date)
    }
}
