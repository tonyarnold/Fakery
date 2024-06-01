import XCTest
@testable import SamplePack

final class AppTests: XCTestCase {
    var app: App!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        app = App(parser: parser)
    }

    func testName() {
        let name = app.name()
        XCTAssertEqual(name, "Namfix")
    }

    func testVersion() throws {
        let version = app.version()
        XCTAssertTrue(version.contains(/^0.\d.\d$/))
    }

    func testAuthor() {
        let author = app.author()
        XCTAssertEqual(author, "Mr. Vadym Markov")
    }
}
