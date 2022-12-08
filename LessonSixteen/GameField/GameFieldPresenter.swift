//
//  GameFieldPresenter.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

protocol GameFieldPresenterProtocol: AnyObject {
    var interactor: GameFieldInteractorProtocol? { get set }
    
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
    
}
