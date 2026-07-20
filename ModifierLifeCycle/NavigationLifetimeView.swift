//
//  NavigationLifetimeView.swift
//  Untitled Project
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// A section demonstrating navigation-based view lifetime, showing that each push
/// creates a fresh instance and going back destroys it.
struct NavigationLifetimeView: View {
    var body: some View {
        let _ = print("[NavigationLifetimeView] body evaluated")

        Text("Navigation Lifetime")
            .font(.headline)
            .padding(.bottom, 8)

        Text("Each push creates a fresh DetailView instance with count = 0. Going back destroys it.")
            .font(.caption)
            .foregroundStyle(.secondary)

        NavigationLink("Go to Detail View") {
            DetailView()
                .lifetimePrint("DetailView")
        }
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        NavigationLifetimeView()
    }
}
