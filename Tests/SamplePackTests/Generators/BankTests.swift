import XCTest
@testable import SamplePack

final class BankTests: XCTestCase {
    var bank: Bank!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        bank = Bank(parser: parser)
    }

    func testName() {
        let name = bank.name()
        XCTAssertEqual(name, "ABN AMRO CORPORATE FINANCE LIMITED")
    }

    func testSwiftBIC() {
        let swiftBic = bank.swiftBic()
        XCTAssertEqual(swiftBic, "AAFMGB21")
    }

    func testBBAN() throws {
        let bban = bank.bban()
        XCTAssertTrue(bban.contains(/[A-Z]{4}\d{10}/))
    }

    func testIBAN() throws {
        let iban = bank.iban()
        XCTAssertTrue(iban.contains(/[A-Z]{2}\d{2}[A-Z]{4}\d{10}/))
    }
}
