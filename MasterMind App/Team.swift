//
//  Team.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 2/5/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit
import Foundation
import os.log

class Team: NSObject, Codable
{
    var name: String
    var avg: Double
    var games: Int
    var avgTime: Double
    
    init( tname: String )
    {
        name = tname
        avg = 0
        games = 0
        avgTime = 0.0
    }
    
    func update( newScore: Double, newTime: Double)
    {
        games = games + 1
        let newAvg = (avg * Double(games - 1) + Double(newScore)) / Double(games)
        avg = newAvg
        let tempTime = (avgTime * Double(games - 1) + newTime) / Double(games)
        avgTime = tempTime
    }
}

