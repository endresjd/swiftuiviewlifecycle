//
//  BankAccountMenuPicker.swift
//  Untitled Project
//
//  Created by John Endres on 7/19/26.
//

import SwiftUI

/// A menu-style picker for selecting a bank account.
struct BankAccountMenuPicker: View {
    @Binding var selectedAccount: BankAccount?
    
    var body: some View {
        let _ = print("[BankAccountMenuPicker] body evaluated")

        VStack(alignment: .leading, spacing: 8) {
            Text("Selected Account")
                .font(.caption)
                .foregroundStyle(.secondary)

            Menu {
                ForEach(BankAccount.sampleAccounts) { account in
                    Button {
                        selectedAccount = account
                    } label: {
                        Text("\(account.name)")
                        Text("\(account.type.rawValue)  \(account.accountNumber)")
                    }
                }
            } label: {
                HStack {
                    if let selectedAccount {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(selectedAccount.name)
                                .font(.headline)
                            Text("****\(selectedAccount.accountNumber.suffix(4))")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    } else {
                        Text("Select an account")
                    }

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(.systemBackground))
                .cornerRadius(6)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    @Previewable @State var selectedAccount: BankAccount?
    
    BankAccountMenuPicker(selectedAccount: $selectedAccount)
        .padding()

    Spacer()
}

//                ForEach(BankAccount.sampleAccounts) { account in
//                    Text("\(account.name) - \(account.accountNumber)")
//                        .tag(account as BankAccount?)
//                }
