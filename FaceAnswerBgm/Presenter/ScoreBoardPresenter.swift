//
//  ScoreBoardPresenter.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//

import Foundation
import UIKit

protocol ScoreBoardView: AnyObject {
    func reloadTableView()
}

class ScoreBoardPresenter {
    
    weak var view: ScoreBoardView?
    var scoreBoardList: [ScoreCellModel]
    private let dataSource = ScoreBoardDataSource()
    
    init(with view: ScoreBoardView) {
        self.view = view
        scoreBoardList = dataSource.fecthScoreBoardData()
    }
    
    func getScoreBoardData() {
        scoreBoardList.sort { $0.score > $1.score}
        let userScores = scoreBoardList.filter { $0.username == UserModel.shared.userName }
        let sortedUserScores = userScores.sorted { $0.date > $1.date }
        if let userScore = sortedUserScores.first {
            if let lastIndexForUser = scoreBoardList.lastIndex(where: { $0.username == userScore.username && $0.date == userScore.date }) {
                print(lastIndexForUser)
                scoreBoardList[lastIndexForUser].highlighted = true
                view?.reloadTableView()
            }
        }
 
    }

}
