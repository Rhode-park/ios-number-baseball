//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createRandomNumbers() -> [Int] {
    var createdNumbers = [Int]()
    
    while createdNumbers.count < 3 {
        let createdRandomNumber = Int.random(in:1...9)
        
        if createdNumbers.contains(createdRandomNumber) {
            continue
        } else {
            createdNumbers.append(createdRandomNumber)
        }
    }
    
    return createdNumbers
}

func inputUserNumbers() -> [Int] {
    var numbers = [String]()
    var userInput = [Int]()
    
    print("게임 시작. 입력 : ")
    
    if let userNumbers = readLine() {
        let numberType = "^[1-9]{1}\\s[1-9]{1}\\s[1-9]{1}$"
        
        let isCorrectNumber = userNumbers.range(of: numberType, options: .regularExpression) != nil
        
        if isCorrectNumber == true {
            numbers = userNumbers.components(separatedBy: " ")
        }
        
        if isCorrectNumber == false || Set(numbers).count != 3 {
            print("입력이 잘못되었습니다")
            return userInput
        }
        
    }
    
    for number in numbers {
        if let aa = Int(number) {
            userInput.append(aa)
        }
    }
    
    return userInput
}


func countBallAndStrike(from computerRandomNumbers: [Int], comparing randomNumbers: [Int]) -> [String: Int] {
    var result = [String: Int]()
    result["strike"] = 0
    result["ball"] = 0

    for i in 0...2 {
        if computerRandomNumbers[i] == randomNumbers[i] {
            result["strike"]? += 1
        } else if randomNumbers.contains(computerRandomNumbers[i]) {
            result["ball"]? += 1
        }
    }

    return result
}

func startGame() {
    var remainingCount = 9
    let computerRandomNumbers = createRandomNumbers()
    
    while remainingCount > 0 {
        var userNumbers = [Int]()
        remainingCount -= 1
        
        repeat {
            userNumbers = inputUserNumbers()
        } while userNumbers.count != 3
        
        let currentScore = countBallAndStrike(from: computerRandomNumbers, comparing: userNumbers)
        print("\(currentScore["strike"]) 스트라이크, \(currentScore["ball"]) 볼")
        
        if currentScore["strike"] == 3 {
            print("사용자 승리...!")
            break
        }
        
        if remainingCount == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainingCount)")
        }
    
    }
}




func showMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let menuSelect = readLine()
    
    if menuSelect == String(1) {
        startGame()
    } else if menuSelect == String(2) {
        
    } else {
        print("입력이 잘못되었습니다")
        showMenu()
    }
}

showMenu()
