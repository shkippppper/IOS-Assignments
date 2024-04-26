//
//  LoginPageViewModel.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 26.04.24.
//

import UIKit

class LoginPageViewModel {
    
    
    // MARK: - Variables

    
    let serviceName = "countriesAPI"
    let accountName = "atitb"
    
    var userHasLoggedIn = false
    
    private var name = ""
    private var password = ""
    private var repeatedPassword = ""
    
    // MARK: - Helper Functions

    func saveCredentials(username: String, password: String) throws {
        let passwordData = "\(username):\(password)".data(using: .utf8)!
        do {
            try KeychainService.saveData(service: serviceName, account: accountName, password: passwordData)
        } catch {
            throw error
        }
    }
    
    func loadCredentials() throws -> (username: String, password: String) {
        guard let passwordData = KeychainService.getData(service: serviceName, account: accountName) else {
            throw KeyChainError.noSuchDataFound
        }
        
        guard let credentialString = String(data: passwordData, encoding: .utf8),
              let separatorRange = credentialString.range(of: ":"),
              !credentialString.isEmpty else {
            throw KeyChainError.unknown
        }
        
        let username = String(credentialString[..<separatorRange.lowerBound])
        let password = String(credentialString[separatorRange.upperBound...])
        
        return (username, password)
    }
    
    func updateCredentials(newUsername: String, newPassword: String) throws {
        let newPasswordData = "\(newUsername):\(newPassword)".data(using: .utf8)!
        do {
            try KeychainService.updateData(password: newPasswordData, service: serviceName, account: accountName)
        } catch {
            throw error
        }
    }
    
    func deleteCredentials() throws {
        do {
            try KeychainService.deleteData(service: serviceName, account: accountName)
            UserDefaults.standard.set(false, forKey: "HasLoggedBefore")
            UserDefaults.standard.synchronize()
        } catch {
            throw error
        }
    }
    
    func saveImage(image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 1) ?? image.pngData()
        if let data = imageData {
            let filename = getDocumentsDirectory().appendingPathComponent("user.png")
            try? data.write(to: filename)
        }
    }
    
    func openSyllabus() {
        if let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"){
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Computed Properties
    
    func isFirstLogin() -> Bool {
        let firstLogin = UserDefaults.standard.bool(forKey: "HasLoggedBefore")
        if !firstLogin {
            UserDefaults.standard.set(true, forKey: "HasLoggedBefore")
            UserDefaults.standard.synchronize()
        }
        return !firstLogin
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
