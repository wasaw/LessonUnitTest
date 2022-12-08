//
//  GameFieldViewController.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

import UIKit

protocol GameFieldViewProtocol: AnyObject {
    var presenter:GameFieldPresenterProtocol? { get set }
    func updateCell(_ cellState: [CellState])
    func endGame()
}

final class GameFieldViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: GameFieldPresenterProtocol?
    let configurator: GameFieldConfiguratorProtocol = GameFieldConfigurator()
    
    var collectionView: UICollectionView?
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Морской бой."
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textColor = .textColor
        return label
    }()
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Найдите четырех палубный крейсер."
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .textColor
        return label
    }()
    private let newGameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Новая игра", for: .normal)
        btn.setTitleColor(.textColor, for: .normal)
        btn.backgroundColor = .xColor
        btn.layer.borderWidth = 0.7
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(handleNewGameButton), for: .touchUpInside)
        return btn
    }()
    
    private var cellState: [CellState]?
    private var isFinish = false
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter?.startGame()
        configureUI()
        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        configureTitleLabel()
        configureTextLabel()
        configureCollectionView()
        configureNewGameButton()
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func configureTextLabel() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7).isActive = true
    }
    
    private func configureCollectionView() {
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
        collectionView.backgroundColor = .background
    }
    
    private func configureNewGameButton() {
        view.addSubview(newGameButton)
        guard let collectionView = collectionView else { return }
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newGameButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 35).isActive = true
        newGameButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        newGameButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
//    MARK: - Selectors
    
    @objc private func handleNewGameButton() {
        isFinish = false
        presenter?.startGame()
    }
}

//  MARK: - GameFieldViewProtocol

extension GameFieldViewController: GameFieldViewProtocol {
    func updateCell(_ cellState: [CellState]) {
        self.cellState = cellState
        collectionView?.reloadData()
    }
    
    func endGame() {
        isFinish = true
    }
}

//  MARK: - CollectionViewDelegate

extension GameFieldViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isFinish {
            presenter?.cellCheck(indexPath.item)
        }
    }
}

//  MARK: - CollectionViewDataSource

extension GameFieldViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameFieldCell.identifite, for: indexPath) as? GameFieldCell else { return UICollectionViewCell() }
        guard let cellState = cellState else { return UICollectionViewCell() }
        cell.setCellView(state: cellState[indexPath.item])
        if isFinish {
            cell.animateCell()
        }
        return cell
    }
}

//  MARK: - CollectionViewFlowLayout

extension GameFieldViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
}
