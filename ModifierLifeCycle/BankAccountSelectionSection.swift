//
//  BankAccountSelectionSection.swift
//  Untitled Project
//
//  Created by John Endres on 7/19/26.
//

import SwiftUI

/// A section that displays the currently selected bank account and allows navigation to select a different one.
struct BankAccountSelectionSection: View {
    @State private var selectedAccount: BankAccount?
    
    var body: some View {
        let _ = print("[BankAccountSelectionSection] body evaluated")
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Bank Account Selection")
                .font(.headline)
            
            Text("This demonstrates navigation and state persistence. Select an account and observe console output.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            NavigationLink {
                BankAccountListView(selectedAccount: $selectedAccount)
            } label: {
                BankAccountSelectionCard(selectedAccount: selectedAccount)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            BankAccountSelectionSection()
                .padding()
        }
    }
}
