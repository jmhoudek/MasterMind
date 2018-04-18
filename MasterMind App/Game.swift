//
//  Game.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 2/7/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit
import Foundation

class Game: NSObject
{
    //creates the secret "number" as soon as the game starts, actually 3 individually created ints
    var digitOne : Int
    var digitTwo : Int
    var digitThree: Int
    var numberOfGuesses = 0
    //initializer that makes a random mumber and also makes sure that the digits aren't repeated
    override init()
    {
        digitOne = Int(arc4random_uniform(10))
        digitTwo = Int(arc4random_uniform(10))
        digitThree = Int(arc4random_uniform(10))
        while(digitTwo == digitOne)
        {
            digitTwo = Int(arc4random_uniform(10))
        }
        
        var x = (digitThree == digitOne)
        var y = (digitThree == digitTwo)
        
        while(x || y)
        {
            digitThree = Int(arc4random_uniform(10))
            x = (digitThree == digitOne)
            y = (digitThree == digitTwo)
        }
    }

    func newRandomNumber()
    {
        digitOne = Int(arc4random_uniform(10))
        digitTwo = Int(arc4random_uniform(10))
        digitThree = Int(arc4random_uniform(10))
        while(digitTwo == digitOne)
        {
            digitTwo = Int(arc4random_uniform(10))
        }
        
        var x = (digitThree == digitOne)
        var y = (digitThree == digitTwo)
        
        while(x || y)
        {
            digitThree = Int(arc4random_uniform(10))
            x = (digitThree == digitOne)
            y = (digitThree == digitTwo)
        }
    }
    
    func calculate(digit1: Int, digit2: Int, digit3: Int) -> String
    {
        var output = ""
        var x = rightSpot(firstDigit: digit1, secondDigit: digit2, thirdDigit: digit3)
        var y = isPresent(firstDigit: digit1, secondDigit: digit2, thirdDigit: digit3)
        
        while (0 < x)
        {
            output += blackDot()
            x -= 1
        }
        
        while(0 < y)
        {
            output += whiteDot()
            y -= 1
        }
        numberOfGuesses += 1
        return output
    }
    
    //function that compares the three guesses to the SECRET digits
    
    func isPresent(firstDigit: Int?, secondDigit: Int?, thirdDigit: Int?) -> Int
    {
        var count = 0
        if((firstDigit == digitTwo) || (firstDigit == digitThree))
        {
            count += 1
        }
        if((secondDigit == digitOne) || (secondDigit == digitThree))
        {
            count += 1
        }
        if((thirdDigit == digitOne) || (thirdDigit == digitTwo))
        {
            count += 1
        }
        
        return count
        
    }
    
    func rightSpot(firstDigit: Int?, secondDigit: Int?, thirdDigit: Int?) -> Int
    {
        var count = 0
        if((firstDigit == digitOne))
        {
            count += 1
        }
        if((secondDigit == digitTwo))
        {
            count += 1
        }
        if((thirdDigit == digitThree))
        {
            count += 1
        }
        return count
    }
    
    //function that prints the black dots
    func blackDot() -> String
    {
        return("⚫️ ")
    }
    
    //function that prints white dots
    func whiteDot() -> String
    {
        return("⚪️ ")
    }

}
