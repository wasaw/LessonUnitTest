//
//  GameFieldViewController.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

import UIKit

protocol GameFieldViewProtocol: AnyObject {
    var presenter:GameFieldPresenterProtocol? { get set }
}

final class GameFieldViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: GameFieldPresenterProtocol?
    let configurator: GameFieldConfiguratorProtocol = GameFieldConfigurator()
    
    var collectionView: UICollectionView?
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        configureUI()
        view.backgroundColor = .white
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(GameFieldCell.self, forCellWithReuseIdentifier: GameFieldCell.identifite)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 335).isActive = true
        collectionView.backgroundColor = .gray
    }
}

//  MARK: - GameFieldViewProtocol

extension GameFieldViewController: GameFieldViewProtocol {
    
}

//  MARK: - CollectionViewDelegate

extension GameFieldViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
}

//  MARK: - CollectionViewDataSource

extension GameFieldViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameFieldCell.identifite, for: indexPath) as? GameFieldCell else { return UICollectionViewCell() }
        
        return cell
    }
}

//  MARK: - CollectionViewFlowLayout

extension GameFieldViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
}
