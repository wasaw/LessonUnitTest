//
//  GameFieldInteractor.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

protocol GameFieldInteractorProtocol: AnyObject {
    var presenter: GameFieldPresenterProtocol? { get set }
    
}

final class GameFieldInteractor {
    
//    MARK: - Properties
    
    var presenter: GameFieldPresenterProtocol?
    private let horizontalStartPosition = [0, 1, 2, 3]
    private let verticalStartPosition = [4, 8, 12]
    private var battleshipPosition: [Int] = []
    private let horizontalStap = 1
    private let verticalStap = 4
    
//    MARK: - Lifecycle
    
    init(presenter: GameFieldPresenterProtocol) {
        self.presenter = presenter
    }
}

//  MARK: - GameFieldInteractorProtocol

extension GameFieldInteractor: GameFieldInteractorProtocol {
    
    
}
