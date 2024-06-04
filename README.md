# Mockery

This is a Swift port of [Faker](https://fakerjs.dev) that generates massive amounts of fake (but realistic) data for testing and development.

Are you still bothered with meaningless randomly character strings? Just relax and leave this job to **Mockery**. It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc.

> [!NOTE] 
> The generated data is pretty realistic, and supports a range of locales, but the returned values are not guaranteed to be unique.

## Table of Contents

* [Usage](#usage)
* [Localization](#localization)
* [Generators](#generators)
  * [Address](#address)
  * [App](#app)
  * [Business](#business)
  * [Commerce](#commerce)
  * [Company](#company)
  * [Internet](#internet)
  * [Lorem](#lorem)
  * [Name](#name)
  * [Number](#number)
  * [Phone number](#phone-number)
  * [Team](#team)
  * [Bank](#bank)
* [Installation](#installation)
* [Contributing](#contributing)
* [Author](#author)
* [License](#license)

## Usage

```swift

let mockery = Mockery(locale: "nb-NO")

let firstName = mockery.name.firstName()  //=> "Emilie"
let lastName = mockery.name.lastName()    //=> "Hansen"
let city = mockery.address.city()         //=> "Oslo"
```

## Localization

**Mockery** is quite powerful when it comes to generation of locale-specific data. In `Resources/Locales` you can find JSON files for more than 20 locales, and, of course, it's not a limit. Feel free to contribute and add more!

The default locale is English. When you use one of the available generators and the corresponding key is not found in a JSON file for the currently selected locale **Mockery** will also check if it exists in "en.json" file.

## Generators

### Address

```swift
mockery.address.city() //=> "Oslo"
mockery.address.streetName() //=> "North Avenue"
mockery.address.secondaryAddress() //=> "Apt. 123"
mockery.address.streetAddress(includeSecondary: Bool) //=> "12 North Avenue"
mockery.address.buildingNumber() //=> "123"
mockery.address.postcode(stateAbbreviation: String) //=> "0884"
mockery.address.timeZone() //=> "America/Los_Angeles"
mockery.address.streetSuffix() //=> "Avenue"
mockery.address.citySuffix() //=> "town"
mockery.address.cityPrefix() //=> "North"
mockery.address.stateAbbreviation() //=> "CA"
mockery.address.state() //=> "California"
mockery.address.county() //=> "Autauga County"
mockery.address.country() //=> "United States of America"
mockery.address.countryCode() //=> "US"
mockery.address.latitude() //=> -58.17256227443719
mockery.address.longitude() //=> -156.65548382095133
mockery.address.coordinate() //=> CLLocationCoordinate2D(latitude: 40.97868, longitude: 29.09306)
```

### App

```swift
mockery.app.name() //=> "Namfix"
mockery.app.version() //=> "0.1.1"
mockery.app.author() //=> "Ida Adams"
```

### Business

```swift
mockery.business.creditCardNumber() //=> "1234-2121-1221-1211"
mockery.business.creditCardType() //=> "visa"
mockery.business.creditCardExpiryDate() //=> "2020-10-12"
```

### Commerce

```swift
mockery.commerce.color() //=> "black"
mockery.commerce.department(maximum: Int, fixedAmount: Bool) //=> "Music"
mockery.commerce.productName() //=> "Awesome Wooden Hat"
mockery.commerce.price() // 90.5
```

### Company

```swift
mockery.company.name() //=> "Adams Inc"
mockery.company.suffix() //=> "Inc"
mockery.company.catchPhrase() //=> "Universal software"
mockery.company.bs() //=> "implement innovative methodologies"
mockery.company.logo() // "http://pigment.github.io/fake-logos/logos/medium/color/1.png"
```

### Internet

```swift
mockery.internet.username(separator: String?) //=> "ida4"
mockery.internet.domainName(alphaNumericOnly: Bool) //=> "example.com"
mockery.internet.domainWord(alphaNumericOnly: Bool) //=> "domainword"
mockery.internet.domainSuffix() //=> "com"
mockery.internet.email() // => "ida4@some.info"
mockery.internet.freeEmail() //=> "gmail.com"
mockery.internet.safeEmail() //=> "adams@example.org"
mockery.internet.password(minimumLength: Int, maximumLength: Int) //=> "e2dddhwd1g5qhvhgfi"
mockery.internet.ipV4Address() //=> "24.29.18.175"
mockery.internet.ipV6Address() //=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"
mockery.internet.url() //=> "http://example.com/ida4"
mockery.internet.image() //=> "http://lorempixel.com/320/200"
mockery.internet.templateImage() //=> "http://dummyimage.com/320x200/000000/ffffff"
mockery.internet.hashtag() //=> "#art"
```

### Lorem

```swift
mockery.lorem.word() //=> "repellendus"
mockery.lorem.words(amount: Int) //=> ["dolores", "adipisci", "nesciunt"]
mockery.lorem.character() //=> "a"
mockery.lorem.characters(amount: Int) // Default = 255
mockery.lorem.sentence(wordsAmount: Int) // Default = 4
mockery.lorem.sentences(amount: Int) // Default = 3
mockery.lorem.paragraph(sentencesAmount: Int) // Default = 3
mockery.lorem.paragraphs(amount: Int) // Default = 3
```

### Name

```swift
mockery.name.name() //=> "Ida Adams"
mockery.name.firstName() //=> "Ida"
mockery.name.lastName() //=> "Adams"
mockery.name.prefix() //=> "Mrs."
mockery.name.suffix() //=> "PhD"
mockery.name.title() //=> "Lead"
```

### Number

```swift
mockery.number.randomBool() //=> true or false
mockery.number.randomInt() //=> some Int between 0 and 1000
mockery.number.randomInt(min: -100, max:50) //=> some Int between -100 and 50
mockery.number.randomFloat() //=> some Float between 0 and 1000
mockery.number.randomFloat(min: -10.4, max:50) //=> some Float between -10.4 and 50
mockery.number.randomCGFloat() //=> some CGFloat between 0 and 1000
mockery.number.randomCGFloat(min: 42.42, max:86) //=> some CGFloat between -42.42 and 86
mockery.number.randomDouble() //=> some Double between 0 and 1000
mockery.number.randomDouble(min: 0, max:1) //=> some Double between 0 and 1
mockery.number.increasingUniqueId() //=> every call returns an unique int
```

### Phone number

```swift
mockery.phoneNumber.phoneNumber() //=> "1-333-333-3333"
mockery.phoneNumber.cellPhone() //=> "333-333-3333"
mockery.phoneNumber.areaCode() //=> "201"
mockery.phoneNumber.exchangeCode() //=> "201"
mockery.phoneNumber.subscriberNumber() //=> "1234"
mockery.phoneNumber.numberExtension(length: Int) // "123"
```

### Team

```swift
mockery.team.name() //=> "bats"
mockery.team.creature() //=> "Alabama bats"
mockery.team.state() // => "Alabama"
```

### Bank

```swift
mockery.bank.name() //=> "ABN AMRO CORPORATE FINANCE LIMITED"
mockery.bank.swiftBic() //=> "AAFMGB21"
mockery.bank.iban() // => "NL45BUNQ2209931378"
mockery.bank.bban() //=> ABNA0136468471
```

## Installation

**Mockery** is available through [Swift Package Manager](https://www.swift.org/documentation/package-manager/). To install using Swift Package Manager, add this to the `dependencies:` section in your Package.swift file:

```swift
.package(url: "https://github.com/tonyarnold/mockery.git", .branch("main"))
```

## Author

Original author of Fakery: Vadym Markov, markov.vadym@gmail.com

## License

**Mockery** is available under the MIT license. See the LICENSE file for more info.
