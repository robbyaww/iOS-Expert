import Foundation

// MARK: - Data Models

struct Phase: Identifiable {
    let id: Int
    let title: String
    let description: String
    let explanation: String
    let modules: [Module]
    let icon: String
}

struct Module: Identifiable {
    let id: Int
    let title: String
    let explanation: String
    let topics: [String]
    let miniProject: String
    let bigTechTip: String
    let codeExample: CodeExample?
    let references: [Reference]
    let icon: String
}

struct CodeExample: Sendable {
    let title: String
    let code: String
    let explanation: String
}

struct Reference: Identifiable {
    let id = UUID()
    let type: ReferenceType
    let title: String
    let description: String
    let url: String

    enum ReferenceType: String {
        case youtube = "YouTube"
        case web = "Web"
        case medium = "Medium"
        case blog = "Blog"
        case course = "Course"
        case book = "Book"

        var icon: String {
            switch self {
            case .youtube: "play.rectangle.fill"
            case .web: "globe"
            case .medium: "doc.richtext"
            case .blog: "text.book.closed"
            case .course: "graduationcap.fill"
            case .book: "book.fill"
            }
        }

        var color: String {
            switch self {
            case .youtube: "red"
            case .web: "blue"
            case .medium: "green"
            case .blog: "orange"
            case .course: "purple"
            case .book: "brown"
            }
        }
    }
}

// MARK: - Progress Tracking

@Observable
final class LearningProgress {
    private let completedKey = "completedModules"
    private let bookmarkedKey = "bookmarkedModules"

    var completedModules: Set<Int> {
        didSet { save(completedModules, forKey: completedKey) }
    }

    var bookmarkedModules: Set<Int> {
        didSet { save(bookmarkedModules, forKey: bookmarkedKey) }
    }

    var totalModules: Int { 30 }

    var completionPercentage: Double {
        Double(completedModules.count) / Double(totalModules)
    }

    var currentStreak: Int {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        guard let dates = UserDefaults.standard.array(forKey: "studyDates") as? [Date] else {
            return 0
        }
        var streak = 0
        var checkDate = today
        for _ in 0..<365 {
            if dates.contains(where: { calendar.isDate($0, inSameDayAs: checkDate) }) {
                streak += 1
                guard let previous = calendar.date(byAdding: .day, value: -1, to: checkDate) else { break }
                checkDate = previous
            } else {
                break
            }
        }
        return streak
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: completedKey),
           let decoded = try? JSONDecoder().decode(Set<Int>.self, from: data) {
            self.completedModules = decoded
        } else {
            self.completedModules = []
        }
        if let data = UserDefaults.standard.data(forKey: bookmarkedKey),
           let decoded = try? JSONDecoder().decode(Set<Int>.self, from: data) {
            self.bookmarkedModules = decoded
        } else {
            self.bookmarkedModules = []
        }
    }

    func toggleComplete(_ moduleId: Int) {
        if completedModules.contains(moduleId) {
            completedModules.remove(moduleId)
        } else {
            completedModules.insert(moduleId)
            recordStudyDate()
        }
    }

    func toggleBookmark(_ moduleId: Int) {
        if bookmarkedModules.contains(moduleId) {
            bookmarkedModules.remove(moduleId)
        } else {
            bookmarkedModules.insert(moduleId)
        }
    }

    func isCompleted(_ moduleId: Int) -> Bool {
        completedModules.contains(moduleId)
    }

    func isBookmarked(_ moduleId: Int) -> Bool {
        bookmarkedModules.contains(moduleId)
    }

    private func save(_ set: Set<Int>, forKey key: String) {
        if let data = try? JSONEncoder().encode(set) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func recordStudyDate() {
        var dates = UserDefaults.standard.array(forKey: "studyDates") as? [Date] ?? []
        let today = Calendar.current.startOfDay(for: Date())
        if !dates.contains(where: { Calendar.current.isDate($0, inSameDayAs: today) }) {
            dates.append(today)
            UserDefaults.standard.set(dates, forKey: "studyDates")
        }
    }
}
