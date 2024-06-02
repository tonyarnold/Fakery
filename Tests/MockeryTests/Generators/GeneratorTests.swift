import XCTest
@testable import Mockery

final class GeneratorTests: XCTestCase {
    var generator: Generator!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        generator = Generator(parser: parser)
    }

    func testNumerify() throws {
        let numerified = generator.numerify("12####")
        XCTAssertFalse(numerified.contains("#"))
        XCTAssertTrue(numerified.contains(/^12\d{4}$/))
    }

    func testLetterify() throws {
        let letterified = generator.letterify("This is awes?me")
        XCTAssertFalse(letterified.contains("?"))
        XCTAssertTrue(letterified.contains(/^This is awes[A-Za-z]me$/))
    }

    func testBothify() throws {
        let bothified = generator.bothify("#th of ?pril")
        XCTAssertFalse(bothified.contains("#"))
        XCTAssertFalse(bothified.contains("?"))
        XCTAssertTrue(bothified.contains(/^\dth of [A-Za-z]pril$/))
    }

    func testAlphaNumerify() {
        let latin = generator.alphaNumerify("Øghdasæå!y_=a")
        XCTAssertEqual(latin, "ghdasy_a")
    }

    func testRandomWordsFromKey() {
        let phrase = generator.randomWordsFromKey("company.buzzwords")
        XCTAssertEqual(phrase, "Universal 24 hour software")
    }
}
