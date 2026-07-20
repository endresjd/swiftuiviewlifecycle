//
//  BankAccount.swift
//

import Foundation

struct BankAccount: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let accountNumber: String
    let type: AccountType
    
    enum AccountType: String {
        case checking = "Checking"
        case savings = "Savings"
        case moneyMarket = "Money Market"
        case cd = "Certificate of Deposit"
    }
}

extension BankAccount {
    static let sampleAccounts = [
        BankAccount(name: "Primary Checking", accountNumber: "****1234", type: .checking),
        BankAccount(name: "Emergency Savings", accountNumber: "****5678", type: .savings),
        BankAccount(name: "High Yield Savings", accountNumber: "****9012", type: .moneyMarket),
        BankAccount(name: "College Fund", accountNumber: "****3456", type: .savings),
        BankAccount(name: "Vacation Savings", accountNumber: "****7890", type: .savings),
        BankAccount(name: "Investment CD", accountNumber: "****2468", type: .cd)
    ]
}
