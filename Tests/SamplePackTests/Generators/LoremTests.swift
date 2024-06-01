import XCTest
@testable import SamplePack

final class LoremTests: XCTestCase {
    var lorem: Lorem!

    override func setUp() {
        let parser = Parser(locale: "en-TEST")
        lorem = Lorem(parser: parser)
    }

    func testWord() throws {
        let word = lorem.word()
        XCTAssertTrue(word.contains(/^[A-Za-z]+$/))
    }

    func testWords() throws {
        let word = lorem.words()
        XCTAssertTrue(word.contains(/^[A-Za-z]+ [A-Za-z]+ [A-Za-z]+$/))
    }

    func testWordsAmount() throws {
        let word = lorem.words(amount: 2)
        XCTAssertTrue(word.contains(/^[A-Za-z]+ [A-Za-z]+$/))
    }

    func testCharacter() throws {
        let char = lorem.character()
        XCTAssertTrue(char.contains(/^[A-Za-z]$/))
    }

    func testCharacters() throws {
        let chars = lorem.characters()
        XCTAssertTrue(chars.contains(/^[A-Za-z]{255}/))
    }

    func testCharactersAmount() throws {
        let chars = lorem.characters(amount: 7)
        XCTAssertTrue(chars.contains(/^[A-Za-z]{7}/))
    }

    func testSentence() throws {
        let sentence = lorem.sentence()
        XCTAssertTrue(sentence.contains(/^[A-Z][A-Za-z]+ [A-Za-z]+ [A-Za-z]+ [A-Za-z]+.$/))
    }

    func testSentenceAmount() throws {
        let sentence = lorem.sentence(wordsAmount: 2)
        XCTAssertTrue(sentence.contains(/^[A-Z][A-Za-z]+ [A-Za-z]+.$/))
    }

    func testSentences() throws {
        let sentences = lorem.sentences()
        XCTAssertTrue(sentences.contains(/^[A-Za-z ]+. [A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testSentencesAmount() throws {
        let sentences = lorem.sentences(amount: 2)
        XCTAssertTrue(sentences.contains(/^[A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testParagraph() throws {
        let paragraph = lorem.paragraph()
        XCTAssertTrue(paragraph.contains(/^[A-Za-z ]+. [A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testParagraphAmount() throws {
        let paragraph = lorem.paragraph(sentencesAmount: 2)
        XCTAssertTrue(paragraph.contains(/^[A-Za-z ]+. [A-Za-z ]+.$/))
    }

    func testParagraphs() throws {
        let paragraphs = lorem.paragraphs()
        XCTAssertTrue(paragraphs.contains(/^[A-Za-z .]+\n[A-Za-z .]+\n[A-Za-z .]+$/))
    }

    func testParagraphsAmount() throws {
        let paragraphs = lorem.paragraphs(amount: 2)
        XCTAssertTrue(paragraphs.contains(/^[A-Za-z .]+\n[A-Za-z .]+$/))
    }
}
