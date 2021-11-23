import Foundation

struct Runner {
    func run() {
        dispatchPrecondition(condition: .notOnQueue(.main))
        print("Running")
    }
}
