import Foundation
import XCTest

@testable import CwlPreconditionTesting

public func XCTAssertThrowFatalError(_ expression: @escaping () -> Void,
                               file: StaticString = #file,
                               line: UInt = #line) throws {
    var reached = false
    let exception = catchBadInstruction {
        expression()
        reached = true
    }
    XCTAssertNotNil(exception, "No fatal error thrown", file: file, line: line)
    XCTAssertFalse(reached, "Code executed past expected fatal error", file: file, line: line)
}

public func XCTAssertNoThrowFatalError(_ expression: @escaping () -> Void,
                               file: StaticString = #file,
                               line: UInt = #line) throws {
    var reached = false
    let exception = catchBadInstruction {
        expression()
        reached = true
    }
    XCTAssertNil(exception, "Fatal error thrown", file: file, line: line)
    XCTAssertTrue(reached, "Code did not execute past expected fatal error", file: file, line: line)
}
