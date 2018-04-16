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
