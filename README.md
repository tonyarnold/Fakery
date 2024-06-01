# SamplePack

This is a Swift port of Ruby's [Faker](https://github.com/stympy/samplePack) library that generates fake data.

Are you still bothered with meaningless randomly character strings? Just relax and leave this job to **SamplePack**. It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc.

**NOTE**: Generated data is pretty realistic, supports a range of locales, but returned values are not guaranteed to be unique.

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

let samplePack = SamplePack(locale: "nb-NO")

let firstName = samplePack.name.firstName()  //=> "Emilie"
let lastName = samplePack.name.lastName()    //=> "Hansen"
let city = samplePack.address.city()         //=> "Oslo"
```

## Localization

**SamplePack** is quite powerful when it comes to generation of locale-specific data. In `Resources/Locales` you can find JSON files for more than 20 locales, and, of course, it's not a limit. Feel free to contribute and add more!  

The default locale is English. When you use one of the available generators and the corresponding key is not found in a JSON file for the currently selected locale **SamplePack** will also check if it exists in "en.json" file.

## Generators

### Address

```swift

samplePack.address.city() //=> "Oslo"
samplePack.address.streetName() //=> "North Avenue"
samplePack.address.secondaryAddress() //=> "Apt. 123"
samplePack.address.streetAddress(includeSecondary: Bool) //=> "12 North Avenue"
samplePack.address.buildingNumber() //=> "123"
samplePack.address.postcode(stateAbbreviation: String) //=> "0884"
samplePack.address.timeZone() //=> "America/Los_Angeles"
samplePack.address.streetSuffix() //=> "Avenue"
samplePack.address.citySuffix() //=> "town"
samplePack.address.cityPrefix() //=> "North"
samplePack.address.stateAbbreviation() //=> "CA"
samplePack.address.state() //=> "California"
samplePack.address.county() //=> "Autauga County"
samplePack.address.country() //=> "United States of America"
samplePack.address.countryCode() //=> "US"
samplePack.address.latitude() //=> -58.17256227443719
samplePack.address.longitude() //=> -156.65548382095133
samplePack.address.coordinate() //=> CLLocationCoordinate2D(latitude: 40.97868, longitude: 29.09306)
```

### App

```swift

samplePack.app.name() //=> "Namfix"
samplePack.app.version() //=> "0.1.1"
samplePack.app.author() //=> "Ida Adams"
```

### Business

```swift

samplePack.business.creditCardNumber() //=> "1234-2121-1221-1211"
samplePack.business.creditCardType() //=> "visa"
samplePack.business.creditCardExpiryDate() //=> "2020-10-12"
```

### Commerce

```swift

samplePack.commerce.color() //=> "black"
samplePack.commerce.department(maximum: Int, fixedAmount: Bool) //=> "Music"
samplePack.commerce.productName() //=> "Awesome Wooden Hat"
samplePack.commerce.price() // 90.5
```

### Company

```swift

samplePack.company.name() //=> "Adams Inc"       
samplePack.company.suffix() //=> "Inc"
samplePack.company.catchPhrase() //=> "Universal software"        
samplePack.company.bs() //=> "implement innovative methodologies"
samplePack.company.logo() // "http://pigment.github.io/fake-logos/logos/medium/color/1.png"
```

### Internet

```swift

samplePack.internet.username(separator: String?) //=> "ida4"       
samplePack.internet.domainName(alphaNumericOnly: Bool) //=> "example.com"        
samplePack.internet.domainWord(alphaNumericOnly: Bool) //=> "domainword"        
samplePack.internet.domainSuffix() //=> "com"
samplePack.internet.email() // => "ida4@some.info"
samplePack.internet.freeEmail() //=> "gmail.com"
samplePack.internet.safeEmail() //=> "adams@example.org"
samplePack.internet.password(minimumLength: Int, maximumLength: Int) //=> "e2dddhwd1g5qhvhgfi"
samplePack.internet.ipV4Address() //=> "24.29.18.175"
samplePack.internet.ipV6Address() //=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"
samplePack.internet.url() //=> "http://example.com/ida4"
samplePack.internet.image() //=> "http://lorempixel.com/320/200"
samplePack.internet.templateImage() //=> "http://dummyimage.com/320x200/000000/ffffff"
samplePack.internet.hashtag() //=> "#art"

```

### Lorem

```swift

samplePack.lorem.word() //=> "repellendus"         
samplePack.lorem.words(amount: Int) //=> ["dolores", "adipisci", "nesciunt"]      
samplePack.lorem.character() //=> "a"        
samplePack.lorem.characters(amount: Int) // Default = 255
samplePack.lorem.sentence(wordsAmount: Int) // Default = 4
samplePack.lorem.sentences(amount: Int) // Default = 3
samplePack.lorem.paragraph(sentencesAmount: Int) // Default = 3
samplePack.lorem.paragraphs(amount: Int) // Default = 3
```

### Name

```swift

samplePack.name.name() //=> "Ida Adams"        
samplePack.name.firstName() //=> "Ida"
samplePack.name.lastName() //=> "Adams"
samplePack.name.prefix() //=> "Mrs."
samplePack.name.suffix() //=> "PhD"
samplePack.name.title() //=> "Lead"
```

### Number

```swift

samplePack.number.randomBool() //=> true or false
samplePack.number.randomInt() //=> some Int between 0 and 1000
samplePack.number.randomInt(min: -100, max:50) //=> some Int between -100 and 50
samplePack.number.randomFloat() //=> some Float between 0 and 1000
samplePack.number.randomFloat(min: -10.4, max:50) //=> some Float between -10.4 and 50
samplePack.number.randomCGFloat() //=> some CGFloat between 0 and 1000
samplePack.number.randomCGFloat(min: 42.42, max:86) //=> some CGFloat between -42.42 and 86
samplePack.number.randomDouble() //=> some Double between 0 and 1000
samplePack.number.randomDouble(min: 0, max:1) //=> some Double between 0 and 1
samplePack.number.increasingUniqueId() //=> every call returns an unique int
```

### Phone number

```swift

samplePack.phoneNumber.phoneNumber() //=> "1-333-333-3333"        
samplePack.phoneNumber.cellPhone() //=> "333-333-3333"
samplePack.phoneNumber.areaCode() //=> "201"
samplePack.phoneNumber.exchangeCode() //=> "201"
samplePack.phoneNumber.subscriberNumber() //=> "1234"
samplePack.phoneNumber.numberExtension(length: Int) // "123"
```

### Team

```swift

samplePack.team.name() //=> "bats"         
samplePack.team.creature() //=> "Alabama bats"
samplePack.team.state() // => "Alabama"
```

### Bank

```swift
samplePack.bank.name() //=> "ABN AMRO CORPORATE FINANCE LIMITED"         
samplePack.bank.swiftBic() //=> "AAFMGB21"
samplePack.bank.iban() // => "NL45BUNQ2209931378"
samplePack.bank.bban() //=> ABNA0136468471
```

## Installation

**SamplePack** is available through [Swift Package Manager](https://www.swift.org/documentation/package-manager/). To install using Swift Package Manager, add this to the `dependencies:` section in your Package.swift file:

```swift
.package(url: "https://github.com/tonyarnold/SamplePack.git", .branch("main"))
```

## Author

Original author of Fakery: Vadym Markov, markov.vadym@gmail.com

## License

**SamplePack** is available under the MIT license. See the LICENSE file for more info.
