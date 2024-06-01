import XCTest
@testable import Fakery

final class ParserTests: XCTestCase {
    let parser = Parser(locale: "en-TEST")

    func testSetsDefaultValues() {
        let localParser = Parser()
        XCTAssertEqual(localParser.locale, Config.defaultLocale)
    }

    func testParsingFetchWhenKeyIsCorrect() {
        let city = parser.fetch("address.city")
        XCTAssertEqual(city, "North Vadymtown")

        let name = parser.fetch("name.name")
        XCTAssertEqual(name, "Mr. Vadym Markov")

        let team = parser.fetch("team.name")
        XCTAssertEqual(team, "California owls")
    }

    func testParsingFetchWhenKeyIsIncorrectReturnsEmptyText() {
        let dummy = parser.fetch("dummy")
        XCTAssertEqual(dummy, "")
    }

    func testFetchRawWhenTheKeyIsCorrect() throws {
        let city = try XCTUnwrap((parser.fetchRaw("address.city") as? [String])?.first)
        XCTAssertEqual(city, "#{city_prefix} #{Name.first_name}#{city_suffix}")

        let name = try XCTUnwrap((parser.fetchRaw("name.name") as? [String])?.first)
        XCTAssertEqual(name, "#{prefix} #{first_name} #{last_name}")

        let team = try XCTUnwrap((parser.fetchRaw("team.name") as? [String])?.first)
        XCTAssertEqual(team, "#{Address.state} #{creature}")
    }

    func testFetchRawWhenTheKeyIsIncorrectReturnsEmptyText() throws {
        XCTAssertNil(parser.fetchRaw("dummy") as? String)
    }

    func testParseForSubjectWhenTheSubjectIsCorrect() {
        let text = parser.parse("#{Name.first_name} #{street_suffix} Test", forSubject: "address")
        XCTAssertEqual(text, "Vadym Avenue Test")
    }

    func testParseForSubjectWhenTheSubjectIsIncorrectReturnsTheProvidedText() {
        let text = parser.parse("test", forSubject: "test")
        XCTAssertEqual(text, "test")

        let text1 = parser.parse("test", forSubject: "address")
        XCTAssertEqual(text1, "test")
    }
}
