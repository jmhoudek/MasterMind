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
    
    @IBOutlet weak var goldSilverBronze: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(master.hallOfFame.count > 0)
        {
            first.text = master.hallOfFame[0].name
        }
        if(master.hallOfFame.count > 1)
        {
            second.text = master.hallOfFame[1].name
        }
        if(master.hallOfFame.count > 2)
        {
            third.text = master.hallOfFame[2].name
        }
        if(master.hallOfFame.count > 3)
        {
            fourth.text = master.hallOfFame[3].name
        }
        if(master.hallOfFame.count > 4)
        {
            fifth.text = master.hallOfFame[4].name
        }

        // Do any additional setup after loading the view.
        self.goldSilverBronze.image = UIImage(named: "Image2")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
