//
//  BankAccountSelectionCard.swift
//  Untitled Project
//
//  Created by John Endres on 7/19/26.
//

import SwiftUI

/// A reusable card view for displaying and selecting a bank account.
struct BankAccountSelectionCard: View {
    let selectedAccount: BankAccount?
    let labelText: String
    let placeholderText: String
    
    init(
        selectedAccount: BankAccount?,
        labelText: String = "Selected Account",
        placeholderText: String = "Tap to select an account"
    ) {
        self.selectedAccount = selectedAccount
        self.labelText = labelText
        self.placeholderText = placeholderText
    }
    
    var body: some View {
        let _ = print("[BankAccountSelectionCard] body evaluated")

        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(labelText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                if let account = selectedAccount {
                    Text(account.name)
                        .font(.body)
                        .foregroundStyle(.primary)
                    
                    HStack {
                        Text(account.type.rawValue)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Text("•")
                            .foregroundStyle(.secondary)
                        
                        Text(account.accountNumber)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                } else {
                    Text(placeholderText)
                        .font(.body)
                        .foregroundStyle(.blue)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview("No Selection") {
    BankAccountSelectionCard(selectedAccount: nil)
        .padding()
}

#Preview("With Selection") {
    BankAccountSelectionCard(
        selectedAccount: BankAccount.sampleAccounts[0],
        labelText: "Current Account",
        placeholderText: "Choose an account"
    )
    .padding()
}

#Preview("Custom Messages") {
    VStack(spacing: 16) {
        BankAccountSelectionCard(
            selectedAccount: nil,
            labelText: "Payment Source",
            placeholderText: "Select a payment method"
        )
        
        BankAccountSelectionCard(
            selectedAccount: BankAccount.sampleAccounts[1],
            labelText: "Transfer To",
            placeholderText: "Choose destination"
        )
        
        BankAccountSelectionCard(
            selectedAccount: nil,
            labelText: "Linked Account",
            placeholderText: "Link your bank account"
        )
    }
    .padding()
}
