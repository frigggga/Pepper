//
//  Pet.swift
//  pepper-playground
//
//  Created by Zhang on 2024/2/19.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var age: Int
    var type: PetType
    var gender: PetGender
    var size: PetSize
    var description: String
    
    var likes: [Int] // List of pet ids this pet has liked
    var dislikes: [Int] // List of pet ids this pet has disliked
    var matches:[Int] // List of pet ids are matched
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    
}

enum PetType: String, CaseIterable, Codable {
    case cat = "Cat"
    case dog = "Dog"
    case rabbit = "Rabbit"
    case turtle = "Turtle"
    case snake = "Snake"
    case other = "Other"
}

enum PetGender: String, CaseIterable, Codable {
    case male = "Male"
    case female = "Female"
}

enum PetSize: String, CaseIterable, Codable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}


