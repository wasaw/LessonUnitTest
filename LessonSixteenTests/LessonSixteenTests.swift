//
//  LessonSixteenTests.swift
//  LessonSixteenTests
//
//  Created by Александр Меренков on 07.12.2022.
//

import XCTest

@testable import LessonSixteen

final class LessonSixteenTests: XCTestCase {
    
    func testStartGame() {
        let iteractor = GameFieldInteractor(presenter: GameFieldPresenter(view: GameFieldViewController()), appealStartState: StartState())
        
        var checkArray: [CellState] = []
        for _ in 0...15 {
            checkArray.append(.empty)
        }
        let answer = iteractor.startGame()
        
        XCTAssertEqual(checkArray, answer)
    }

    func testCellChangeValue() {
        let iteractor = GameFieldInteractor(presenter: GameFieldPresenter(view: GameFieldViewController()), appealStartState: StartState())
        iteractor.startGame()
        let position = Int.random(in: 0...15)
        let cellState = iteractor.cellCheck(position)
        var isChangeValue = false
        
        if cellState[position] == .get || cellState[position] == .miss {
            isChangeValue = true
        }

        XCTAssert(isChangeValue)
    }
    
    func testWinCombination() {
        let winCombination = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]]
        let iteractor = GameFieldInteractor(presenter: GameFieldPresenter(view: GameFieldViewController()), appealStartState: StartState())
        iteractor.startGame()
        var answer: [Int] = []
        
        for i in 0...15 {
            let cellState = iteractor.cellCheck(i)
            if cellState[i] == .get {
                answer.append(i)
            }
        }
        
        for item in winCombination {
            if item == answer {
                XCTAssert(true)
            }
        }
    }
    
    func testCheckBattleshipHorizontal() {
        let iteractor = GameFieldInteractor(presenter: GameFieldPresenter(view: GameFieldViewController()), appealStartState: MockServiceHorizontal())
        iteractor.startGame()
        
        let mustBattleship = [8, 9, 10, 11]
        var gameBattleship: [Int] = []
        for item in mustBattleship {
            let answer = iteractor.cellCheck(item)
            if  answer[item] == .get {
                gameBattleship.append(item)
            }
        }
        
        XCTAssertEqual(mustBattleship, gameBattleship)
    }
    
    func testCheckBattleshipVertical() {
        let iteractor = GameFieldInteractor(presenter: GameFieldPresenter(view: GameFieldViewController()), appealStartState: MockServiceVertical())
        iteractor.startGame()
        
        let mustBattleship = [2, 6, 10, 14]
        var gameBattleship: [Int] = []
        for item in mustBattleship {
            let answer = iteractor.cellCheck(item)
            if  answer[item] == .get {
                gameBattleship.append(item)
            }
        }

        XCTAssertEqual(mustBattleship, gameBattleship)
    }
}
