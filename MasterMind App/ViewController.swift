//
//  ViewController.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 12/11/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit

var master = App()
var newGame = Game()
var teamNames = [String]()
var currentPlayer = ""
var gameAmount = 40
var timerOn = true

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIPopoverPresentationControllerDelegate
{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        selectTeam.delegate = self
        selectTeam.dataSource = self
        discardPicker.delegate = self
        discardPicker.dataSource = self
        startButton.isEnabled = false
        newTeamText.delegate = self
        maxGamesText.text = String(gameAmount)
        self.selectTeam.selectRow(0, inComponent: 0, animated: false)
        self.discardPicker.selectRow(0, inComponent: 0, animated: false)
        gamesPlayedText.text = ""
        avgScoreText.text = ""
        switchOn.setOn(timerOn, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        selectTeam.delegate = self
        selectTeam.dataSource = self
        discardPicker.delegate = self
        discardPicker.dataSource = self
        startButton.isEnabled = false
        newTeamText.delegate = self
        maxGamesText.text = String(gameAmount)
        self.selectTeam.selectRow(0, inComponent: 0, animated: false)
        self.discardPicker.selectRow(0, inComponent: 0, animated: false)
        gamesPlayedText.text = ""
        avgScoreText.text = ""
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var switchOn: UISwitch!
    
    @IBAction func timerSwitch(_ sender: Any)
    {
        if(timerOn)
        {
            timerOn = false
        }
        else
        {
            timerOn = true
        }
    }
    
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var selectTeam: UIPickerView!
    @IBOutlet weak var discardPicker: UIPickerView!
    @IBOutlet weak var maxGamesText: UITextField!
    
    @IBOutlet weak var newTeamText: UITextField!
    @IBOutlet weak var avgScoreText: UILabel!
    @IBOutlet weak var gamesPlayedText: UILabel!
    
    let amount = ["Select Amount:", "20", "25", "30", "35", "40", "45", "50", "55", "60"]
    
    var toBeDiscarded = ""
    
    @IBAction func changeMaxGames(_ sender: Any)
    {
        let num = Int(maxGamesText.text!)
        
        if (num != nil)
        {
            gameAmount = Int(maxGamesText.text!)!
            self.view.endEditing(true)
        }
        else
        {
            let alert = UIAlertController(title: "Stop!", message: "Please enter a number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler:{ (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func createTeam(_ sender: Any)
    {
        if( master.teams.count < 7)
        {
            if((newTeamText.text?.isEqual(""))! || (newTeamText.text?.isEqual(" "))! || (newTeamText.text?.isEqual("  "))! || (newTeamText.text?.isEqual("   "))!)
            {
                let alert = UIAlertController(title: "Stop!", message: "Enter a team name", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler:{ (action) in
                    alert.dismiss(animated: true, completion: nil)
                }))
                
                self.present(alert, animated: true, completion: nil)
                return
            }
            else
            {
                let text = newTeamText.text!
                master.addTeam(str: text)
                teamNames.append(text)
            }
            newTeamText.text = ""
            selectTeam.delegate = self
            selectTeam.dataSource = self
            discardPicker.delegate = self
            discardPicker.dataSource = self
        }
        else
        {
            newTeamText.text = ""
            let alert = UIAlertController(title: "Stop!", message: "You cannot create more than 7 teams", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler:{ (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        self.view.endEditing(true)
    }
    
    @IBAction func discardTeam(_ sender: Any)
    {
        master.discardTeam(str: toBeDiscarded)
        selectTeam.delegate = self
        selectTeam.dataSource = self
        discardPicker.delegate = self
        discardPicker.dataSource = self
        self.selectTeam.selectRow(0, inComponent: 0, animated: true)
        self.discardPicker.selectRow(0, inComponent: 0, animated: true)
        avgScoreText.text = ""
        gamesPlayedText.text = ""
    }
    
    @IBAction func gameStart(_ sender: Any)
    {
        if(Int(gamesPlayedText.text!)! < gameAmount)
        {
            self.performSegue(withIdentifier: "toGame", sender: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Sorry", message: "You have already played the max amount of games!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler:{ (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if ( pickerView == discardPicker )
        {
            if( row == 0 )
            {
                return "Select Team:"
            }
            else
            {
                return teamNames[row - 1]
            }
        }
        else
        {
            if( row == 0 )
            {
                return "Select Team:"
            }
            else
            {
                return teamNames[row - 1]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if ( pickerView == discardPicker )
        {
            return teamNames.count + 1
        }
        else
        {
            return teamNames.count + 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if( pickerView == discardPicker )
        {
            if( row > 0 )
            {
                toBeDiscarded = teamNames[row - 1]
            }
        }
        else
        {
            if( row > 0 )
            {
                startButton.isEnabled = true
                currentPlayer = teamNames[row - 1]
                var index = 0
                for x in master.teams
                {
                    if (teamNames[row - 1].isEqual(x.name))
                    {
                        avgScoreText.text = String(master.teams[index].avg)
                        gamesPlayedText.text = String(master.teams[index].games)
                        break
                    }
                    index += 1
                }
            }
            else
            {
                startButton.isEnabled = false
                avgScoreText.text = ""
                gamesPlayedText.text = ""
                currentPlayer = ""
            }
        }
    }
    
}


