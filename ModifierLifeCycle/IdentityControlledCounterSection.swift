//
//  IdentityControlledCounterSection.swift
//  ModifierLifeCycle
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// A section demonstrating how SwiftUI's structural identity controls view lifetime,
/// allowing the user to reset the identity of a counter view and observe the effect on its `@State`.
struct IdentityControlledCounterSection: View {
    /// Controls the structural identity of ``CounterView``. Replacing this UUID
    /// causes SwiftUI to destroy the existing instance and insert a brand-new one,
    /// resetting all `@State` inside it back to initial values.
    @State private var viewID = UUID()

    /// Called when the user taps "Rerender Parent" to trigger a parent view rerender.
    let onRerenderParent: () -> Void

    var body: some View {
        let _ = print("[IdentityControlledCounterSection] body evaluated")

        VStack(alignment: .leading, spacing: 20) {
            Text("Identity-Controlled Counter")
                .font(.headline)

            VStack(alignment: .center) {
                Text("Identity: \(viewID.uuidString)")
                    .font(.caption.monospaced())
                    .foregroundStyle(.secondary)

                CounterView(label: "Counter")
                    .id(viewID)
                    .padding(.bottom)
                    .lifetimePrint("CounterView")

                HStack(spacing: 12) {
                    Button("Reset Identity") {
                        print("    [IdentityControlledCounterSection] Reset Identity")
                        viewID = UUID()
                    }
                    .buttonStyle(.bordered)

                    Button("Rerender Parent") {
                        print("    [IdentityControlledCounterSection] Rerender Parent")

                        onRerenderParent()
                    }
                    .buttonStyle(.bordered)
                }
            }
            .frame(maxWidth: .infinity)

            Text(
                """
                    Reset Identity → SwiftUI destroys the old CounterView and creates a fresh one. Its @State resets to 0.

                    Rerender Parent → ContentView.body runs. Both the external modifier and CounterView's own body print, because CounterView is not Equatable.

                    Increment (inside counter) → Only CounterView.body prints. ContentView.body does not run.
                    """
            )
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            IdentityControlledCounterSection() {
            }
            .padding()
        }
    }
}
