import XCTest
@testable import Mockery

final class PhoneNumberTests: XCTestCase {
    var phoneNumber: PhoneNumber!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        phoneNumber = PhoneNumber(parser: parser)
    }

    func testPhoneNumber() throws {
        let phone = phoneNumber.phoneNumber()
        XCTAssertTrue(phone.contains(/^\d{3}-\d{3}-\d{4}$/))
    }

    func testCellPhone() throws {
        let phone = phoneNumber.cellPhone()
        XCTAssertTrue(phone.contains(/^\(\d{3}\) \d{3}-\d{4}$/))
    }

    func testAreaCode() throws {
        let areaCode = phoneNumber.areaCode()
        XCTAssertEqual(areaCode, "201")
    }

    func testExchangeCode() throws {
        let exchangeCode = phoneNumber.exchangeCode()
        XCTAssertEqual(exchangeCode, "201")
    }

    func testSubscriberNumber() throws {
        let subscriberNumber = phoneNumber.subscriberNumber()
        XCTAssertTrue(subscriberNumber.contains(/^\d{4}$/))
    }

    func testNumberExtension() throws {
        let numberExtension = phoneNumber.numberExtension(5)
        XCTAssertTrue(numberExtension.contains(/^\d{5}$/))
    }
}
