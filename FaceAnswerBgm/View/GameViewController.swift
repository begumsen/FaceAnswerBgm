//
//  GameViewController.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    

    var cameraView : CameraView!
    var circularOverlayView: CircularOverlayView!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var rightAnswerView: UIView!
    @IBOutlet weak var leftAnswerView: UIView!
    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var leftAnswerLabel: UILabel!
    
    @IBOutlet weak var GameView: UIView!
    
    @IBOutlet weak var ScoreView: UIView!
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    var selectedCategory: String = ""
    var audioPlayer: AVAudioPlayer!
    lazy var presenter = GamePresenter(with:self, categorySelected: selectedCategory)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        presenter.gameStarted()
    }
    
    @IBAction func playAgainButtonClicked(_ sender: Any) {
        presenter.playAgain()
    }
    
    @IBAction func selectNewCategoryClicked(_ sender: Any) {
        presenter.selectNewCategory()
    }
    
    @IBAction func playAsNewUser(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let userNameViewController = storyBoard.instantiateViewController(withIdentifier: "UserNameViewController") as! UserNameViewController
        let navigationController = UINavigationController(rootViewController: userNameViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    func addCameraView()
    {
        cameraView = CameraView()
        cameraView.presenter = presenter
        GameView.addSubview(cameraView)
        cameraView.translatesAutoresizingMaskIntoConstraints = false

        // Calculate the dimensions based on the phone's width and height
        let cameraViewWidth: CGFloat = UIScreen.main.bounds.width - 40
        let cameraViewHeight: CGFloat = UIScreen.main.bounds.height * 0.5

        cameraView.bottomAnchor.constraint(equalTo: GameView.bottomAnchor).isActive = true
        cameraView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cameraView.widthAnchor.constraint(equalToConstant: cameraViewWidth).isActive = true
        cameraView.heightAnchor.constraint(equalToConstant: cameraViewHeight).isActive = true
        cameraView.beginSession()
        circularOverlayView = CircularOverlayView(frame: CGRect(x: 0, y: 0, width: cameraViewWidth * 0.8, height: cameraViewHeight * 0.8))
                circularOverlayView.center = GameView.center
                circularOverlayView.backgroundColor = .clear
                GameView.addSubview(circularOverlayView)

        
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

extension GameViewController: GameView {
   
    func adjustTheViews(scoreView: Bool, gameView: Bool, warningLabel: Bool) {
        self.warningLabel.isHidden = warningLabel
        self.GameView.isHidden = gameView
        self.ScoreView .isHidden = scoreView
    }
    
    func gameOver(finalScore: String) {
        finalScoreLabel.text = "Score: " + finalScore
    }
    
    func navigateToCategoryMenu() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CategoryMenuController") as! CategoryMenuViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func playSoundEffect(soundUrl: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error loading audio: \(error)")
        }
    }
    
    func changeRightAnswerView(color: UIColor) {
        rightAnswerView.backgroundColor = color
    }
    
    func changeLeftAnswerView(color: UIColor) {
        leftAnswerView.backgroundColor = color
    }
    
    func displayQuestion(question: String, rightAnswer: String, leftAnswer: String) {
        questionLabel.text = question
        rightAnswerLabel.text = rightAnswer
        leftAnswerLabel.text = leftAnswer
    }
    
    
    func updateTheScore(score: String) {
        scoreLabel.text = "Score: " + score
    }
    
    func updateTheTimer(timerLabel: String) {
        timeLabel.text = "Time Left: " + timerLabel
    }
    
}
