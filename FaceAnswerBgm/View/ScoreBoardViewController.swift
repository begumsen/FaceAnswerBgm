//
//  ScoreBoardViewController.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    
    @IBOutlet weak var scoreBoardTableView: UITableView!
    
    lazy var presenter = ScoreBoardPresenter(with:self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreBoardTableView.delegate = self
        scoreBoardTableView.dataSource = self
        presenter.getScoreBoardData()  
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScoreBoardViewController: ScoreBoardView {
    func reloadTableView() {
        scoreBoardTableView.reloadData()
    }
}

extension ScoreBoardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.scoreBoardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreBoardCell", for: indexPath) as! ScoreTableViewCell
        if(presenter.scoreBoardList[indexPath.row].highlighted){
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .clear
        }
        cell.scoreLabel.text = "\(presenter.scoreBoardList[indexPath.row].score ?? 0)"
        cell.userNameLabel.text = presenter.scoreBoardList[indexPath.row].username
        return cell
        
    }
    
    
}
