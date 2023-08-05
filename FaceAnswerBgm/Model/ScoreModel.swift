//
//  ScoreModel.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//

import Foundation
import CoreData

@objc(ScoreModel)

class ScoreModel: NSManagedObject {
    @NSManaged var score: NSNumber!
    @NSManaged var username: String!
    @NSManaged var date: Date!
}
