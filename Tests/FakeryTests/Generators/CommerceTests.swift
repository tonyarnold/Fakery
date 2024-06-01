import XCTest
@testable import Fakery

final class CommerceTests: XCTestCase {
    var commerce: Commerce!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        commerce = Commerce(parser: parser)
    }

    func testColorGenerates() {
        let color = commerce.color()
        XCTAssertEqual(color, "black")
    }

    func testDepartmentGenerates() throws {
        let department = commerce.department(maximum: 3, fixedAmount: true)
        XCTAssertTrue(department.contains("Music"))
        XCTAssertTrue(department.contains("Video"))
        XCTAssertTrue(department.contains("Development"))
        XCTAssertTrue(department.contains("&"))
        XCTAssertTrue(department.contains(/^[A-Za-z]+, [A-Za-z]+ & [A-Za-z]+$/))
    }

    func testProductNameGenerates() {
        let productName = commerce.productName()
        XCTAssertEqual(productName, "Awesome Wooden Hat")
    }

    func testPriceGeneratesCorrectNumber() {
        let price = commerce.price()
        XCTAssertGreaterThan(price, 0)
        XCTAssertLessThanOrEqual(price, 100)
    }

    func testCategoriesReturnsTheCorrectNumberOfCategories() {
        let categories = commerce.categories(3)
        XCTAssertEqual(categories.count, 3)
    }

    func testCategoriesReturnsAnArrayOfUniqueCategories() {
        let categories = commerce.categories(3)
        var checked: [String] = []
        for category in categories {
            if checked.contains(category) {
                break
            }

            checked.append(category)
        }

        XCTAssertEqual(categories.count, checked.count)
    }

    func testMergeCategories() {
        let text = commerce.merge(categories: ["One", "Two", "Three", "Four"])
        XCTAssertEqual(text, "One, Two, Three & Four")
    }
}
