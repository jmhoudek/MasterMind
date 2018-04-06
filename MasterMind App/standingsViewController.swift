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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(master.teams.count > 0)
        {
            first.text = master.teams[0].name
        }
        if(master.teams.count > 1)
        {
            second.text = master.teams[1].name
        }
        if(master.teams.count > 2)
        {
            third.text = master.teams[2].name
        }
        if(master.teams.count > 3)
        {
            fourth.text = master.teams[3].name
        }
        if(master.teams.count > 4)
        {
            fifth.text = master.teams[4].name
        }
        if(master.teams.count > 5)
        {
            sixth.text = master.teams[5].name
        }
        if(master.teams.count > 6)
        {
            seventh.text = master.teams[6].name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
