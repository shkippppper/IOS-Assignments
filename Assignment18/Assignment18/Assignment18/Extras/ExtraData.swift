//
//  ExtraData.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 26.04.24.
//

import Foundation

enum TextInputTypes {
    case Name
    case Password
    case PasswordRepeat
}

enum KeyChainError: Error {
    case sameItemFound
    case unknown
    case noSuchDataFound
    case keychainErrorWithCode(Int)
}
