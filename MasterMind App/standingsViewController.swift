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
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        first.text = ""
        second.text = ""
        third.text = ""
        fourth.text = ""
        fifth.text = ""
        sixth.text = ""
        seventh.text = ""
        updateLables()
    }
    func updateLables()
    {
        if(master.teamSort.count > 0)
        {
            first.text = master.teamSort[0].name
        }
        if(master.teamSort.count > 1)
        {
            second.text = master.teamSort[1].name
        }
        if(master.teamSort.count > 2)
        {
            third.text = master.teamSort[2].name
        }
        if(master.teamSort.count > 3)
        {
            fourth.text = master.teamSort[3].name
        }
        if(master.teamSort.count > 4)
        {
            fifth.text = master.teamSort[4].name
        }
        if(master.teamSort.count > 5)
        {
            sixth.text = master.teamSort[5].name
        }
        if(master.teamSort.count > 6)
        {
            seventh.text = master.teamSort[6].name
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
