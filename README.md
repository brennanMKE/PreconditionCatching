# Precondition Catching

When running tests which hit fatal errors, often preconditions the built-in support with XCTest. One package which supports caching fatal errors is [CwlPreconditionTesting]. Unfortunately [Apple Silicon Support] is not ready yet. Thanks to a reference to [SwiftCurrent] shows that adding a custom assertion which skips the test while running on an M1 Mac it is possible to overcome this blocker.

To introduce code which uses XCTest which is not in test bundle some additional build settings will be necessary since XCTest is not in th enormal location where other frameworks are found. Multiple test targets can use this module for this custom assertion.

```sh
ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES
ENABLE_TESTING_SEARCH_PATHS = YES
SYSTEM_FRAMEWORK_SEARCH_PATHS = $(CORRESPONDING_DEVICE_PLATFORM_DIR)/Developer/Library/Frameworks $(inherited)
```

## References

* [Writing ARM64 Code for Apple Platforms]
* [Kernel Structures]
* [Learn the architecture: AArch64 Instruction Set Architecture]

---
[CwlPreconditionTesting]: https://github.com/mattgallagher/CwlPreconditionTesting
[Apple Silicon Support]: https://github.com/mattgallagher/CwlPreconditionTesting/issues/21
[SwiftCurrent]: https://github.com/wwt/SwiftCurrent/pull/107/files
[Writing ARM64 Code for Apple Platforms]: https://developer.apple.com/documentation/xcode/writing-arm64-code-for-apple-platforms
[Kernel Structures]: https://developer.apple.com/documentation/kernel/kernel_structures
[Learn the architecture: AArch64 Instruction Set Architecture]: https://developer.arm.com/documentation/102374/0101/Registers-in-AArch64---other-registers