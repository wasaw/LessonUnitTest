//
//  GameFieldCell.swift
//  LessonSixteen
//
//  Created by Александр Меренков on 07.12.2022.
//

import UIKit

class GameFieldCell: UICollectionViewCell {
    static let identifite = "gameFieldCell"
//    MARK: - Properties
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
