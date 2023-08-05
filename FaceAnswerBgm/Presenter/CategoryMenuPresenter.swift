//
//  CategoryMenuPresenter.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 4.08.2023.
//

import Foundation

protocol CategoryView: AnyObject {
    func showGameScreen(category: String)
}

class CategoryMenuPresenter {
    
    weak var view: CategoryView?
    private let dataSource = QuestionDataSource()
    let categories: [String]
    
    init(with view: CategoryView) {
        self.view = view
        categories = dataSource.categories
    }
    
    func categorySelected(index: Int) {
        print(categories[index])
        view?.showGameScreen(category: categories[index])
    }
    
}
