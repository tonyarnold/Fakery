import XCTest
@testable import Fakery

final class NumberSpec: XCTestCase {
    var number: Number!

    override func setUp() {
        number = Number()
    }

    func testCreatesContinuouslyIncreasingIdentifiers() {
        XCTAssertEqual(number.increasingUniqueID(), 1)
        XCTAssertEqual(number.increasingUniqueID(), 2)
        XCTAssertEqual(number.increasingUniqueID(), 3)
    }

    func testCreatesRandomIntegers() {
        XCTAssertLessThanOrEqual(number.randomInt(), 1000)
        XCTAssertGreaterThanOrEqual(number.randomInt(), 0)

        XCTAssertLessThanOrEqual(number.randomInt(max: 10), 10)
        XCTAssertGreaterThanOrEqual(number.randomInt(min: 10), 10)

        XCTAssertLessThanOrEqual(number.randomInt(min: 5, max: 7), 7)
        XCTAssertGreaterThanOrEqual(number.randomInt(min: 5, max: 7), 5)

        XCTAssertLessThanOrEqual(number.randomInt(min: 1_000_000_000_000, max: 9_999_999_999_999), 9_999_999_999_999)
        XCTAssertGreaterThanOrEqual(number.randomInt(min: 1_000_000_000_000, max: 9_999_999_999_999), 1_000_000_000_000)

        XCTAssertLessThanOrEqual(number.randomInt(min: Int.min, max: Int.max), Int.max)
        XCTAssertGreaterThanOrEqual(number.randomInt(min: Int.min, max: Int.max), Int.min)

        XCTAssertLessThanOrEqual(number.randomInt(min: Int.min, max: 0), 0)
        XCTAssertGreaterThanOrEqual(number.randomInt(min: Int.min, max: 0), Int.min)
    }

    func testCreatesRandomFloats() {
        XCTAssertLessThanOrEqual(number.randomFloat(), 1000)
        XCTAssertGreaterThanOrEqual(number.randomFloat(), 0)

        XCTAssertLessThanOrEqual(number.randomFloat(max: 10), 10)
        XCTAssertGreaterThanOrEqual(number.randomFloat(min: 10), 10)

        XCTAssertLessThanOrEqual(number.randomFloat(min: 5, max: 7), 7)
        XCTAssertGreaterThanOrEqual(number.randomFloat(min: 5, max: 7), 5)
    }

    func testCreatesRandomDoubles() {
        XCTAssertLessThanOrEqual(number.randomDouble(), 1000)
        XCTAssertGreaterThanOrEqual(number.randomDouble(), 0)

        XCTAssertLessThanOrEqual(number.randomDouble(max: 10), 10)
        XCTAssertGreaterThanOrEqual(number.randomDouble(min: 10), 10)

        XCTAssertLessThanOrEqual(number.randomDouble(min: 5, max: 7), 7)
        XCTAssertGreaterThanOrEqual(number.randomDouble(min: 5, max: 7), 5)
    }
}
