import XCTest
@testable import Fakery

final class ProviderTests: XCTestCase {
    var provider: Provider!

    override func setUp() {
        provider = Provider()
    }

    func testHasEmptyTranslationsDictionary() {
        XCTAssert(provider.translations.isEmpty)
    }

    func testDataForLocaleReturnsDataIfLocaleFileExists() throws {
        let localeData = try XCTUnwrap(provider.dataForLocale("en"))
        XCTAssertFalse(localeData.isEmpty)
    }

    func testDataForLocaleReturnsNilIfLocaleFileDoesNotExist() {
        XCTAssertNil(provider.dataForLocale("bla"))
    }
}
