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
    
    
    init( tname: String )
    {
        name = tname
        avg = 0
        games = 0
        
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
    
    // ********** Replace "MeetClass" in this function with your class's name *************
    // ********** Restore the recovered values into object's current values *************
    /**
     * Recover the previously archived MeetClass object
     * @param: fileName from which to recover the previously archived file
     */
    func restore(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Data {
            do {
                // *** Replace "MeetClass" on the next line with the name of the class to be persistent. ***
                let recoveredData = try PropertyListDecoder().decode(Team.self, from: recoveredDataCoded)
                os_log("Data successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** Replace all the assignment statements BELOW to "restore" all properties of the object ***
                name = recoveredData.name
                avg = recoveredData.avg
                games = recoveredData.games
                // *** Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover data", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover data", log: OSLog.default, type: .error)
        }
    }

}

