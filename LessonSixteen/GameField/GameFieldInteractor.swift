//
//  GameFieldInteractor.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

protocol GameFieldInteractorProtocol: AnyObject {
    var presenter: GameFieldPresenterProtocol? { get set }
    func startGame()
    func cellCheck(_ position: Int)
}

final class GameFieldInteractor {
    
//    MARK: - Properties
    
    var presenter: GameFieldPresenterProtocol?
    private let horizontalStartPosition = [0, 4, 8, 12]
    private let verticalStartPosition = [0, 1, 2, 3]
    private var battleshipPosition: [Int] = []
    private var direction: Direction?
    private var step: Int?
    private var startPosition: Int?
    private var cellState: [CellState] = []
    private var foundCell = 0
    
//    MARK: - Lifecycle
    
    init(presenter: GameFieldPresenterProtocol) {
        self.presenter = presenter
    }
}

//  MARK: - GameFieldInteractorProtocol

extension GameFieldInteractor: GameFieldInteractorProtocol {
    
    //    MARK: - Helpers
        func startGame() {
            direction = Direction(rawValue: Int.random(in: 0...1))
            battleshipPosition = []
            cellState = []
            foundCell = 0
            
            if direction == .vertical {
                step = 4
                startPosition = verticalStartPosition.randomElement()
            } else {
                step = 1
                startPosition = horizontalStartPosition.randomElement()
            }
            guard var startPosition = startPosition else { return }
            guard let step = step else { return }
            for _ in 0...3 {
                battleshipPosition.append(startPosition)
                startPosition += step
            }
            
            for _ in 0...15 {
                cellState.append(.empty)
            }
            presenter?.sendState(cellState)            
        }
    
    func cellCheck(_ position: Int) {
        if battleshipPosition.contains(position) {
            cellState[position] = .get
            foundCell += 1
            if foundCell == 4 {
                presenter?.endGame()
            }
        } else {
            cellState[position] = .miss
        }
        presenter?.sendState(cellState)
    }
}
