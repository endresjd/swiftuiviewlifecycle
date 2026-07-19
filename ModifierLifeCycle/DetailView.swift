//
//  DetailView.swift
//  Untitled Project
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// A detail view pushed onto the navigation stack to illustrate view creation and destruction.
///
/// Each navigation push creates a fresh instance; returning pops and destroys it.
/// Navigate back and forth to confirm the counter always starts at zero —
/// there is no persistent state between visits.
struct DetailView: View {
    /// Provides a programmatic way to pop this view off the navigation stack.
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let _ = print("[DetailView] body evaluated")

        ScrollView {
            VStack(spacing: 24) {
                Text("This view was freshly created when you navigated here.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                CounterView(label: "Detail")
                
                Text("Navigate back and return — the count will be 0 again because this is a brand-new view instance each time.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                Button("Dismiss") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Detail View")
        }
    }
}

#Preview {
    NavigationStack {
        DetailView()
    }
}
