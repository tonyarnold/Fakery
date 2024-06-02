import XCTest
@testable import Mockery

final class AddressTests: XCTestCase {
    var address: Address!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        address = Address(parser: parser)
    }

    func testCity() {
        let city = address.city()
        XCTAssertEqual(city, "North Vadymtown")
    }

    func testStreetName() {
        let city = address.streetName()
        XCTAssertEqual(city, "Vadym Avenue")
    }

    func testSecondaryAddress() throws {
        let city = address.secondaryAddress()
        XCTAssertTrue(city.contains(/^Apt. \d{3}$/))
    }

    func testStreetAddressWithoutSecondary() throws {
        let streetAddress = address.streetAddress()
        XCTAssertTrue(streetAddress.contains(/^\d{5} Vadym Avenue$/))
    }

    func testStreetAddressIncludingSecondary() throws {
        let streetAddress = address.streetAddress(includeSecondary: true)
        XCTAssertTrue(streetAddress.contains(/^\d{5} Vadym Avenue Apt. \d{3}$/))
    }

    func testBuildingNumber() throws {
        let buildingNumber = address.buildingNumber()
        XCTAssertTrue(buildingNumber.contains(/^\d{5}$/))
    }

    func testPostCodeWithoutStateAbbreviation() throws {
        let postcode = address.postcode()
        XCTAssertTrue(postcode.contains(/^\d{5}-\d{4}$/))
    }

    func testPostCodeWithStateAbbreviation() throws {
        let postcode = address.postcode(stateAbbreviation: "CA")
        XCTAssertTrue(postcode.contains(/^900\d{2}$/))
    }

    func testPostCodeWithWrongStateAbbreviation() {
        let postcode = address.postcode(stateAbbreviation: "TE")
        XCTAssertTrue(postcode.isEmpty)
    }

    func testTimeZone() {
        let timeZone = address.timeZone()
        XCTAssertEqual(timeZone, "America/Los_Angeles")
    }

    func testStreetSuffix() {
        let streetSuffix = address.streetSuffix()
        XCTAssertEqual(streetSuffix, "Avenue")
    }

    func testCitySuffix() {
        let citySuffix = address.citySuffix()
        XCTAssertEqual(citySuffix, "town")
    }

    func testCityPrefix() {
        let cityPrefix = address.cityPrefix()
        XCTAssertEqual(cityPrefix, "North")
    }

    func testStateAbbreviation() {
        let stateAbbreviation = address.stateAbbreviation()
        XCTAssertEqual(stateAbbreviation, "CA")
    }

    func testState() {
        let state = address.state()
        XCTAssertEqual(state, "California")
    }

    func testCounty() {
        let county = address.county()
        XCTAssertEqual(county, "Autauga County")
    }

    func testCountry() {
        let country = address.country()
        XCTAssertEqual(country, "United States of America")
    }

    func testCountryCode() {
        let countryCode = address.countryCode()
        XCTAssertEqual(countryCode, "US")
    }

    func testLatitude() {
        let latitude = address.latitude()
        XCTAssertNotEqual(latitude, 0)
    }

    func testLongitude() {
        let longitude = address.longitude()
        XCTAssertNotEqual(longitude, 0)
    }
}
