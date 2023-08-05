//
//  ViewController.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 4.08.2023.
//

import UIKit

class UserNameViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    lazy var presenter = UserNamePresenter(with:self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func GoButtonClicked(_ sender: Any) {
        presenter.validUserName(username: userNameTextField.text ?? "")
    }
    
}

extension UserNameViewController: UserNameView {

    func showErrorMessage(errorMessage: String) {
        errorLabel.isHidden = false
        errorLabel.text = errorMessage
    }
    
    func navigateToCategoryMenu(){
        errorLabel.isHidden = true
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CategoryMenuController") as! CategoryMenuViewController
        self.present(nextViewController, animated:true, completion:nil)
            
    }
}

