import CoreLocation
import Foundation

/// Generates addresses and locations.
///
/// For a typical street address for a locale, use ``streetAddress(includeSecondary:)``, ``city()``, ``state(abbreviated:)``, and ``postcode()`` or ``zipCode()``. Most locales provide localized versions for a specific country.
///
/// If you need latitude and longitude coordinates, use ``latitude()`` and ``longitude()``, or ``coordinate(inRadius:fromCenter:)`` for a latitude/longitude near a given location.
///
/// For a random country, you can use ``country()`` or ``countryCode()``.
public final class LocationGenerator: Generator {
    /// Generates a random localized city name.
    public func city() -> String {
        return generate("location.city")
    }
    
    /// Generates a random localized street name.
    public func street() -> String {
        return generate("location.street_name")
    }
    
    /// Returns a random localized street name.
    @available(*, deprecated, renamed: "street()", message: "This method is deprecated and will be removed in a future version. Use `street()` instead.")
    public func streetName() -> String {
        return street()
    }
    
    /// Generates a random localized secondary address. This refers to a specific location at a given address such as an apartment or room number.
    public func secondaryAddress() -> String {
        return numerify(generate("location.secondary_address"))
    }

    /// Generates a random localized street address.
    /// - Parameter includeSecondary: When true this will generate a full address. Otherwise it will just generate a street address.
    public func streetAddress(includeSecondary: Bool = false) -> String {
        var streetAddress = numerify(generate("location.street_address"))

        if includeSecondary {
            streetAddress += " " + secondaryAddress()
        }

        return streetAddress
    }

    /// Generates a random building number.
    public func buildingNumber() -> String {
        return bothify(generate("location.building_number"))
    }
    
    /// Generates a random zip code.
    public func zipCode() -> String {
        return bothify(generate("location.postcode"))
    }
    
    /// Generates a random postcode.
    public func postcode() -> String {
        return zipCode()
    }
    
    /// Returns a random time zone.
    public func timeZone() -> String {
        return generate("location.time_zone")
    }

    public func streetSuffix() -> String {
        return generate("location.street_suffix")
    }

    public func citySuffix() -> String {
        return generate("location.city_suffix")
    }

    public func cityPrefix() -> String {
        return generate("location.city_prefix")
    }

    /// Returns a random localized state's abbreviated name from this country.
    @available(*, deprecated, renamed: "state(abbreviated:)", message: "This method is deprecated and will be removed in a future version. Use `state(abbreviated: true) instead.")
    public func stateAbbreviation() -> String {
        return generate("location.state_abbr")
    }
    
    /// Returns a random localized state, or other equivalent first-level administrative entity for the locale's country such as a province or region.
    /// Generally, these are the [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivisions for a country. If a locale doesn't correspond to one specific country, the method may return [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivisions from one or more countries that uses that language. For example, the `ar` locale includes subdivisions from Arabic-speaking countries, such as Tunisia, Algeria, Syria, Lebanon, etc. For historical compatibility reasons, the default en locale only includes states in the United States (identical to `en_US`). However, you can use other English locales, such as `en_IN`, `en_GB`, and `en_AU`, if needed.
    /// - Parameter abbreviated: If true this will return abbreviated first-level administrative entity names. Otherwise this will return the long name.
    public func state(abbreviated: Bool = false) -> String {
        guard abbreviated else {
            return generate("location.state")
        }

        return generate("location.state_abbr")
    }
    
    /// Returns a random localized county, or other equivalent second-level administrative entity for the locale's country such as a district or department.
    public func county() -> String {
        return generate("location.county")
    }
    
    /// Returns a random country name.
    public func country() -> String {
        return generate("location.country")
    }
    
    /// Returns a random [ISO_3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) country code.
    public func countryCode() -> String {
        return generate("location.country_code")
    }
    
    /// Generates a random latitude.
    public func latitude() -> Double {
        return drand48() * 180.0 - 90.0
    }

    /// Generates a random longitude.
    public func longitude() -> Double {
        return drand48() * 360.0 - 180.0
    }
    
    /// Generates a random coordinate within the specified radius from the given center coordinate.
    /// - Parameters:
    ///   - radius: The maximum distance from the given coordinate to the new coordinate.
    ///   - center: The original coordinate to get a new coordinate close to.
    public func coordinate(
        inRadius radius: Double,
        fromCenter center: CLLocationCoordinate2D
    ) -> CLLocationCoordinate2D {
        let y0 = center.latitude
        let x0 = center.longitude

        // Convert meters to degrees for radius
        let radiusInDegrees = radius / 111_300.0

        // Random point in circle
        let u = Double(arc4random()) / 0xFFFF_FFFF
        let v = Double(arc4random()) / 0xFFFF_FFFF
        let w = radiusInDegrees * sqrt(u)
        let t = 2 * .pi * v
        let x = w * cos(t)
        let y = w * sin(t)

        // Adjust longitude (x) to adjust for east-west shrinking in distance
        let latRadians = y0 * .pi / 180
        let newx = x / cos(latRadians)

        // Set found random point
        let foundLatitude = y + y0
        let foundLongitude = newx + x0

        return CLLocationCoordinate2D(latitude: foundLatitude, longitude: foundLongitude)
    }
}
