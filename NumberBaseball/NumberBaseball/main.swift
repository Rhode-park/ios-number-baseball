//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func generateNumber() -> [Int] {
    var remainingNumbers = Array(1...9)
    var randomNumbers: [Int] = []
    while randomNumbers.count < 3 {
        let number = Int(arc4random_uniform(UInt32(remainingNumbers.count)))
        var selectedNumber = remainingNumbers[number]
        if selectedNumber != 0 {
            randomNumbers.append(selectedNumber)
        }
        remainingNumbers[number] = 0
    }
    return randomNumbers
}

func printUserNumbers(userNumbers: [Int]) {
    print("임의의 수 : ", terminator: "")
    for num in userNumbers {
        print(num, terminator: " ")
    }
    print(" ")
}

func compareNumbers(userNumbers: [Int]) -> (Int, Int) {
    printUserNumbers(userNumbers: userNumbers)
    var strike = 0
    var ball = 0
    for index in 0...2 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if userNumbers.contains(computerNumbers[index]) {
            ball += 1
        }
    }
    return (strike, ball)
}

func gameStart() {
    var run = true
    while run {
        remaining -= 1
        let userNumbers = generateNumber()
        let (strike, ball) = compareNumbers(userNumbers: userNumbers)
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(remaining)")
        if strike == 3 {
            print("사용자 승리...!")
            run = false
        } else if remaining == 0 {
            print("컴퓨터 승리...!")
            run = false
        }
    }
}

var remaining = 9
let computerNumbers = generateNumber()

//gameStart()

func showInterface() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: "")
    guard let input = readLine() else { return }
    if input.count == 1 && input == "1" {
        print("선택 : \(input)")
        gameStart()
    } else if input.count == 1 && input == "2" {
        return
    } else {
        print("입력이 잘못되었습니다.")
        showInterface()
    }
}

showInterface()
