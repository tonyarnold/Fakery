/// Generates random texts and words.
///
/// Generate dummy content using traditional faux-Latin lorem ipsum (in other locales to `en`, alternative words may be used).
///
/// In order of increasing size you can generate a single ``word()``, multiple ``words(count:)``, a ``sentence(wordCount:)``, multiple ``sentences(count:)``, one ``paragraph(sentenceCount:)``, or multiple ``paragraphs(count:)``.
public final class LoremIpsumGenerator: Generator {
    /// Generates a random word.
    public func word() -> String {
        return generate("lorem_ipsum.words")
    }

    /// Generates a space separated list of words.
    /// - Parameter count: The number of words to generate.
    public func words(count: Int = 3) -> String {
        var words: [String] = []

        for _ in 0 ..< count {
            words.append(word())
        }

        return words.joined(separator: " ")
    }

    /// Generates a random character.
    public func character() -> String {
        return characters(count: 1)
    }

    /// Generates random characters.
    /// - Parameter count: The number of characters to generate.
    public func characters(count: Int = 255) -> String {
        var chars = ""

        if count > 0 {
            for _ in 0 ..< count {
                let char = Character(UnicodeScalar(.random(in: UInt32.min...UInt32.max) % (122 - 97) + 97)!)
                chars.append(char)
            }
        }

        return chars
    }

    /// Generates a space separated list of words beginning with a capital letter and ending with a period.
    /// - Parameter wordCount: The number of words, that should be in the sentence.
    public func sentence(wordCount: Int = 4) -> String {
        var sentence = words(count: wordCount) + "."
        sentence.replaceSubrange(
            sentence.startIndex ... sentence.startIndex,
            with: String(sentence[sentence.startIndex]).capitalized
        )
        return sentence
    }
    
    /// Generates the given number of sentences.
    /// - Parameter count: The number of sentences to generate.
    public func sentences(count: Int = 3) -> String {
        var sentences: [String] = []

        for _ in 0 ..< count {
            sentences.append(sentence())
        }

        return sentences.joined(separator: " ")
    }
    
    /// Generates a paragraph with the given number of sentences.
    /// - Parameter sentenceCount: The number of sentences to generate.
    public func paragraph(sentenceCount: Int = 3) -> String {
        return sentences(count: sentenceCount)
    }
    
    /// Generates the given number of paragraphs.
    /// - Parameter count: The number of paragraphs to generate.
    public func paragraphs(count: Int = 3) -> String {
        var paragraphs: [String] = []

        for _ in 0 ..< count {
            paragraphs.append(paragraph())
        }

        return paragraphs.joined(separator: "\n")
    }
}
