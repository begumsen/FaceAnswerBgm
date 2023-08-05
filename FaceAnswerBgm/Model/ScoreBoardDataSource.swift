//
//  ScoreBoardDataSource.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//

import Foundation
import CoreData
import UIKit

class ScoreBoardDataSource {
    
    var scoreList = [ScoreCellModel]()
    
    func saveNewScore(username: String, score: Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ScoreModel", in: context)
        let newScoreModel = ScoreModel(entity: entity!, insertInto: context)
        newScoreModel.score = score as NSNumber
        newScoreModel.username = username
        newScoreModel.date  = Date()
        do
        {
           try context.save()
        }
        catch
        {
            print("context save error")
        }
    }
    
    func fecthScoreBoardData() -> [ScoreCellModel] {
        scoreList.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScoreModel")
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results
                {
                    let scoreModel = result as! ScoreModel
                let scoreCellModel = ScoreCellModel(username: scoreModel.username, score: (scoreModel.score as! Int), highlighted: false, date: scoreModel.date)
                    scoreList.append(scoreCellModel)
                }
            }
        catch {
            print("Fetch Failed")
        }
        return scoreList
    }
    
}
