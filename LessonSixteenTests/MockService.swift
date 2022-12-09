import Foundation

@testable import LessonSixteen

struct MockServiceHorizontal: StartStateProtocol {
    func getStartState() -> (Int, Int)? {
        return (1, 8)
    }
}

struct MockServiceVertical: StartStateProtocol {
    func getStartState() -> (Int, Int)? {
        return (4, 2)

    }
}

