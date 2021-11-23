import Foundation
import XCTest

@testable import CwlPreconditionTesting

public func XCTAssertThrowsFatalError(_ expression: @escaping () -> Void,
                               file: StaticString = #file,
                               line: UInt = #line) throws {
    #if (os(iOS)) && (arch(arm64) || arch(x86_64))
    var reached = false
    let exception = catchBadInstruction {
        expression()
        reached = true
    }
    XCTAssertNotNil(exception, "No fatal error thrown", file: file, line: line)
    XCTAssertFalse(reached, "Code executed past expected fatal error", file: file, line: line)
    #else
    throw XCTSkip("XCTAssertThrowsFatalError is only available on x86_64 architecture.")
    #endif
}
