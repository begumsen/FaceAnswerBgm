//
//  GamePresenter.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//

import Foundation
import UIKit

protocol GameView: AnyObject {
    func addCameraView()
    func displayQuestion(question: String, rightAnswer: String, leftAnswer: String)
    func changeRightAnswerView(color: UIColor)
    func changeLeftAnswerView(color: UIColor)
    func updateTheScore(score: String)
    func updateTheTimer(timerLabel: String)
    func playSoundEffect(soundUrl: URL)
    func gameOver(finalScore: String)
    func navigateToCategoryMenu()
    func adjustTheViews(scoreView: Bool, gameView:Bool, warningLabel: Bool)
}

class GamePresenter {
    
    weak var view: GameView?
    private let dataSource = QuestionDataSource()
    private let scoreDataSource = ScoreBoardDataSource()
    private var questions: [QuestionModel]
    private var category: String
    private var questionIndex = 0
    private var canSelectAnswer: Bool = false
    private var currentQuestion: QuestionModel
    private  var score = 0
    private let correctUrl = Bundle.main.url(forResource: "correct", withExtension: "wav", subdirectory: "Sound")
    private let wrongUrl = Bundle.main.url(forResource: "wrong", withExtension: "wav", subdirectory: "Sound")
    private let timeoutUrl = Bundle.main.url(forResource: "timeout", withExtension: "wav", subdirectory: "Sound")
    private let clockUrl = Bundle.main.url(forResource: "clock", withExtension: "wav", subdirectory: "Sound")
    private var timer: Timer?
    private var timeLeft = 5
    
    init(with view: GameView, categorySelected:String) {
        self.view = view
        category = categorySelected
        questions = dataSource.selectRandomQuestions(category: category)
        currentQuestion = questions[questionIndex]
    }
    
    func viewDidLoad(){
        view?.adjustTheViews(scoreView: true, gameView: false, warningLabel: false)
    }
    
    func playAgain(){
        questionIndex = 0
        questions = dataSource.selectRandomQuestions(category: category)
        currentQuestion = questions[questionIndex]
        score = 0
        gameStarted()
        view?.adjustTheViews(scoreView: true, gameView: false, warningLabel: true)
    }
    
    func selectNewCategory(){
        view?.navigateToCategoryMenu()
    }
    
    func
    gameStarted() {
        score = 0
        view?.addCameraView()
        view?.updateTheScore(score: "00")
        view?.updateTheTimer(timerLabel: "5s")
        showNewQuestion()
        view?.adjustTheViews(scoreView: true, gameView: false, warningLabel: true)
    }
    
    func showNewQuestion(){
        delayExecution(by: 1.5) {
            if(self.questionIndex < 10){
                self.view?.changeRightAnswerView(color: .white)
                self.view?.changeLeftAnswerView(color: .white)
                self.currentQuestion = self.questions[self.questionIndex]
                self.view?.displayQuestion(question: self.currentQuestion.questionText, rightAnswer: self.currentQuestion.rightOption, leftAnswer: self.currentQuestion.leftOption)
                self.canSelectAnswer = true
                self.questionIndex += 1
                self.resetTimer()
                
            } else {
                self.timer?.invalidate()
                self.view?.adjustTheViews(scoreView: false, gameView: true, warningLabel: true)
                self.canSelectAnswer = false
                self.scoreDataSource.saveNewScore(username: UserModel.shared.userName, score: self.score)
                self.view?.gameOver(finalScore: "\(self.score)")
               
            }
        }
        
    }
    
    
    func processFaceTilt(headEulerAngleY: CGFloat, headEulerAngleZ: CGFloat) {
        if(canSelectAnswer){
            if headEulerAngleY > 30 {
                selectedLeft()
            } else if headEulerAngleY < -30 {
                selectedRight()
            } else if headEulerAngleZ < 70 && headEulerAngleZ > 20{
                selectedLeft()
            } else if headEulerAngleZ > 100 {
                selectedRight()
            }
        }
    }
    
    func selectedRight(){
        canSelectAnswer = false
        if(currentQuestion.correctAnswerIndex == 1) {
            view?.changeRightAnswerView(color: .green)
            selectedCorrectAnswer()
        } else {
            view?.changeRightAnswerView(color: .red)
            selectedWrongAnswer()
        }
        showNewQuestion()
    }
    
    func selectedLeft(){
        canSelectAnswer = false
        if(currentQuestion.correctAnswerIndex == 0) {
            view?.changeLeftAnswerView(color: .green)
            selectedCorrectAnswer()
        } else {
            view?.changeLeftAnswerView(color: .red)
            selectedWrongAnswer()
        }
        showNewQuestion()
    }
    
    func selectedCorrectAnswer(){
        timer?.invalidate()
        score += 1
        view?.updateTheScore(score: "\(score)")
        if let correctUrl = correctUrl{
            view?.playSoundEffect(soundUrl:  correctUrl)
        }
    }
    
    func selectedWrongAnswer(){
        timer?.invalidate()
        if let wrongUrl = wrongUrl{
            view?.playSoundEffect(soundUrl:  wrongUrl)
        }
    }
    
    func delayExecution(by seconds: TimeInterval, execute: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                execute()
        }
    }
    
    private func timeout() {
        view?.updateTheTimer(timerLabel: "0s")
        if let timeoutUrl = timeoutUrl{
            view?.playSoundEffect(soundUrl:  timeoutUrl)
        }
        if(currentQuestion.correctAnswerIndex == 0) {
            view?.changeLeftAnswerView(color: .green)
        } else {
            view?.changeRightAnswerView(color: .green)
        }
        showNewQuestion()
    }
    
    private func startTimer() {
        if let clockUrl = clockUrl{
            view?.playSoundEffect(soundUrl:  clockUrl)
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timeLeft = 5
        view?.updateTheTimer(timerLabel: "\(timeLeft)s")
        startTimer()
    }
    
    @objc private func updateTimer() {
        timeLeft -= 1
        if timeLeft <= 0 {
            timer?.invalidate()
            timeout()
        } else {
            view?.updateTheTimer(timerLabel: "\(timeLeft)s")
        }
    }
    
}
