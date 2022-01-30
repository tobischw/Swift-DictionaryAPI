import XCTest
@testable import Swift_DictionaryAPI

final class Swift_DictionaryAPITests: XCTestCase {
    func testExample() throws {
        let exp = expectation(description: "Fetch entries")
        DictionaryAPI().getDefinitions(forWord: "spicy") { result in
            exp.fulfill()
            switch result {
                case .success(let definitions):
                    definitions.forEach { definition in
                        print("--- \"\(definition.definition)\"")
                        print("e.g. \(definition.example ?? "no example")")
                    }
                case .failure(let error):
                    print(error)
            }
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(true, true)
        }
    }
}
