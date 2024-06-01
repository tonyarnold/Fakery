import XCTest
@testable import Fakery

final class TeamTests: XCTestCase {
    var team: Team!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        team = Team(parser: parser)
    }

    func testName() {
        let name = team.name()
        XCTAssertEqual(name, "California owls")
    }

    func testCreature() {
        let creature = team.creature()
        XCTAssertEqual(creature, "owls")
    }

    func testState() {
        let state = team.state()
        XCTAssertEqual(state, "California")
    }
}
