import XCTest
@testable import SamplePack

final class CompanyTests: XCTestCase {
    var company: Company!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        company = Company(parser: parser)
    }

    func testName() {
        let name = company.name()
        XCTAssertEqual(name, "Markov Inc")
    }

    func testSuffix() {
        let suffix = company.suffix()
        XCTAssertEqual(suffix, "Inc")
    }

    func testCatchPhrase() {
        let phrase = company.catchPhrase()
        XCTAssertEqual(phrase, "Universal 24 hour software")
    }

    func testBS() {
        let bs = company.bs()
        XCTAssertEqual(bs, "implement innovative methodologies")
    }

    func testLogo() throws {
        let logo = company.logo()
        XCTAssertTrue(logo.contains(/^https:\/\/pigment.github.io\/fake-logos\/logos\/medium\/color\/\d+.png$/))
    }
}
