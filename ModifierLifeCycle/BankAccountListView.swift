//
//  BankAccountListView.swift
//  Untitled Project
//
//  Created by John Endres on 7/19/26.
//

import SwiftUI

/// A view that displays all available bank accounts for selection.
struct BankAccountListView: View {
    @Binding var selectedAccount: BankAccount?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let _ = print("[BankAccountListView] body evaluated")

        List(BankAccount.sampleAccounts) { account in
            Button {
                selectedAccount = account
                dismiss()
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(account.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        if selectedAccount?.id == account.id {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.blue)
                        }
                    }
                    
                    HStack {
                        Text(account.type.rawValue)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("•")
                            .foregroundStyle(.secondary)
                        
                        Text(account.accountNumber)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
            .foregroundStyle(.primary)
        }
        .navigationTitle("Select Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BankAccountListView(selectedAccount: .constant(BankAccount.sampleAccounts[0]))
    }
}
