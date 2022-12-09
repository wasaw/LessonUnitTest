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
        guard let answer = interactor?.startGame() else { return }
        view?.updateCell(answer)
    }
    
    func cellCheck(_ position: Int) {
        guard let answer = interactor?.cellCheck(position) else { return }
        view?.updateCell(answer)
    }
    
    func endGame() {
        view?.endGame()
    }
}
