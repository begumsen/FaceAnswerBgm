//
//  UserModel.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 4.08.2023.
//

import Foundation

class UserModel {
    static let shared = UserModel()
    
    private init() { }
    
    var userName: String = ""
    
    func isValidUsername(username: String) -> Bool {
        let charCount = username.count
        
        let isValid = charCount >= 2 && charCount <= 15 && !containsEmoji(username)
        if isValid {
            self.userName = username
            print("newUser: \(username)")
        }
        return isValid
    }
    
    func containsEmoji(_ text: String) -> Bool {
        for scalar in text.unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
                 0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                 0x1F680...0x1F6FF, // Transport and Map
                 0x2600...0x26FF,   // Misc symbols
                 0x2700...0x27BF,   // Dingbats
                 0xFE00...0xFE0F,   // Variation Selectors
                 0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
                 0x1F1E6...0x1F1FF: // Flags
                return true
            default:
                continue
            }
        }
        return false
    }

    
}

