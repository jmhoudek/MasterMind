//
//  optionsViewController.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 1/9/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class optionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{

    
    @IBOutlet weak var gameSelect: UIPickerView!
    @IBOutlet weak var newTeam: UITextField!
    @IBOutlet weak var discardText: UITextField!
    
    
    
    let amount = ["20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"]
    var picker: UIPickerView!
    var activeTextField = 0
    var activeTF: UITextField!
    var activeValue = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        gameSelect.delegate = self
        gameSelect.dataSource = self
        
        discardText.delegate = self
        // Do any additional setup after loading the view.
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
        if(pickerView == gameSelect)
        {
            return amount[row]
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
        if(pickerView == gameSelect)
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
        var names = [String]()
        for x in 0..<master.teams.count
        {
            names.append(master.teams[x].name)
        }
    }
    
    @IBAction func discardTeam(_ sender: Any)
    {
        let temp = discardText.text
        master.discardTeam(str: temp!)
        discardText.text = ""
    }
    
    
    

}
