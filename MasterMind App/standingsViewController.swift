//
//  standingsViewController.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 2/6/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class standingsViewController: UIViewController
{
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var fourth: UILabel!
    @IBOutlet weak var fifth: UILabel!
    @IBOutlet weak var sixth: UILabel!
    @IBOutlet weak var seventh: UILabel!
    
    @IBOutlet weak var firstAS: UILabel!
    @IBOutlet weak var secondAS: UILabel!
    @IBOutlet weak var thirdAS: UILabel!
    @IBOutlet weak var fourthAS: UILabel!
    @IBOutlet weak var fifthAS: UILabel!
    @IBOutlet weak var sixthAS: UILabel!
    @IBOutlet weak var seventhAS: UILabel!
    
    @IBOutlet weak var firstGP: UILabel!
    @IBOutlet weak var secondGP: UILabel!
    @IBOutlet weak var thirdGP: UILabel!
    @IBOutlet weak var fourthGP: UILabel!
    @IBOutlet weak var fifthGP: UILabel!
    @IBOutlet weak var sixthGP: UILabel!
    @IBOutlet weak var seventhGP: UILabel!
    
    @IBOutlet weak var firstAT: UILabel!
    @IBOutlet weak var secondAT: UILabel!
    @IBOutlet weak var thirdAT: UILabel!
    @IBOutlet weak var fourthAT: UILabel!
    @IBOutlet weak var fifthAT: UILabel!
    @IBOutlet weak var sixthAT: UILabel!
    @IBOutlet weak var seventhAT: UILabel!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearLabels()
        updateLables()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        master.avgSort()
        clearLabels()
        updateLables()
    }
    
    func clearLabels()
    {
        labelOne.isHidden = true
        labelTwo.isHidden = true
        labelThree.isHidden = true
        labelFour.isHidden = true
        labelFive.isHidden = true
        labelSix.isHidden = true
        labelSeven.isHidden = true
        first.text = ""
        second.text = ""
        third.text = ""
        fourth.text = ""
        fifth.text = ""
        sixth.text = ""
        seventh.text = ""
        firstGP.text = ""
        secondGP.text = ""
        thirdGP.text = ""
        fourthGP.text = ""
        fifthGP.text = ""
        sixthGP.text = ""
        seventhGP.text = ""
        firstAS.text = ""
        secondAS.text = ""
        thirdAS.text = ""
        fourthAS.text = ""
        fifthAS.text = ""
        sixthAS.text = ""
        seventhAS.text = ""
        firstAT.text = ""
        secondAT.text = ""
        thirdAT.text = ""
        fourthAT.text = ""
        fifthAT.text = ""
        sixthAT.text = ""
        seventhAT.text = ""
    }
    
    func updateLables()
    {
        if(master.teamSort.count > 0)
        {
            labelOne.isHidden = false
            first.text = master.teamSort[0].name
            firstGP.text = String(master.teamSort[0].games)
            firstAS.text = String(Double(Int(master.teamSort[0].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[0].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                firstAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                firstAT.text = String(tens) + ":" + String(ones)
            }
            
        }
        if(master.teamSort.count > 1)
        {
            labelTwo.isHidden = false
            second.text = master.teamSort[1].name
            secondGP.text = String(master.teamSort[1].games)
            secondAS.text = String(Double(Int(master.teamSort[1].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[1].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                secondAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                secondAT.text = String(tens) + ":" + String(ones)
            }
        }
        if(master.teamSort.count > 2)
        {
            labelThree.isHidden = false
            third.text = master.teamSort[2].name
            thirdGP.text = String(master.teamSort[2].games)
            thirdAS.text = String(Double(Int(master.teamSort[2].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[2].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                thirdAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                thirdAT.text = String(tens) + ":" + String(ones)
            }
        }
        if(master.teamSort.count > 3)
        {
            labelFour.isHidden = false
            fourth.text = master.teamSort[3].name
            fourthGP.text = String(master.teamSort[3].games)
            fourthAS.text = String(Double(Int(master.teamSort[3].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[3].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                fourthAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                fourthAT.text = String(tens) + ":" + String(ones)
            }
        }
        if(master.teamSort.count > 4)
        {
            labelFive.isHidden = false
            fifth.text = master.teamSort[4].name
            fifthGP.text = String(master.teamSort[4].games)
            fifthAS.text = String(Double(Int(master.teamSort[4].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[4].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                fifthAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                fifthAT.text = String(tens) + ":" + String(ones)
            }
        }
        if(master.teamSort.count > 5)
        {
            labelSix.isHidden = false
            sixth.text = master.teamSort[5].name
            sixthGP.text = String(master.teamSort[5].games)
            sixthAS.text = String(Double(Int(master.teamSort[5].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[5].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                sixthAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                sixthAT.text = String(tens) + ":" + String(ones)
            }
        }
        if(master.teamSort.count > 6)
        {
            labelSeven.isHidden = false
            seventh.text = master.teamSort[6].name
            seventhGP.text = String(master.teamSort[6].games)
            seventhAS.text = String(Double(Int(master.teamSort[6].avg * 100.0 + 0.5)) / 100.0)
            let teamTime = Int(master.teamSort[6].avgTime + 0.5)
            let ones = teamTime % 60
            let tens = teamTime / 60
            if(ones < 10)
            {
                seventhAT.text = String(tens) + ":0" + String(ones)
            }
            else
            {
                seventhAT.text = String(tens) + ":" + String(ones)
            }
        }
    }
    
    @IBAction func AvgScoreSort(_ sender: Any)
    {
        master.avgSort()
        updateLables()
    }
    
    @IBAction func gamesPlayedSort(_ sender: Any)
    {
        master.gamesPlayedSort()
        updateLables()
    }
    
    @IBAction func timeSort(_ sender: Any)
    {
        master.timeSort()
        updateLables()
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
