import SwiftUI

// MARK: - Curriculum View

struct CurriculumView: View {
    @Environment(LearningProgress.self) private var progress

    var body: some View {
        NavigationStack {
            List {
                ForEach(CurriculumContent.phases) { phase in
                    Section {
                        ForEach(phase.modules) { module in
                            NavigationLink(value: module.id) {
                                ModuleRow(module: module)
                            }
                        }
                    } header: {
                        PhaseHeader(phase: phase)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Curriculum")
            .navigationDestination(for: Int.self) { moduleId in
                if let module = CurriculumContent.phases
                    .flatMap(\.modules)
                    .first(where: { $0.id == moduleId }) {
                    ModuleDetailView(module: module)
                }
            }
        }
    }
}

// MARK: - Phase Header

private struct PhaseHeader: View {
    let phase: Phase
    @Environment(LearningProgress.self) private var progress

    private var completedCount: Int {
        phase.modules.filter { progress.isCompleted($0.id) }.count
    }

    var body: some View {
        HStack {
            Image(systemName: phase.icon)
                .foregroundStyle(.blue)
            Text("Phase \(phase.id): \(phase.title)")
                .font(.subheadline.bold())
                .textCase(nil)
            Spacer()
            Text("\(completedCount)/\(phase.modules.count)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Module Row

private struct ModuleRow: View {
    let module: Module
    @Environment(LearningProgress.self) private var progress

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(progress.isCompleted(module.id) ? Color.green.opacity(0.15) : Color.blue.opacity(0.1))
                    .frame(width: 44, height: 44)

                if progress.isCompleted(module.id) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .font(.title3)
                } else {
                    Image(systemName: module.icon)
                        .foregroundStyle(.blue)
                        .font(.body)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Module \(module.id)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(module.title)
                    .font(.body.weight(.medium))
                Text("\(module.topics.count) topics")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if progress.isBookmarked(module.id) {
                Image(systemName: "bookmark.fill")
                    .foregroundStyle(.blue)
                    .font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}
