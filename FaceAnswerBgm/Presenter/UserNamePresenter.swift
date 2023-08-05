//
//  UserNamePresenter.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 4.08.2023.
//

import Foundation

protocol UserNameView: AnyObject {
    func showErrorMessage(errorMessage: String)
    func navigateToCategoryMenu()
}

class UserNamePresenter: NSObject {
    
    weak var view: UserNameView?
    
    init(with view: UserNameView) {
        self.view = view
    }
    
    func validUserName(username: String){
        if(UserModel.shared.isValidUsername(username: username)){
            self.view?.navigateToCategoryMenu()
        } else {
            self.view?.showErrorMessage(errorMessage: "Please enter a valid username")
        }
    }
    
    
}
