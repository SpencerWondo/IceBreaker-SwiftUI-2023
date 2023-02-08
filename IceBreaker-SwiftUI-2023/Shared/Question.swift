//
//  Question.swift
//  IceBreaker-SwiftUI-2023
//
//  Created by Spencer Wondolowski on 2/7/23.
//

import Foundation

class Question {
    var id: String = ""
    var text: String = ""
    
    init?(id: String, data: [String: Any]){
        guard let text = data["text"] as? String
        else {
            return nil
        }
        self.id = id
        self.text = text
    }
}
