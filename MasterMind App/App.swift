//
//  App.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 2/5/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit
import Foundation
import os.log
var keepHere = "yeet"

class App: NSObject, Codable
{
    var teams = [Team]()
    var teamSort = [Team]()
    var hallOfFame = [Team]()
    var timerOn = true
    var currentPlayer = ""
    var gameAmount = 40
    var didStart = false
    
    override init()
    {
        teams = []
        teamSort = []
        hallOfFame = []
        
        
    }
    
    func addTeam(str: String)
    {
        teams.append(Team(tname: str))
        teamSort.append(Team(tname: str))
        
    }
    
    func discardTeam(str: String)
    {
        var index = 0
        var index2 = 0
        for x in teams
        {
            if (str.isEqual(x.name))
            {
                checkHallOfFame(team: teams[index])
                teams.remove(at: index)
                break
            }
            index += 1
        }
        for x in teamSort
        {
            if (str.isEqual(x.name))
            {
                teamSort.remove(at: index2)
                break
                
            }
            index2 += 1
        }
    }
    
    func hofSort()
    {
        var sortedArray = hallOfFame
        var sortedAboveIndex = hallOfFame.count
        while (true)
        {
            for i in 1..<sortedAboveIndex
            {
                if( sortedArray[i-1].avg > sortedArray[i].avg)
                {
                    let x = sortedArray[i]
                    sortedArray[i] = sortedArray[i-1]
                    sortedArray[i-1] = x
                    
                }
            }
            sortedAboveIndex -= 1
            if(sortedAboveIndex == 1)
            {
                break
            }
        }
        hallOfFame = sortedArray
    }
    
    func avgSort()
    {
        var sortedArray = teams
        var sortedAboveIndex = teams.count
        if(teams.count > 1)
        {
            while(true)
            {
                for i in 1..<sortedAboveIndex
                {
                    if( sortedArray[i-1].avg > sortedArray[i].avg)
                    {
                        let x = sortedArray[i]
                        sortedArray[i] = sortedArray[i-1]
                        sortedArray[i-1] = x
                    }
                }
                sortedAboveIndex -= 1
                if(sortedAboveIndex == 1)
                {
                    break
                }
            }
        }
        teamSort = sortedArray
    }
    
    func gamesPlayedSort()
    {
        var sortedArray = teams
        var sortedAboveIndex = teams.count
        if(teams.count > 1)
        {
            while(true)
            {
                for i in 1..<sortedAboveIndex
                {
                    if( sortedArray[i-1].games < sortedArray[i].games)
                    {
                        let x = sortedArray[i]
                        sortedArray[i] = sortedArray[i-1]
                        sortedArray[i-1] = x
                    }
                }
                sortedAboveIndex -= 1
                if(sortedAboveIndex == 1)
                {
                    break
                }
            }
        }
        teamSort = sortedArray
    }
    
    func timeSort()
    {
        var sortedArray = teams
        var sortedAboveIndex = teams.count
        if(teams.count > 1)
        {
            while(true)
            {
                for i in 1..<sortedAboveIndex
                {
                    if( sortedArray[i-1].avgTime > sortedArray[i].avgTime)
                    {
                        let x = sortedArray[i]
                        sortedArray[i] = sortedArray[i-1]
                        sortedArray[i-1] = x
                    }
                }
                sortedAboveIndex -= 1
                if(sortedAboveIndex == 1)
                {
                    break
                }
            }
        }
        teamSort = sortedArray
    }
    
    func printArray(arr: Array<Team>)
    {
        for x in arr
        {
            print(x.name)
        }
    }
    
    func checkHallOfFame(team: Team)
    {
        var copy = hallOfFame
        if(team.games >= 20)
        {
            let x = hallOfFame.count
            
            if(x == 0)
            {
                hallOfFame.append(team)
            }
            
            if(x < 5 && x > 0)
            {
                hallOfFame.append(team)
                hofSort()
            }
                
            else
            {
                for i in 0..<x
                {
                    if( team.avg < self.hallOfFame[i].avg)
                    {
                        for y in (i+1)..<x
                        {
                            hallOfFame[y] = copy[y-1]
                        }
                        hallOfFame[i] = team
                        return
                    }
                }
            }
        }
    }
    
    func archive(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            let encodedData = try PropertyListEncoder().encode(self)
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(encodedData, toFile: archiveURL.path)
            if isSuccessfulSave {
                os_log("Data successfully saved to file.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save data...", log: OSLog.default, type: .error)
            }
        } catch {
            os_log("Failed to save data...", log: OSLog.default, type: .error)
        }
    }
   
    func restore(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Data {
            do {
                // *** Replace "MeetClass" on the next line with the name of the class to be persistent. ***
                let recoveredData = try PropertyListDecoder().decode(App.self, from: recoveredDataCoded)
                os_log("Data successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** Replace all the assignment statements BELOW to "restore" all properties of the object ***
                 teams = recoveredData.teams
                 hallOfFame = recoveredData.hallOfFame
                 timerOn = recoveredData.timerOn
                 gameAmount = recoveredData.gameAmount
                // *** Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover data", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover data", log: OSLog.default, type: .error)
        }
    }
}
