//
//  Wuwuni.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import UIKit

class Wuwuni {
    var image: UIImage
    var primaryText: String = ""
    var descriptionText: String = ""
    var status: Status
    var creationDate: Date
    
    init(image: UIImage, primaryText: String, descriptionText: String, creationDate: Date, status: Status) {
        self.image = image
        self.primaryText = primaryText
        self.descriptionText = descriptionText
        self.creationDate = creationDate
        self.status = status
    }
}
