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
var teamSelect = [String]()
var guess = ""
var attempts = 0

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIPopoverPresentationControllerDelegate
{

    
    @IBOutlet weak var millisecondCount: UILabel!
    @IBOutlet weak var select: UIPickerView!
    
    @IBOutlet weak var startButton: UIButton!
    var timeMilli = 0.0
    var timeSecond = 0.0
    var timeMinute = 0.0
    var timeMilliTen = 0.0
    var timeSecondTen = 0.0
    var timeMinuteTen = 0.0
    var timer = Timer()
    
    
    
    @IBAction func startTimer(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
    
    
    
    
    @IBAction func stopTimer(_ sender: AnyObject)
    {
        timer.invalidate()
        startButton.isEnabled = false
    }
    
    @IBAction func resetTimer(_ sender: AnyObject)
    {
        timer.invalidate()
        timeMilli = 0
        timeSecond = 0
        timeMinute = 0
        timeMilliTen = 0
        timeSecondTen = 0
        timeSecondTen = 0
        millisecondCount.text = "00 : 00 : 00"
        startButton.isEnabled = true
    }
    
    @objc func action()
    {
        timeMilli += 01
        timeSecond += 0.01
        timeMinute += (1/6000.0)
        timeMilliTen += 0.1
        timeSecondTen += 0.001
        timeMinuteTen += (1/60000.0)
       
        if (timeMilli >= 10){
            timeMilli = 0
        }
        if (timeSecond >= 10){
            timeSecond = 0
        }
        if (timeMinute >= 10){
            timeMinute = 0
        }
        if (timeMilliTen >= 10){
            timeMilliTen = 0
        }
        if (timeSecondTen >= 6){
            timeSecondTen = 0
        }
        millisecondCount.text = "\(Int(timeMinuteTen))\(Int(timeMinute)) : \(Int(timeSecondTen))\(Int(timeSecond)) : \(Int(timeMilliTen))\(Int(timeMilli))"
    
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        select.delegate = self
        select.dataSource = self
        gameSelect.delegate = self
        gameSelect.dataSource = self
        discardText.delegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let amount = ["20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"]
    
    @IBOutlet weak var newTeam: UITextField!
    @IBOutlet weak var discardText: UITextField!
    @IBOutlet weak var gameSelect: UIPickerView!
    
    var picker: UIPickerView!
    var activeTextField = 0
    var activeTF: UITextField!
    var activeValue = ""

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if(pickerView == gameSelect)
        {
            return amount[row]
        }
        else if(pickerView == select)
        {
            return teamSelect[row]
        }
        else
        {
            switch activeTextField
            {
            case 1:
                return teamSelect[row]
            default:
                return ""
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if(pickerView == gameSelect)
        {
            return amount.count
        }
        else if(pickerView == select)
        {
            return teamSelect.count
        }
        else
        {
            switch activeTextField
            {
            case 1:
                return teamSelect.count
            default:
                return 0
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == gameSelect || pickerView == select)
        {
            
        }
        else
        {
            switch activeTextField
            {
            case 1:
                activeValue = teamSelect[row]
            default:
                activeValue = ""
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        switch textField
        {
        case discardText:
            activeTextField = 1
        default:
            activeTextField = 0
        }
        
        activeTF = textField
        
        self.pickUpValue(textField: textField)
    }
    
    func pickUpValue(textField: UITextField)
    {
        picker = UIPickerView(frame:CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: 216)))
        
        picker.delegate = self
        picker.dataSource = self
        
        if let currentValue = textField.text
        {
            var row: Int?
            
            switch activeTextField
            {
            case 1:
                row = teamSelect.index(of: currentValue)
            default:
                row = nil
            }
            
            if row != nil
            {
                picker.selectRow(row!, inComponent: 0, animated: true)
            }
        }
        picker.backgroundColor = UIColor.white
        textField.inputView = self.picker
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor.darkGray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneClick()
    {
        activeTF.text = activeValue
        activeTF.resignFirstResponder()
    }
    
    @objc func cancelClick()
    {
        activeTF.resignFirstResponder()
    }
    
    @IBAction func createTeam(_ sender: Any)
    {
        if(newTeam.isEqual(""))
        {
            return
        }
        else
        {
            let text = newTeam.text!
            master.addTeam(str: text)
            teamSelect.append(newTeam.text!)
        }
        newTeam.text = ""
        loadView()
        print(teamSelect[0])
    }
    
    
    @IBAction func DiscardTeam(_ sender: Any)
    {
        let temp = discardText.text
        master.discardTeam(str: temp!)
        discardText.text = ""
    }
    
}


