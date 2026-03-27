import SwiftUI

// MARK: - Main Tab View

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Dashboard", systemImage: "house.fill") {
                DashboardView()
            }

            Tab("Curriculum", systemImage: "book.fill") {
                CurriculumView()
            }

            Tab("Interview", systemImage: "star.fill") {
                InterviewView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(LearningProgress())
}
