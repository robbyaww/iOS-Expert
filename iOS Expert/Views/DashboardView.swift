import SwiftUI

// MARK: - Dashboard View

struct DashboardView: View {
    @Environment(LearningProgress.self) private var progress

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    headerCard
                    statsGrid
                    nextModuleCard
                    interviewTopicsCard
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("iOS Expert")
        }
    }

    // MARK: - Header Card

    private var headerCard: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray4), lineWidth: 8)
                    .frame(width: 120, height: 120)

                Circle()
                    .trim(from: 0, to: progress.completionPercentage)
                    .stroke(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(-90))
                    .animation(.spring, value: progress.completionPercentage)

                VStack(spacing: 2) {
                    Text("\(Int(progress.completionPercentage * 100))%")
                        .font(.title2.bold())
                    Text("Complete")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Text("\(progress.completedModules.count) of \(progress.totalModules) modules")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
    }

    // MARK: - Stats Grid

    private var statsGrid: some View {
        HStack(spacing: 12) {
            StatCard(
                icon: "flame.fill",
                value: "\(progress.currentStreak)",
                label: "Day Streak",
                color: .orange
            )
            StatCard(
                icon: "checkmark.circle.fill",
                value: "\(progress.completedModules.count)",
                label: "Completed",
                color: .green
            )
            StatCard(
                icon: "bookmark.fill",
                value: "\(progress.bookmarkedModules.count)",
                label: "Bookmarked",
                color: .blue
            )
        }
    }

    // MARK: - Next Module Card

    private var nextModuleCard: some View {
        let nextModule = CurriculumContent.phases
            .flatMap(\.modules)
            .first { !progress.isCompleted($0.id) }

        return Group {
            if let module = nextModule {
                VStack(alignment: .leading, spacing: 12) {
                    Label("Continue Learning", systemImage: "play.circle.fill")
                        .font(.headline)
                        .foregroundStyle(.blue)

                    NavigationLink(value: module.id) {
                        HStack {
                            Image(systemName: module.icon)
                                .font(.title2)
                                .foregroundStyle(.blue)
                                .frame(width: 44, height: 44)
                                .background(.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Module \(module.id)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(module.title)
                                    .font(.body.bold())
                                    .foregroundStyle(.primary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .navigationDestination(for: Int.self) { moduleId in
                    if let mod = CurriculumContent.phases.flatMap(\.modules).first(where: { $0.id == moduleId }) {
                        ModuleDetailView(module: mod)
                    }
                }
            }
        }
    }

    // MARK: - Interview Topics

    private var interviewTopicsCard: some View {
        let topics = [
            ("Struct vs Class", "cube"),
            ("ARC & Retain Cycles", "memorychip"),
            ("Swift Concurrency", "arrow.2.squarepath"),
            ("SwiftUI vs UIKit", "rectangle.on.rectangle"),
            ("Architecture Patterns", "building.columns")
        ]

        return VStack(alignment: .leading, spacing: 12) {
            Label("Top Interview Topics", systemImage: "star.fill")
                .font(.headline)
                .foregroundStyle(.purple)

            ForEach(topics, id: \.0) { topic, icon in
                HStack(spacing: 12) {
                    Image(systemName: icon)
                        .foregroundStyle(.purple)
                        .frame(width: 28)
                    Text(topic)
                        .font(.subheadline)
                    Spacer()
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Stat Card

private struct StatCard: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            Text(value)
                .font(.title3.bold())
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
    }
}
