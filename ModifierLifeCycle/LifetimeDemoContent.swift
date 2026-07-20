//
//  LifetimeDemoContent.swift
//  Untitled Project
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// The scrollable content of the Lifetime Demo screen, displaying identity
/// and navigation lifetime demonstrations.
struct LifetimeDemoContent: View {
    /// Called when the user taps "Rerender Parent" to trigger a parent view rerender.
    let onRerenderParent: () -> Void

    var body: some View {
        let _ = print("[LifetimeDemoContent] body evaluated")

        VStack(alignment: .leading, spacing: 20) {
            Text("Open the Xcode console and watch which bodies fire as you interact with each control below.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Divider()

            IdentityControlledCounterSection(onRerenderParent: onRerenderParent)

            Divider()

            BankAccountSelectionSection()

            Divider()

            BankAccountMenuPickerSection()

            Divider()

            NavigationLifetimeView()
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            LifetimeDemoContent() {
            }
        }
    }
}
