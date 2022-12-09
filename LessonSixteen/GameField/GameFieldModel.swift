//
//  GameFieldModel.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 08.12.2022.
//

protocol StartStateProtocol {
    func getStartState() -> (Int, Int)?
}

enum Direction: Int {
    case horizontal = 0
    case vertical = 1
}

enum CellState {
    case empty
    case miss
    case get
}

struct StartState:  StartStateProtocol {
    private let horizontalStartPosition = [0, 4, 8, 12]
    private let verticalStartPosition = [0, 1, 2, 3]
    
    func getStartState() -> (Int, Int)? {
        let direction = Direction(rawValue: Int.random(in: 0...1))

        if direction == .vertical {
            let step = 4
            guard let startPosition = verticalStartPosition.randomElement() else { return nil }
            return (step, startPosition)
        } else {
            let step = 1
            guard let startPosition = horizontalStartPosition.randomElement() else { return nil }
            return (step, startPosition)
        }
    }
}
