//
//  QuestionDataSource.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 4.08.2023.
//

import Foundation

class QuestionDataSource {
    
    let categories: [String] = ["Science", "Geography", "Pop Culture", "History", "Random"]
    
    let scienceQuestions: [QuestionModel] = [
        QuestionModel(category: "Science", questionText: "What is the chemical symbol for gold?", leftOption: "Go", rightOption: "Au", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "Which gas do plants use for photosynthesis?", leftOption: "Oxygen", rightOption: "Carbon dioxide", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "What is the process by which plants make their own food?", leftOption: "Respiration", rightOption: "Photosynthesis", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "What is the smallest unit of matter?", leftOption: "Atom", rightOption: "Molecule", correctAnswerIndex: 0),
        QuestionModel(category: "Science", questionText: "Which planet is known as the 'Red Planet'?", leftOption: "Earth", rightOption: "Mars", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "What is the chemical symbol for water?", leftOption: "Wa", rightOption: "H2O", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "What is the force that pulls objects towards each other?", leftOption: "Gravity", rightOption: "Friction", correctAnswerIndex: 0),
        QuestionModel(category: "Science", questionText: "What is the largest organ in the human body?", leftOption: "Heart", rightOption: "Skin", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "What gas do plants release during photosynthesis?", leftOption: "Carbon dioxide", rightOption: "Oxygen", correctAnswerIndex: 1),
        QuestionModel(category: "Science", questionText: "What is the unit of electric current?", leftOption: "Watt", rightOption: "Ampere", correctAnswerIndex: 1),
    ]

    let geographyQuestions: [QuestionModel] = [
        QuestionModel(category: "Geography", questionText: "Which continent is known as the 'Land Down Under'?", leftOption: "Africa", rightOption: "Australia", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "What is the capital city of Japan?", leftOption: "Shanghai", rightOption: "Tokyo", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "Which river is the longest in the world?", leftOption: "Amazon", rightOption: "Nile", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "Which country is known as the 'Land of the Rising Sun'?", leftOption: "China", rightOption: "Japan", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "Which desert is the largest in the world?", leftOption: "Sahara", rightOption: "Gobi", correctAnswerIndex: 0),
        QuestionModel(category: "Geography", questionText: "What is the capital city of Brazil?", leftOption: "São Paulo", rightOption: "Brasília", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "Which ocean is the largest?", leftOption: "Atlantic Ocean", rightOption: "Pacific Ocean", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "What is the tallest mountain in the world?", leftOption: "Mount Kilimanjaro", rightOption: "Mount Everest", correctAnswerIndex: 1),
        QuestionModel(category: "Geography", questionText: "Which country is known as the 'Land of Fire and Ice'?", leftOption: "Iceland", rightOption: "Australia", correctAnswerIndex: 0),
        QuestionModel(category: "Geography", questionText: "What is the smallest country in the world?", leftOption: "Monaco", rightOption: "Vatican City", correctAnswerIndex: 1),
    ]

    let popCultureQuestions: [QuestionModel] = [
        QuestionModel(category: "Pop Culture", questionText: "Who played the role of Iron Man in the Marvel Cinematic Universe?", leftOption: "Chris Hemsworth", rightOption: "Robert Downey Jr.", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "Which singer's real name is Robyn Fenty?", leftOption: "Beyoncé", rightOption: "Rihanna", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "Who directed the movie 'Avatar'?", leftOption: "Steven Spielberg", rightOption: "James Cameron", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "Which fictional wizard is known for his lightning bolt scar?", leftOption: "Gandalf", rightOption: "Harry Potter", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "Which TV series is set in the fictional Seven Kingdoms of Westeros?", leftOption: "The Walking Dead", rightOption: "Game of Thrones", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "What is the highest-grossing film of all time?", leftOption: "Avatar", rightOption: "Avengers: Endgame", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "Which famous musician is known as the 'King of Pop'?", leftOption: "Elton John", rightOption: "Michael Jackson", correctAnswerIndex: 1),
        QuestionModel(category: "Pop Culture", questionText: "Which actress portrayed Hermione Granger in the 'Harry Potter' film series?", leftOption: "Emma Watson", rightOption: "Keira Knightley", correctAnswerIndex: 0),
        QuestionModel(category: "Pop Culture", questionText: "Who is the author of the 'Harry Potter' book series?", leftOption: "J.K. Rowling", rightOption: "George R.R. Martin", correctAnswerIndex: 0),
        QuestionModel(category: "Pop Culture", questionText: "Which famous film franchise features characters like Luke Skywalker and Darth Vader?", leftOption: "Star Trek", rightOption: "Star Wars", correctAnswerIndex: 1),
    ]

    let historyQuestions: [QuestionModel] = [
        QuestionModel(category: "History", questionText: "In what year did the Titanic sink?", leftOption: "1912", rightOption: "1920", correctAnswerIndex: 0),
        QuestionModel(category: "History", questionText: "Who was the first President of the United States?", leftOption: "Abraham Lincoln", rightOption: "George Washington", correctAnswerIndex: 1),
        QuestionModel(category: "History", questionText: "Which historical event marked the end of the Western Roman Empire?", leftOption: "The Renaissance", rightOption: "The Fall of Rome", correctAnswerIndex: 1),
        QuestionModel(category: "History", questionText: "What was the name of the ship on which Charles Darwin traveled during his voyage?", leftOption: "Mayflower", rightOption: "HMS Beagle", correctAnswerIndex: 1),
        QuestionModel(category: "History", questionText: "Who painted the Mona Lisa?", leftOption: "Vincent van Gogh", rightOption: "Leonardo da Vinci", correctAnswerIndex: 1),
        QuestionModel(category: "History", questionText: "In what year did World War I begin?", leftOption: "1914", rightOption: "1939", correctAnswerIndex: 0),
        QuestionModel(category: "History", questionText: "Who wrote the 'I Have a Dream' speech?", leftOption: "Malcolm X", rightOption: "Martin Luther King Jr.", correctAnswerIndex: 1),
        QuestionModel(category: "History", questionText: "Which ancient civilization built the Great Pyramids?", leftOption: "Greek", rightOption: "Egyptian", correctAnswerIndex: 1),
        QuestionModel(category: "History", questionText: "What document declared the American colonies' independence from Britain?", leftOption: "Declaration of Independence", rightOption: "Bill of Rights", correctAnswerIndex: 0),
        QuestionModel(category: "History", questionText: "Who was the first woman to fly solo across the Atlantic Ocean?", leftOption: "Amelia Earhart", rightOption: "Bessie Coleman", correctAnswerIndex: 0),
    ]
    
    func selectRandomQuestions(category: String) -> [QuestionModel] {
        var selectedQuestions: [QuestionModel] = []
        
        switch category {
        case "History":
            selectedQuestions = Array(historyQuestions.prefix(10))
            break
        case "Pop Culture":
            selectedQuestions = Array(popCultureQuestions.prefix(10))
            break
        case "Geography":
            selectedQuestions = Array(geographyQuestions.prefix(10))
            break
        case "Science":
            selectedQuestions = Array(scienceQuestions.prefix(10))
            break
        case "Random":
            selectedQuestions = getRandomQuestions()
            break
        default:
            break
        }
        return selectedQuestions.shuffled()
    }
    
    func getRandomQuestions() -> [QuestionModel] {

        let allQuestions = historyQuestions + popCultureQuestions + geographyQuestions + scienceQuestions
        let shuffledQuestions = allQuestions.shuffled()
        let selectedQuestions = Array(shuffledQuestions.prefix(10))
        return selectedQuestions
    }
}
