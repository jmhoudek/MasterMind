//
//  hallOfFameViewController.swift
//  MasterMind App
//
//  Created by STOCK, CHARLES on 12/21/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit

class hallOfFameViewController: UIViewController
{
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var fourth: UILabel!
    @IBOutlet weak var fifth: UILabel!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    @IBOutlet weak var firstAS: UILabel!
    @IBOutlet weak var secondAS: UILabel!
    @IBOutlet weak var thirdAS: UILabel!
    @IBOutlet weak var fourthAS: UILabel!
    @IBOutlet weak var fifthAS: UILabel!
    
    @IBOutlet weak var goldSilverBronze: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goldSilverBronze.image = UIImage(named: "Image2")
        clearLabels()
    }
    
    func clearLabels()
    {
        labelOne.isHidden = true
        labelTwo.isHidden = true
        labelThree.isHidden = true
        labelFour.isHidden = true
        labelFive.isHidden = true
        first.text = ""
        second.text = ""
        third.text = ""
        fourth.text = ""
        fifth.text = ""
        firstAS.text = ""
        secondAS.text = ""
        thirdAS.text = ""
        fourthAS.text = ""
        fifthAS.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        clearLabels()
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels()
    {
        if(master.hallOfFame.count > 0)
        {
            labelOne.isHidden = false
            firstAS.text = String(master.hallOfFame[0].avg)
            first.text = master.hallOfFame[0].name
            print(master.hallOfFame[0].name)
        }
        if(master.hallOfFame.count > 1)
        {
            labelTwo.isHidden = false
            secondAS.text = String(master.hallOfFame[1].avg)
            second.text = master.hallOfFame[1].name
        }
        if(master.hallOfFame.count > 2)
        {
            labelThree.isHidden = false
            thirdAS.text = String(master.hallOfFame[2].avg)
            third.text = master.hallOfFame[2].name
        }
        if(master.hallOfFame.count > 3)
        {
            labelFour.isHidden = false
            fourthAS.text = String(master.hallOfFame[3].avg)
            fourth.text = master.hallOfFame[3].name
        }
        if(master.hallOfFame.count > 4)
        {
            labelFive.isHidden = false
            fifthAS.text = String(master.hallOfFame[4].avg)
            fifth.text = master.hallOfFame[4].name
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
