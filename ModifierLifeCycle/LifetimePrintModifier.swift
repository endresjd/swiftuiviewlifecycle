//
//  LifetimePrintModifier.swift
//  Untitled Project
//
//  Created by John Endres on 7/18/26.
//

import SwiftUI

/// A view modifier that prints a labeled message to the console each time its `body` is evaluated.
///
/// Attach this modifier to any view to observe exactly when the view that *applies* this modifier
/// rerenders — i.e., when the parent view's `body` runs.
///
/// ## Why `renderID` is required
/// SwiftUI compares modifier struct values between renders to decide whether to call `body(content:)`.
/// If the modifier's value is unchanged (same label, same everything), SwiftUI skips calling
/// `body(content:)` entirely — so the print never fires. `renderID` is a `UUID` computed fresh
/// on every struct instantiation, making each modifier instance unique. SwiftUI always sees a
/// "new" modifier and always calls `body(content:)`.
///
/// ## When `body` fires
/// Every time the view that *calls* `.lifetimePrint(...)` rerenders. That view creates a new
/// `LifetimePrintModifier` struct (new `renderID`), SwiftUI detects the change, and calls `body`.
///
/// ## When `body` does NOT fire
/// When the *wrapped* view updates due to its own internal state (e.g. a `@State` change inside
/// `CounterView`). That rerender bypasses the modifier entirely — the parent's body never runs,
/// so no new modifier struct is ever created.
struct LifetimePrintModifier: ViewModifier {
    /// The label printed alongside each console message.
    let label: String

    /// A unique value generated on every instantiation.
    ///
    /// This ensures SwiftUI always treats consecutive modifier instances as different,
    /// guaranteeing `body(content:)` is called whenever the parent view rerenders.
    private let renderID = UUID()

    func body(content: Content) -> some View {
        let _ = print("[\(label)] modifier body evaluated")

        // .opacity(1) is a no-op visually (1.0 is the default), but it changes the
        // concrete return type from `Content` to `ModifiedContent<Content, _OpacityEffect>`.
        // Without this, Swift resolves `some View` to `Content` itself, and SwiftUI
        // recognizes the modifier as an identity transform and short-circuits the call —
        // body(content:) is never invoked and the print never runs.
        content.opacity(1)
    }
}

extension View {
    /// Attaches a ``LifetimePrintModifier`` that logs to the console whenever this view is re-evaluated.
    ///
    /// - Parameter label: A short string identifying this view in the console output.
    /// - Returns: The unmodified view, with a console-printing side effect on each body evaluation.
    func lifetimePrint(_ label: String) -> some View {
        modifier(LifetimePrintModifier(label: label))
    }
}
