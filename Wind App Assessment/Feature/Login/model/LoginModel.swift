//
//  LoginModel.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/9/23.
//

import Foundation

struct LoginModel: Codable {
    let status: Bool?
    let messages: [String]?
    let data: LoginData?
    let timestamp: String?
    let path: String?
    let statusCode: Int?
    let error: String?
    let requestId: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case messages = "messages"
        case data = "data"
        case timestamp = "timestamp"
        case path = "path"
        case statusCode = "statusCode"
        case error = "error"
        case requestId = "requestId"
    }
}

struct LoginData: Codable {
    let userInfo: LoginUserInfo?
    let accountInfo: LoginAccountInfo?
    
    enum CodingKeys: String, CodingKey {
        case userInfo = "userInfo"
        case accountInfo = "accountInfo"
    }
}

struct LoginAccountInfo: Codable {
    let balance: Double?
    let currency: String?
    
    enum CodingKeys: String, CodingKey {
        case balance = "balance"
        case currency = "currency"
    }
}

struct LoginUserInfo: Codable {
    let id: Int?
    let email: String?
    let userName: String?
    let walletAddress: String?
    let smartContactWallet: String?
    let profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case email = "Email"
        case userName = "UserName"
        case walletAddress = "WalletAddress"
        case smartContactWallet = "smartContactWallet"
        case profileImage = "ProfileImage"
    }
}
