//
//  GameFieldCell.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

import UIKit

final class GameFieldCell: UICollectionViewCell {
    static let identifite = "gameFieldCell"
    
//    MARK: - Properties
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "close.png")
        return iv
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        layer.borderWidth = 0.7
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        imageView.isHidden = true
    }
    
    func setCellView(state: CellState) {
        switch state {
        case .empty:
            imageView.isHidden = true
            backgroundColor = .white
        case .miss:
            imageView.isHidden = true
            backgroundColor = .xColor
        case .get:
            imageView.isHidden = false
            backgroundColor = .white
        }
    }
    
    func animateCell() {
        if !imageView.isHidden.self {
            UIView.animate(withDuration: 2) {
                self.layer.borderColor = UIColor.red.cgColor
                self.layer.borderWidth = 4
            } completion: { _ in
                self.layer.borderWidth = 0.7
                self.layer.borderColor = UIColor.black.cgColor
            }

        }
    }
}
