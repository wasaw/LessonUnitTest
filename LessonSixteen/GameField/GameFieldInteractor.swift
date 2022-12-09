//
//  GameFieldInteractor.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

protocol GameFieldInteractorProtocol: AnyObject {
    var presenter: GameFieldPresenterProtocol? { get set }
    func startGame() -> [CellState]
    func cellCheck(_ position: Int) -> [CellState]
}

final class GameFieldInteractor {
    
//    MARK: - Properties
    
    weak var presenter: GameFieldPresenterProtocol?

    private var battleshipPosition: [Int] = []
    private var direction: Direction?
    private var cellState: [CellState] = []
    private var foundCell = 0
    
    var appealStartState: StartStateProtocol
    
//    MARK: - Lifecycle
    
    init(presenter: GameFieldPresenterProtocol, appealStartState: StartStateProtocol) {
        self.presenter = presenter
        self.appealStartState = appealStartState
    }
}

//  MARK: - GameFieldInteractorProtocol

extension GameFieldInteractor: GameFieldInteractorProtocol {
    
    //    MARK: - Helpers
    func startGame() -> [CellState] {
        battleshipPosition = []
        cellState = []
        foundCell = 0
        
        guard var startState = appealStartState.getStartState() else { return [] }
            
            for _ in 0...3 {
                battleshipPosition.append(startState.1)
                startState.1 += startState.0
            }
            
            for _ in 0...15 {
                cellState.append(.empty)
            }
            return cellState
        }
    
    func cellCheck(_ position: Int) -> [CellState]{
        if battleshipPosition.contains(position) {
            cellState[position] = .get
            foundCell += 1
            if foundCell == 4 {
                presenter?.endGame()
            }
        } else {
            cellState[position] = .miss
        }
        return cellState
    }
}
