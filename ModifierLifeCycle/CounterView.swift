//
//  CounterView.swift
//  Untitled Project
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// A labeled counter whose state is owned entirely by this view instance.
///
/// Demonstrates how SwiftUI view identity governs state lifetime: the counter
/// resets to zero whenever the view is assigned a new identity via `.id()`.
/// The internal print fires whenever CounterView's own `body` is evaluated.
struct CounterView: View {
    /// The label displayed above the count.
    let label: String

    /// The current count, owned exclusively by this view instance.
    @State private var count = 0

    var body: some View {
        let _ = print("[\(label)] CounterView body evaluated — count is \(count)")

        VStack(spacing: 8) {
            Text(label)
                .font(.headline)

            Text("\(count)")
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .monospacedDigit()
                .contentTransition(.numericText())

            Button("Increment") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CounterView(label: "Preview Counter")
        .padding()
}
