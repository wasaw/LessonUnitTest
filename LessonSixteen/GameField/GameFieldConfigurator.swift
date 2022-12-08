//
//  GameFieldConfigurator.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

protocol GameFieldConfiguratorProtocol: AnyObject {
    func configure(with viewController: GameFieldViewProtocol)
}

final class GameFieldConfigurator {
    
//    MARK: - Properties
    
//    MARK: - Lifecycle
    
}

//  MARK: - GameFieldConfiguratorProtocol

extension GameFieldConfigurator: GameFieldConfiguratorProtocol {
    func configure(with viewController: GameFieldViewProtocol) {
        let presenter = GameFieldPresenter(view: viewController)
        let interactor = GameFieldInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
