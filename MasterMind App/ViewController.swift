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
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return teamSelect[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return teamSelect.count
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 1
    }
    
    
    
}


