//
//  UserRegisterPref.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 05/10/20.
//

import Foundation
import Combine
import SwiftUI

class UserRegisterPref: ObservableObject {
    @Published var imageKTP: String {
        didSet {
            UserDefaults.standard.set(imageKTP, forKey: "imageKTP")
        }
    }
    
    init() {
        self.imageKTP = (UserDefaults.standard.object(forKey: "imageKTP") as? String)!
    }
}
