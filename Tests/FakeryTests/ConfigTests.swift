import XCTest
@testable import Fakery

final class ConfigTests: XCTestCase {
    func testHasDefaultValues() {
        XCTAssertEqual(Config.defaultLocale, "en")
        XCTAssertEqual(Config.dirPath, "Locales")
        XCTAssertEqual(Config.pathExtension, "json")
    }
}
