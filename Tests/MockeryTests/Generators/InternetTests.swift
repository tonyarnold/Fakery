import XCTest
@testable import Mockery

final class InternetTests: XCTestCase {
    let emailFormat = /[\w._%+-]+@[\w.-]+\.\w{2,}/
    var internet: Internet!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        internet = Internet(parser: parser)
    }

    func testUsernameWithoutSeparator() throws {
        let username = internet.username()
        XCTAssertTrue(username.contains(/^[A-Za-z]+(\d+)?$/))
    }

    func testUsernameWithSeparator() throws {
        let username = internet.username(separator: "_")
        if username.lengthOfBytes(using: String.Encoding.utf8) > 5 {
            XCTAssertTrue(username.contains("_"))
        } else {
            XCTAssertFalse(username.contains("_"))
        }
    }

    func testUsernameDoesNotContainQuote() {
        let username = internet.username(separator: "'_'")
        XCTAssertFalse(username.contains("'_'"))
    }

    func testDomainName() {
        let domainName = internet.domainName()
        XCTAssertEqual(domainName, "markov.com")
    }

    func testDomainWord() {
        let domainWord = internet.domainWord()
        XCTAssertEqual(domainWord, "markov")
    }

    func testDomainSuffix() {
        let domainSuffix = internet.domainSuffix()
        XCTAssertEqual(domainSuffix, "com")
    }

    func testEmail() throws {
        let email = internet.email()
        XCTAssertTrue(email.contains(emailFormat))
    }

    func testFreeEmail() {
        let freeEmail = internet.freeEmail()
        XCTAssertTrue(freeEmail.contains(emailFormat))
        XCTAssertTrue(freeEmail.contains(/^[\w._%+-]+@gmail.com$/))
    }

    func testSafeEmail() {
        let safeEmail = internet.safeEmail()
        XCTAssertTrue(safeEmail.contains(emailFormat))
        XCTAssertTrue(safeEmail.contains(/^[\w._%+-]+@example.(org|com|net)$/))
    }

    func testPasswordDefaultLength() {
        let password = internet.password()
        let length = password.lengthOfBytes(using: String.Encoding.utf8)
        XCTAssertGreaterThanOrEqual(length, 8)
        XCTAssertLessThanOrEqual(length, 16)
    }

    func testPasswordWithSpecifiedMatchingLengths() {
        let password = internet.password(minimumLength: 3, maximumLength: 3)
        let length = password.lengthOfBytes(using: String.Encoding.utf8)
        XCTAssertEqual(length, 3)
    }

    func testPasswordWithSpecifiedValidLengths() {
        let password = internet.password(minimumLength: 3, maximumLength: 4)
        let length = password.lengthOfBytes(using: String.Encoding.utf8)
        XCTAssertGreaterThanOrEqual(length, 3)
        XCTAssertLessThanOrEqual(length, 4)
    }

    func testPasswordWithSpecifiedInvalidLengths() {
        let password = internet.password(minimumLength: 4, maximumLength: 3)
        let length = password.lengthOfBytes(using: String.Encoding.utf8)
        XCTAssertEqual(length, 4)
    }

    func testIPv4Address() throws {
        let ipV4Address = internet.ipV4Address()
        XCTAssertTrue(ipV4Address.contains(/((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])/))
    }

    func testIPv6Address() throws {
        let ipV6Address = internet.ipV6Address()
        XCTAssertTrue(ipV6Address.contains(/^([0-9A-Fa-f]{0,4}:){2,7}([0-9A-Fa-f]{1,4}$|((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4})/))
    }

    func testURL() throws {
        let url = internet.url()
        XCTAssertTrue(url.contains(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/))
    }

    func testImage() {
        let url = internet.image()
        XCTAssertEqual(url, "https://lorempixel.com/320/200")
    }

    func testImageWithSpecifiedSize() {
        let url = internet.image(width: 200, height: 150)
        XCTAssertEqual(url, "https://lorempixel.com/200/150")
    }

    func testTemplateImage() throws {
        let url = internet.templateImage()
        XCTAssertEqual(url, "https://dummyimage.com/320x200/000000/ffffff")
    }

    func testTemplateImageWithSpecifiedSize() throws {
        let url = internet.templateImage(
            width: 200,
            height: 150,
            backColorHex: "2e4bc2",
            frontColorHex: "ccdb28"
        )
        XCTAssertEqual(url, "https://dummyimage.com/200x150/2e4bc2/ccdb28")
    }

    func testHashtag() {
        let hashtag = internet.hashtag()
        XCTAssertEqual(hashtag, "#art")
    }
}
