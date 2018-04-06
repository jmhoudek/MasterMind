//
//  App.swift
//  MasterMind App
//
//  Created by HOUDEK, JUSTIN on 2/5/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class App
{
    var teams = [Team]()
    var teamSort = [Team]()
    var hallOfFame = [Team]()
    var x = 1
    
    init()
    {
        teams = []
        teamSort = []
        hallOfFame = []
    }
    
    func addTeam()
    {
        teams.append(Team(tname: "Team " + String(x)))
        x += 1
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
        teamSort = sortedArray
    }
    
    func gamesPlayedSort()
    {
        var sortedArray = teams
        var sortedAboveIndex = teams.count
        while (true)
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
        teamSort = sortedArray
    }
    
    func timeSort()
    {
        
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
}
