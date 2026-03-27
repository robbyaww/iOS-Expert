import SwiftUI

@main
struct iOS_ExpertApp: App {
    @State private var progress = LearningProgress()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(progress)
        }
    }
}
