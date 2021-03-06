//
//  gameViewController.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 3/13/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class gameViewController: UIViewController
{
    
    @IBOutlet weak var numberUnderline: UIImageView!
    @IBOutlet weak var guessString: UITextField!
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    @IBOutlet weak var num4: UILabel!
    @IBOutlet weak var num5: UILabel!
    @IBOutlet weak var num6: UILabel!
    @IBOutlet weak var num7: UILabel!
    @IBOutlet weak var num8: UILabel!
    @IBOutlet weak var num9: UILabel!
    @IBOutlet weak var num10: UILabel!
    @IBOutlet weak var num11: UILabel!
    @IBOutlet weak var num12: UILabel!
    @IBOutlet weak var num13: UILabel!
    @IBOutlet weak var num14: UILabel!
    @IBOutlet weak var num15: UILabel!
    @IBOutlet weak var num16: UILabel!
    @IBOutlet weak var num17: UILabel!
    @IBOutlet weak var num18: UILabel!
    @IBOutlet weak var num19: UILabel!
    @IBOutlet weak var num20: UILabel!
    @IBOutlet weak var num21: UILabel!
    @IBOutlet weak var num22: UILabel!
    @IBOutlet weak var num23: UILabel!
    @IBOutlet weak var num24: UILabel!
    
    @IBOutlet weak var dots1: UILabel!
    @IBOutlet weak var dots2: UILabel!
    @IBOutlet weak var dots3: UILabel!
    @IBOutlet weak var dots4: UILabel!
    @IBOutlet weak var dots5: UILabel!
    @IBOutlet weak var dots6: UILabel!
    @IBOutlet weak var dots7: UILabel!
    @IBOutlet weak var dots8: UILabel!
    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var enter: UIButton!
    
    var singleOpenCount = 0
    var attempts = 0
    var tens = 0
    var ones = 0
    
    @IBOutlet weak var teamPlaying: UILabel!
    
    var shouldEnd = false
    var didLose = false
    
    var digiOne = 0
    var digiTwo = 0
    var digiThree = 0
    var guess = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        newGame.newRandomNumber()
        startTimer()
        timerCount = 0
        tenCount = 0
        teamPlaying.text = master.currentPlayer
        attempts = 0
        one.isEnabled = true
        two.isEnabled = true
        three.isEnabled = true
        four.isEnabled = true
        five.isEnabled = true
        six.isEnabled = true
        seven.isEnabled = true
        eight.isEnabled = true
        nine.isEnabled = true
        zero.isEnabled = true
        delete.isEnabled = true
        enter.isEnabled = true
        singleOpenCount = 0
        counterLabel.text = "0:00"
        master.didStart = true
        
        if(master.timerOn)
        {
            counterLabel.isHidden = false
        }
        else
        {
            counterLabel.isHidden = true
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var timerCount = 0
    var tenCount = 0
    var timer = Timer()
    @IBOutlet weak var counterLabel: UILabel!
    
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameViewController.counter), userInfo: nil, repeats: true)
    }
    
    func stopTimer()
    {
        timer.invalidate()
        tens = tenCount
        ones = timerCount
    }
    
    @objc func counter()
    {
        timerCount += 1
        if (timerCount == 60)
        {
            timerCount = 0
            tenCount += 1
        }
        if (timerCount < 10)
        {
            counterLabel.text = String(tenCount) + ":0" + String(timerCount)
        }
        else
        {
            counterLabel.text = String(tenCount) + ":" + String(timerCount)
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 3
    }
    
    @IBAction func addZero(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "0"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 0
            }
            if( guess.count == 2 )
            {
                digiTwo = 0
            }
            if( guess.count == 3 )
            {
                digiThree = 0
            }
        }
    }
    
    @IBAction func addOne(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "1"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 1
            }
            if( guess.count == 2 )
            {
                digiTwo = 1
            }
            if( guess.count == 3 )
            {
                digiThree = 1
            }
        }
    }
    
    @IBAction func addTwo(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "2"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 2
            }
            if( guess.count == 2 )
            {
                digiTwo = 2
            }
            if( guess.count == 3 )
            {
                digiThree = 2
            }
        }
    }
    
    @IBAction func addThree(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "3"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 3
            }
            if( guess.count == 2 )
            {
                digiTwo = 3
            }
            if( guess.count == 3 )
            {
                digiThree = 3
            }
        }
    }
    
    @IBAction func addFour(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "4"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 4
            }
            if( guess.count == 2 )
            {
                digiTwo = 4
            }
            if( guess.count == 3 )
            {
                digiThree = 4
            }
        }
    }
    
    @IBAction func addFive(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "5"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 5
            }
            if( guess.count == 2 )
            {
                digiTwo = 5
            }
            if( guess.count == 3 )
            {
                digiThree = 5
            }
        }
    }
    
    @IBAction func addSix(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "6"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 6
            }
            if( guess.count == 2 )
            {
                digiTwo = 6
            }
            if( guess.count == 3 )
            {
                digiThree = 6
            }
        }
        
    }
    
    @IBAction func addSeven(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "7"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 7
            }
            if( guess.count == 2 )
            {
                digiTwo = 7
            }
            if( guess.count == 3 )
            {
                digiThree = 7
            }
        }
    }
    
    @IBAction func addEight(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "8"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 8
            }
            if( guess.count == 2 )
            {
                digiTwo = 8
            }
            if( guess.count == 3 )
            {
                digiThree = 8
            }
        }
        
    }
    
    @IBAction func addNine(_ sender: Any)
    {
        if( guess.count < 3 )
        {
            guess = guess + "9"
            guessString.text = guess
            if( guess.count == 1 )
            {
                digiOne = 9
            }
            if( guess.count == 2 )
            {
                digiTwo = 9
            }
            if( guess.count == 3 )
            {
                digiThree = 9
            }
        }
    }
    
    @IBAction func deleteNum(_ sender: Any)
    {
        if(guess.count > 0)
        {
            if(guess.count == 1)
            {
                guess = ""
                guessString.text = guess
            }
            else
            {
                let str = Array(guess)
                guess = ""
                for x in 0 ..< str.count - 1
                {
                    guess += String(str[x])
                }
                guessString.text = guess
            }
        }
    }
    
    @IBAction func enterNum(_ sender: Any)
    {
        if(guess.count == 3)
        {
            attempts += 1
            updateLabels()
            dots()
            guessString.text = ""
            guess = ""
            isDone()
        }
    }
    
    func isDone()
    {
        if(shouldEnd)
        {
            stopTimer()
            shouldEnd = false
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            five.isEnabled = false
            six.isEnabled = false
            seven.isEnabled = false
            eight.isEnabled = false
            nine.isEnabled = false
            zero.isEnabled = false
            delete.isEnabled = false
            enter.isEnabled = false
            
            let alert = UIAlertController(title: "Congratulations!", message: "You finished in " + String(attempts) + " attempts", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler:{ (action) in
                var index = 0
                for x in master.teams
                {
                    if (master.currentPlayer.isEqual(x.name))
                    {
                        let totalTime = ((self.tens*60) + self.ones)
                        master.teams[index].update(newScore: Double(self.attempts), newTime: Double(totalTime))
                        break
                    }
                    index += 1
                }
                self.performSegue(withIdentifier: "toHome", sender: nil)
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else if(didLose)
        {
            stopTimer()
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            five.isEnabled = false
            six.isEnabled = false
            seven.isEnabled = false
            eight.isEnabled = false
            nine.isEnabled = false
            zero.isEnabled = false
            delete.isEnabled = false
            enter.isEnabled = false
            
            let alert = UIAlertController(title: "Oh No..", message: "You didn't finish within 8 guesses", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "To the trash", style: UIAlertActionStyle.default, handler:{ (action) in
                var index = 0
                for x in master.teams
                {
                    if (master.currentPlayer.isEqual(x.name))
                    {
                        master.teams[index].update(newScore: 1000.0, newTime: 1000.0)
                        break
                    }
                    index += 1
                }
                master.discardTeam(str: master.currentPlayer)
                self.performSegue(withIdentifier: "toHome", sender: nil)
                alert.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Discard Attempt", style: UIAlertActionStyle.default, handler:{ (action) in
                self.performSegue(withIdentifier: "toHome", sender: nil)
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else if(singleOpenCount == 4)
        {
            stopTimer()
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            five.isEnabled = false
            six.isEnabled = false
            seven.isEnabled = false
            eight.isEnabled = false
            nine.isEnabled = false
            zero.isEnabled = false
            delete.isEnabled = false
            enter.isEnabled = false
            
            let alert = UIAlertController(title: "Wow!", message: "It's your luckiest unlucky day", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler:{ (action) in
                self.performSegue(withIdentifier: "toHome", sender: nil)
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateLabels()
    {
        if( attempts == 1 )
        {
            num1.text = String(digiOne)
            num2.text = String(digiTwo)
            num3.text = String(digiThree)
        }
        if( attempts == 2 )
        {
            num4.text = String(digiOne)
            num5.text = String(digiTwo)
            num6.text = String(digiThree)
        }
        if( attempts == 3 )
        {
            num7.text = String(digiOne)
            num8.text = String(digiTwo)
            num9.text = String(digiThree)
        }
        if( attempts == 4 )
        {
            num10.text = String(digiOne)
            num11.text = String(digiTwo)
            num12.text = String(digiThree)
        }
        if( attempts == 5 )
        {
            num13.text = String(digiOne)
            num14.text = String(digiTwo)
            num15.text = String(digiThree)
        }
        if( attempts == 6 )
        {
            num16.text = String(digiOne)
            num17.text = String(digiTwo)
            num18.text = String(digiThree)
        }
        if( attempts == 7 )
        {
            num19.text = String(digiOne)
            num20.text = String(digiTwo)
            num21.text = String(digiThree)
        }
        if( attempts == 8 )
        {
            num22.text = String(digiOne)
            num23.text = String(digiTwo)
            num24.text = String(digiThree)
        }
    }
    
    func dots()
    {
        if( attempts == 1 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots1.text = dotString
            if(dots1.text == "⭕ ")
            {
                singleOpenCount += 1
            }
            if(dots1.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 2 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots2.text = dotString
            if(dots2.text == "⭕ ")
            {
                singleOpenCount += 1
            }
            if(dots2.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 3 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots3.text = dotString
            if(dots3.text == "⭕ ")
            {
                singleOpenCount += 1
            }
            if(dots3.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 4 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots4.text = dotString
            if(dots4.text == "⭕ ")
            {
                singleOpenCount += 1
            }
            if(dots4.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 5 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots5.text = dotString
            singleOpenCount = 0
            if(dots5.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 6 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots6.text = dotString
            singleOpenCount = 0
            if(dots6.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 7 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots7.text = dotString
            singleOpenCount = 0
            if(dots7.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
        }
        if( attempts == 8 )
        {
            let dotString = newGame.calculate(digit1: digiOne, digit2: digiTwo, digit3: digiThree)
            dots8.text = dotString
            singleOpenCount = 0
            if(dots8.text == "🔴 🔴 🔴 ")
            {
                shouldEnd = true
            }
            else
            {
                didLose = true
            }
        }
    }

}
