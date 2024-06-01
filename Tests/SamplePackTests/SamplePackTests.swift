import XCTest
@testable import SamplePack

final class SamplePackTests: XCTestCase {
    var samplePack: SamplePack!

    override func setUp() {
        samplePack = SamplePack()
    }

    func testSetsDefaultValues() {
        XCTAssertEqual(samplePack.locale, Config.defaultLocale)
        XCTAssertEqual(samplePack.parser.locale, Config.defaultLocale)
    }
}
