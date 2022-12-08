//
//  GameFieldModel.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 08.12.2022.
//

enum Direction: Int {
    case horizontal = 0
    case vertical = 1
}

enum CellState {
    case empty
    case miss
    case get
}
