//
//  CreateNewCardDelegateProtocol.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import Foundation

protocol CreateNewCardDelegate: AnyObject {
    func didCreateNewCard(newData: [Wuwuni])
}
