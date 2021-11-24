import XCTest
import TestCommon
@testable import PreconditionCatching

class PreconditionCatchingTests: XCTestCase {

    func testRunnerWithoutFatalError() throws {
            let runner = Runner()
            try XCTAssertNoThrowFatalError({ runner.run(behavior: .ok) })
    }

    func testRunnerWithFatalError() throws {
            let runner = Runner()
            try XCTAssertThrowFatalError({ runner.run(behavior: .fatalError) })
    }

    func testRunnerOnMain() throws {
        let runner = Runner()
        let exp = expectation(description: #function)
        DispatchQueue.global().async {
            do {
                try XCTAssertThrowFatalError({ runner.run(behavior: .dispatchPreconditionOnMain) })
                exp.fulfill()
            } catch {
                XCTFail()
            }
        }
        wait(for: [exp], timeout: 1.0)
    }

    func testRunnerOffMain() throws {
        let runner = Runner()
        let exp = expectation(description: #function)
        DispatchQueue.main.async {
            do {
                try XCTAssertThrowFatalError({ runner.run(behavior: .dispatchPreconditionOffMain) })
                exp.fulfill()
            } catch {
                XCTFail()
            }
        }
        wait(for: [exp], timeout: 1.0)
    }

    func testRunnerWithPrecondition() throws {
        let runner = Runner()
        try XCTAssertThrowFatalError({ runner.run(behavior: .precondition) })
    }

    func testRunnerWithPreconditionFailure() throws {
        let runner = Runner()
        try XCTAssertThrowFatalError({ runner.run(behavior: .preconditionFailure) })
    }

}
