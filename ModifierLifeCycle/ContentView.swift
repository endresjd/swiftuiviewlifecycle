//
//  ContentView.swift
//  Untitled Project
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// The root view of the app, demonstrating SwiftUI view identity and body evaluation timing.
///
/// Open the Xcode console and interact with the controls to observe exactly which view bodies
/// fire and in what order. Two mechanisms drive the demo:
///
/// - **External modifier** — `.lifetimePrint` is applied to `CounterView` from this parent.
///   Its body fires when this view rerenders and re-evaluates the child's position in the tree.
/// - **Internal print** — a `let _ = print(...)` inside `CounterView.body` fires when
///   `CounterView` itself is asked to rerender.
///
/// Tapping "Rerender Parent" changes `parentCount`, causing `ContentView.body` to run.
/// Watch whether `CounterView` also prints — it will, because it is not `Equatable` and
/// SwiftUI cannot skip re-evaluating it when the parent reruns.
///
/// Tapping "Increment" inside the counter changes only `CounterView`'s own `@State`.
/// `ContentView.body` does NOT rerun — only `CounterView.body` does.
struct ContentView: View {
    /// Increments to trigger a ContentView rerender without touching CounterView's inputs.
    @State private var parentCount = 0

    var body: some View {
        let _ = print("[ContentView] body evaluated — parentCount is \(parentCount)")

        NavigationStack {
            ScrollView {
                LifetimeDemoContent() {
                    parentCount += 1
                }
                .lifetimePrint("LifetimeDemoContent (external)")
            }
            .navigationTitle("Lifetime Demo")
            .lifetimePrint("NavigationStack (external)")
        }
    }
}

#Preview {
    ContentView()
}
