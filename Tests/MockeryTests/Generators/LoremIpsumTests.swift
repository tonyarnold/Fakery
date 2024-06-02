import XCTest
@testable import Mockery

final class LoremIpsumTests: XCTestCase {
    var loremIpsum: LoremIpsumGenerator!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        loremIpsum = LoremIpsumGenerator(parser: parser)
    }

    func testWord() throws {
        let word = loremIpsum.word()
        XCTAssertTrue(word.contains(/^[A-Za-z]+$/))
    }

    func testWords() throws {
        let word = loremIpsum.words()
        XCTAssertTrue(word.contains(/^[A-Za-z]+ [A-Za-z]+ [A-Za-z]+$/))
    }

    func testWordsAmount() throws {
        let word = loremIpsum.words(amount: 2)
        XCTAssertTrue(word.contains(/^[A-Za-z]+ [A-Za-z]+$/))
    }

    func testCharacter() throws {
        let char = loremIpsum.character()
        XCTAssertTrue(char.contains(/^[A-Za-z]$/))
    }

    func testCharacters() throws {
        let chars = loremIpsum.characters()
        XCTAssertTrue(chars.contains(/^[A-Za-z]{255}/))
    }

    func testCharactersAmount() throws {
        let chars = loremIpsum.characters(amount: 7)
        XCTAssertTrue(chars.contains(/^[A-Za-z]{7}/))
    }

    func testSentence() throws {
        let sentence = loremIpsum.sentence()
        XCTAssertTrue(sentence.contains(/^[A-Z][A-Za-z]+ [A-Za-z]+ [A-Za-z]+ [A-Za-z]+.$/))
    }

    func testSentenceAmount() throws {
        let sentence = loremIpsum.sentence(wordsAmount: 2)
        XCTAssertTrue(sentence.contains(/^[A-Z][A-Za-z]+ [A-Za-z]+.$/))
    }

    func testSentences() throws {
        let sentences = loremIpsum.sentences()
        XCTAssertTrue(sentences.contains(/^[A-Za-z ]+. [A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testSentencesAmount() throws {
        let sentences = loremIpsum.sentences(amount: 2)
        XCTAssertTrue(sentences.contains(/^[A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testParagraph() throws {
        let paragraph = loremIpsum.paragraph()
        XCTAssertTrue(paragraph.contains(/^[A-Za-z ]+. [A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testParagraphAmount() throws {
        let paragraph = loremIpsum.paragraph(sentencesAmount: 2)
        XCTAssertTrue(paragraph.contains(/^[A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testParagraphs() throws {
        let paragraphs = loremIpsum.paragraphs()
        XCTAssertTrue(paragraphs.contains(/^[A-Za-z .]+\n[A-Za-z .]+\n[A-Za-z .]+$/))
    }

    func testParagraphsAmount() throws {
        let paragraphs = loremIpsum.paragraphs(amount: 2)
        XCTAssertTrue(paragraphs.contains(/^[A-Za-z .]+\n[A-Za-z .]+$/))
    }
}
