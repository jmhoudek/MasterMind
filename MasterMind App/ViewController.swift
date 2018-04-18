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
var attempts = 0
var currentPlayer = ""

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIPopoverPresentationControllerDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        selectTeam.delegate = self
        selectTeam.dataSource = self
        discardPicker.delegate = self
        discardPicker.dataSource = self
        maxGames.delegate = self
        maxGames.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        selectTeam.delegate = self
        selectTeam.dataSource = self
        discardPicker.delegate = self
        discardPicker.dataSource = self
        maxGames.delegate = self
        maxGames.dataSource = self
        
        newTeamText.delegate = self
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var selectTeam: UIPickerView!
    @IBOutlet weak var discardPicker: UIPickerView!
    @IBOutlet weak var maxGames: UIPickerView!
    
    @IBOutlet weak var newTeamText: UITextField!
    @IBOutlet weak var avgScoreText: UILabel!
    @IBOutlet weak var gamesPlayedText: UILabel!
    
    let amount = ["Select Amount", "20", "25", "30", "35", "40", "45", "50", "55", "60"]
    
    var toBeDiscarded = ""
    
    var gameAmount = 0
    
    @IBAction func createTeam(_ sender: Any)
    {
        if(newTeamText.isEqual(""))
        {
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
    
    @IBAction func discardTeam(_ sender: Any)
    {
        master.discardTeam(str: toBeDiscarded)
        selectTeam.delegate = self
        selectTeam.dataSource = self
        discardPicker.delegate = self
        discardPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if( pickerView == maxGames)
        {
            return amount[row]
        }
        else if ( pickerView == discardPicker )
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
        if( pickerView == maxGames )
        {
            return amount.count
        }
        else if ( pickerView == discardPicker )
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
        if( pickerView == maxGames )
        {
            if( row > 0 )
            {
                gameAmount = Int(amount[row])!
            }
        }
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
        }
    }
    
}


