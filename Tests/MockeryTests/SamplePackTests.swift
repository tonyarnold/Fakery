import XCTest
@testable import Mockery

final class MockeryTests: XCTestCase {
    var mockery: Mockery!

    override func setUp() {
        mockery = Mockery()
    }

    func testSetsDefaultValues() {
        XCTAssertEqual(mockery.locale, Config.defaultLocale)
        XCTAssertEqual(mockery.parser.locale, Config.defaultLocale)
    }
}
