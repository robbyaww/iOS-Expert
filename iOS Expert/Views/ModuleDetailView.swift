import SwiftUI

// MARK: - Module Detail View

struct ModuleDetailView: View {
    let module: Module
    @Environment(LearningProgress.self) private var progress

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                headerSection
                topicsSection
                if let example = module.codeExample {
                    codeExampleSection(example)
                }
                miniProjectSection
                bigTechTipSection
                actionButtons
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Module \(module.id)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    progress.toggleBookmark(module.id)
                } label: {
                    Image(systemName: progress.isBookmarked(module.id) ? "bookmark.fill" : "bookmark")
                }
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: module.icon)
                .font(.system(size: 48))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Text(module.title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            if progress.isCompleted(module.id) {
                Label("Completed", systemImage: "checkmark.circle.fill")
                    .font(.subheadline)
                    .foregroundStyle(.green)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }

    // MARK: - Topics

    private var topicsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Topics", icon: "list.bullet", color: .blue)

            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(module.topics.enumerated()), id: \.offset) { index, topic in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.caption.bold())
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                            .background(.blue, in: Circle())

                        Text(topic)
                            .font(.subheadline)
                    }
                }
            }
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
        }
    }

    // MARK: - Code Example

    private func codeExampleSection(_ example: CodeExample) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: example.title, icon: "chevron.left.forwardslash.chevron.right", color: .indigo)

            VStack(alignment: .leading, spacing: 12) {
                ScrollView(.horizontal, showsIndicators: false) {
                    Text(example.code)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                }
                .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 10))

                Text(example.explanation)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 4)
            }
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
        }
    }

    // MARK: - Mini Project

    private var miniProjectSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Mini Project", icon: "hammer.fill", color: .orange)

            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "wrench.and.screwdriver")
                    .foregroundStyle(.orange)
                    .frame(width: 32)
                Text(module.miniProject)
                    .font(.subheadline)
            }
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
        }
    }

    // MARK: - Big Tech Tip

    private var bigTechTipSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Big Tech Tip", icon: "star.fill", color: .purple)

            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "lightbulb.fill")
                    .foregroundStyle(.yellow)
                    .frame(width: 32)
                Text(module.bigTechTip)
                    .font(.subheadline)
                    .italic()
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [.purple.opacity(0.08), .blue.opacity(0.05)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                in: RoundedRectangle(cornerRadius: 14)
            )
        }
    }

    // MARK: - Action Buttons

    private var actionButtons: some View {
        Button {
            withAnimation {
                progress.toggleComplete(module.id)
            }
        } label: {
            Label(
                progress.isCompleted(module.id) ? "Mark as Incomplete" : "Mark as Complete",
                systemImage: progress.isCompleted(module.id) ? "xmark.circle" : "checkmark.circle.fill"
            )
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(
                progress.isCompleted(module.id) ? Color.gray : Color.green,
                in: RoundedRectangle(cornerRadius: 14)
            )
        }
        .padding(.top, 8)
    }
}

// MARK: - Section Header

private struct SectionHeader: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        Label(title, systemImage: icon)
            .font(.headline)
            .foregroundStyle(color)
    }
}
