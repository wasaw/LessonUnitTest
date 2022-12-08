//
//  GameFieldPresenter.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

protocol GameFieldPresenterProtocol: AnyObject {
    var interactor: GameFieldInteractorProtocol? { get set }
    func startGame()
    func cellCheck(_ position: Int)
    func sendState(_ cellState: [CellState])
    func endGame()
}

final class GameFieldPresenter {
    
//    MARK: - Properties
    
    weak var view: GameFieldViewProtocol?
    var interactor: GameFieldInteractorProtocol?
    
//    MARK: - Lifecycle
    init(view: GameFieldViewProtocol) {
        self.view = view
    }
}

//  MARK: - GameFieldPresenterProtocol

extension GameFieldPresenter: GameFieldPresenterProtocol {
    func startGame() {
        interactor?.startGame()
    }
    
    func cellCheck(_ position: Int) {
        interactor?.cellCheck(position)
    }
    
    func sendState(_ cellState: [CellState]) {
        view?.updateCell(cellState)
    }
    
    func endGame() {
        view?.endGame()
    }
}
