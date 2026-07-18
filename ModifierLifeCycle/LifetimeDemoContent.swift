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
    /// Controls the structural identity of ``CounterView``. Replacing this UUID
    /// causes SwiftUI to destroy the existing instance and insert a brand-new one,
    /// resetting all `@State` inside it back to initial values.
    @Binding var viewID: UUID

    /// Called when the user taps "Rerender Parent" to trigger a parent view rerender.
    let onRerenderParent: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Open the Xcode console and watch which bodies fire as you interact with each control below.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Divider()

            Text("Identity-Controlled Counter")
                .font(.headline)

            Text("Identity: \(viewID.uuidString.prefix(8))…")
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)

            CounterView(label: "Counter A")
                .id(viewID)
                .lifetimePrint("CounterView (external)")

            HStack(spacing: 12) {
                Button("Reset Identity") {
                    viewID = UUID()
                }
                .buttonStyle(.bordered)

                Button("Rerender Parent") {
                    onRerenderParent()
                }
                .buttonStyle(.bordered)
            }

            Text(
                """
                Reset Identity → SwiftUI destroys the old CounterView and creates a fresh one. \
                Its @State resets to 0.

                Rerender Parent → ContentView.body runs. Both the external modifier and \
                CounterView's own body print, because CounterView is not Equatable.

                Increment (inside counter) → Only CounterView.body prints. \
                ContentView.body does not run.
                """
            )
            .font(.caption)
            .foregroundStyle(.secondary)

            Divider()

            Text("Navigation Lifetime")
                .font(.headline)

            Text("Each push creates a fresh DetailView instance with count = 0. Going back destroys it.")
                .font(.caption)
                .foregroundStyle(.secondary)

            NavigationLink("Go to Detail View") {
                DetailView()
                    .lifetimePrint("DetailView (external)")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            LifetimeDemoContent(viewID: .constant(UUID())) {
            }
        }
    }
}
