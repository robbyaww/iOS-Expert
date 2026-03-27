import SwiftUI

// MARK: - Interview Quick Reference View

struct InterviewView: View {
    @State private var searchText = ""

    private let topics: [(rank: Int, topic: String, points: String, icon: String)] = [
        (1, "Struct vs Class", "Value vs reference, stack vs heap, COW", "cube"),
        (2, "ARC", "Strong, weak, unowned, retain cycles", "memorychip"),
        (3, "Closures", "Capture lists, [weak self], escaping", "function"),
        (4, "Protocols", "POP, protocol extensions, some vs any", "doc.text"),
        (5, "Generics", "Type constraints, associated types", "chevron.left.forwardslash.chevron.right"),
        (6, "SwiftUI vs UIKit", "Declarative vs imperative, when to use each", "rectangle.on.rectangle"),
        (7, "@Observable", "Observation framework, replaces ObservableObject", "eye"),
        (8, "Swift Concurrency", "async/await, actors, Sendable, structured concurrency", "arrow.2.squarepath"),
        (9, "SwiftData", "@Model, ModelContext, #Predicate, migrations", "externaldrive"),
        (10, "App Lifecycle", "ScenePhase, background tasks, state restoration", "app.badge"),
        (11, "Navigation", "NavigationStack, deep linking, coordinator pattern", "arrow.triangle.turn.up.right.diamond"),
        (12, "Networking", "URLSession async, Codable, caching, mocking", "network"),
        (13, "Testing", "Swift Testing, XCTest, TCA TestStore, snapshot tests", "checkmark.shield"),
        (14, "Performance", "Instruments, launch time, memory, 60fps", "gauge.with.dots.needle.67percent"),
        (15, "Security", "Keychain, biometrics, ATS, pinning", "lock.shield"),
        (16, "Accessibility", "VoiceOver, Dynamic Type, reduce motion", "accessibility"),
        (17, "Architecture", "MVVM, TCA, modular architecture", "building.columns"),
        (18, "CI/CD", "Xcode Cloud, Fastlane, code signing", "arrow.triangle.2.circlepath.circle"),
        (19, "System Design", "Feed, chat, image loader, analytics SDK", "doc.text.magnifyingglass"),
        (20, "DSA", "Arrays, trees, graphs, DP, two pointers", "chart.bar.doc.horizontal")
    ]

    private var filteredTopics: [(rank: Int, topic: String, points: String, icon: String)] {
        if searchText.isEmpty { return topics }
        return topics.filter {
            $0.topic.localizedCaseInsensitiveContains(searchText) ||
            $0.points.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Top 20 iOS Interview Topics")
                            .font(.headline)
                        Text("Master these to ace any big tech iOS interview")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .listRowBackground(
                        LinearGradient(
                            colors: [.purple.opacity(0.15), .blue.opacity(0.1)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                }

                Section {
                    ForEach(filteredTopics, id: \.rank) { item in
                        HStack(spacing: 14) {
                            Text("#\(item.rank)")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                                .frame(width: 32, height: 32)
                                .background(rankColor(item.rank), in: RoundedRectangle(cornerRadius: 8))

                            Image(systemName: item.icon)
                                .foregroundStyle(.blue)
                                .frame(width: 24)

                            VStack(alignment: .leading, spacing: 3) {
                                Text(item.topic)
                                    .font(.subheadline.bold())
                                Text(item.points)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }

                Section("Recommended Resources") {
                    ResourceRow(title: "Point-Free", subtitle: "TCA, swift-dependencies, advanced Swift", icon: "play.rectangle")
                    ResourceRow(title: "Hacking with Swift", subtitle: "Tutorials & 100 Days of SwiftUI", icon: "book")
                    ResourceRow(title: "LeetCode", subtitle: "2-3 Swift problems daily", icon: "brain")
                    ResourceRow(title: "Apple Docs", subtitle: "developer.apple.com", icon: "applelogo")
                    ResourceRow(title: "Swift by Sundell", subtitle: "Articles & podcast", icon: "waveform")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Interview Prep")
            .searchable(text: $searchText, prompt: "Search topics")
        }
    }

    private func rankColor(_ rank: Int) -> Color {
        switch rank {
        case 1...5: .red
        case 6...10: .orange
        case 11...15: .blue
        default: .purple
        }
    }
}

// MARK: - Resource Row

private struct ResourceRow: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.green)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline.bold())
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
