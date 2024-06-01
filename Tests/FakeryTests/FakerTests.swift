import XCTest
@testable import Fakery

final class FakerTests: XCTestCase {
    var faker: Faker!

    override func setUp() {
        faker = Faker()
    }

    func testSetsDefaultValues() {
        XCTAssertEqual(faker.locale, Config.defaultLocale)
        XCTAssertEqual(faker.parser.locale, Config.defaultLocale)
    }
}
