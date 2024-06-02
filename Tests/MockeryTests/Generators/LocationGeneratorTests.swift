import XCTest
@testable import Mockery

final class LocationGeneratorTests: XCTestCase {
    var location: LocationGenerator!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        location = LocationGenerator(parser: parser)
    }

    func testCity() {
        let city = location.city()
        XCTAssertEqual(city, "North Vadymtown")
    }

    func testStreet() {
        let city = location.street()
        XCTAssertEqual(city, "Vadym Avenue")
    }

    func testSecondaryAddress() throws {
        let city = location.secondaryAddress()
        XCTAssertTrue(city.contains(/^Apt. \d{3}$/))
    }

    func testStreetAddressWithoutSecondary() throws {
        let streetAddress = location.streetAddress()
        XCTAssertTrue(streetAddress.contains(/^\d{5} Vadym Avenue$/))
    }

    func testStreetAddressIncludingSecondary() throws {
        let streetAddress = location.streetAddress(includeSecondary: true)
        XCTAssertTrue(streetAddress.contains(/^\d{5} Vadym Avenue Apt. \d{3}$/))
    }

    func testBuildingNumber() throws {
        let buildingNumber = location.buildingNumber()
        XCTAssertTrue(buildingNumber.contains(/^\d{5}$/))
    }

    func testPostCode() throws {
        let postcode = location.postcode()
        XCTAssertTrue(postcode.contains(/^\d{5}-\d{4}$/))
    }

    func testTimeZone() {
        let timeZone = location.timeZone()
        XCTAssertEqual(timeZone, "America/Los_Angeles")
    }

    func testStreetSuffix() {
        let streetSuffix = location.streetSuffix()
        XCTAssertEqual(streetSuffix, "Avenue")
    }

    func testCitySuffix() {
        let citySuffix = location.citySuffix()
        XCTAssertEqual(citySuffix, "town")
    }

    func testCityPrefix() {
        let cityPrefix = location.cityPrefix()
        XCTAssertEqual(cityPrefix, "North")
    }

    func testAbbreviatedState() {
        let stateAbbreviation = location.state(abbreviated: true)
        XCTAssertEqual(stateAbbreviation, "CA")
    }

    func testState() {
        let state = location.state(abbreviated: false)
        XCTAssertEqual(state, "California")
    }

    func testCounty() {
        let county = location.county()
        XCTAssertEqual(county, "Autauga County")
    }

    func testCountry() {
        let country = location.country()
        XCTAssertEqual(country, "United States of America")
    }

    func testCountryCode() {
        let countryCode = location.countryCode()
        XCTAssertEqual(countryCode, "US")
    }

    func testLatitude() {
        let latitude = location.latitude()
        XCTAssertNotEqual(latitude, 0)
    }

    func testLongitude() {
        let longitude = location.longitude()
        XCTAssertNotEqual(longitude, 0)
    }
}
