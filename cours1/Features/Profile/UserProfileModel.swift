//
//  UserProfileModel.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//

import PhotosUI
import SwiftUI

@Observable
class UserProfileModel: Identifiable {
    let id = UUID()
    var username: String = "Jean Dupont"
    var age: Int = 18
    var avatarImage: UIImage? = nil
}
