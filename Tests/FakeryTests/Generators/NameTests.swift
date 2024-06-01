import XCTest
@testable import Fakery

final class NameTests: XCTestCase {
    var nameInstance: Name!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        nameInstance = Name(parser: parser)
    }

    func testName() {
        let text = nameInstance.name()
        XCTAssertEqual(text, "Mr. Vadym Markov")
    }

    func testFirstName() {
        let firstName = nameInstance.firstName()
        XCTAssertEqual(firstName, "Vadym")
    }

    func testLastName() {
        let lastName = nameInstance.lastName()
        XCTAssertEqual(lastName, "Markov")
    }

    func testPrefix() {
        let prefix = nameInstance.prefix()
        XCTAssertEqual(prefix, "Mr.")
    }

    func testSuffix() {
        let suffix = nameInstance.suffix()
        XCTAssertEqual(suffix, "I")
    }

    func testTitle() {
        let title = nameInstance.title()
        XCTAssertEqual(title, "Lead Mobility Engineer")
    }
}
