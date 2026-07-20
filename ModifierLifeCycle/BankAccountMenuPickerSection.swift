//
//  BankAccountMenuPickerSection.swift
//  Untitled Project
//
//  Created by John Endres on 7/19/26.
//

import SwiftUI

/// A section that displays a bank account picker using the menu style.
struct BankAccountMenuPickerSection: View {
    @State private var selectedAccount: BankAccount?
    
    var body: some View {
        let _ = print("[BankAccountMenuPickerSection] body evaluated")
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Bank Account Menu Picker")
                .font(.headline)
            
            Text("This demonstrates a menu-style picker. Select an account and observe console output.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            BankAccountMenuPicker(selectedAccount: $selectedAccount)
        }
    }
}

#Preview {
    BankAccountMenuPickerSection()
        .padding()

    Spacer()
}
