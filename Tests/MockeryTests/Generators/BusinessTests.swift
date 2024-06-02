import XCTest
@testable import Mockery

final class BusinessTest: XCTestCase {
    var business: Business!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        business = Business(parser: parser)
    }

    func testCreditCardNumber() {
        let creditCardNumber = business.creditCardNumber()
        XCTAssertEqual(creditCardNumber, "1234-2121-1221-1211")
    }

    func testCreditCardType() {
        let creditCardType = business.creditCardType()
        XCTAssertEqual(creditCardType, "visa")
    }

    func testCreditCardExpiryDate() throws {
        let creditCardExpiryDate = try XCTUnwrap(business.creditCardExpiryDate())
        let dateString = business.dateFormatter.string(from: creditCardExpiryDate)
        XCTAssertEqual(dateString, "2020-10-12")
    }
}
