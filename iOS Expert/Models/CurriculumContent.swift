import Foundation

// MARK: - Curriculum Factory

enum CurriculumContent {
    static let phases: [Phase] = [
        phase1, phase2, phase3, phase4, phase5, phase6
    ]

    // MARK: - Phase 1: Foundation

    private static let phase1 = Phase(
        id: 1,
        title: "Foundation",
        description: "Master Swift language fundamentals and Xcode tooling.",
        explanation: "This phase is about building an unshakeable foundation in the Swift programming language. You'll learn how Swift thinks — its type system, its emphasis on safety through optionals, and its preference for value types. Don't rush through this phase; every advanced topic you'll encounter later builds directly on these concepts. Big tech interviewers frequently test fundamentals because they reveal how deeply you understand the tools you use every day.",
        modules: [
            Module(
                id: 1,
                title: "Swift Language Essentials",
                explanation: "Swift is a modern, type-safe language designed by Apple as the primary language for all Apple platforms. It was introduced in 2014 and has evolved rapidly — the current version, Swift 6, introduces strict concurrency checking that catches data races at compile time. As a beginner, you'll start with the building blocks: how to declare variables and constants, work with basic data types, and handle the concept of \"optional\" values — a core Swift feature that forces you to explicitly handle cases where a value might be missing. This is one of Swift's superpowers: it eliminates an entire class of bugs (null pointer exceptions) that plague other languages. Understanding optionals deeply will set you apart in interviews and in real codebases.",
                topics: [
                    "Variables, constants (let vs var)",
                    "Basic types: Int, Double, String, Bool",
                    "String interpolation & multi-line strings",
                    "Type inference & type annotations",
                    "Tuples & type aliases",
                    "Optionals: Optional<T>, if let, guard let, nil-coalescing (??)",
                    "Optional chaining",
                    "Comments & documentation comments (///)"
                ],
                miniProject: "Build a CLI temperature converter (Celsius ↔ Fahrenheit ↔ Kelvin)",
                bigTechTip: "Interviewers expect you to handle optionals safely. Never force-unwrap in interviews.",
                codeExample: CodeExample(
                    title: "Optionals & Safe Unwrapping",
                    code: """
                    // Safe optional handling
                    let name: String? = "Swift"

                    // if let binding
                    if let unwrapped = name {
                        print("Hello, \\(unwrapped)")
                    }

                    // guard let for early exit
                    func greet(_ name: String?) {
                        guard let name else {
                            print("No name provided")
                            return
                        }
                        print("Hello, \\(name)")
                    }

                    // Nil-coalescing
                    let displayName = name ?? "Anonymous"

                    // Optional chaining
                    let count = name?.count  // Int?
                    """,
                    explanation: "Always use safe unwrapping patterns. guard let is preferred in functions for early exit. Never use force unwrap (!) in production code."
                ),
                references: [
                    Reference(type: .youtube, title: "CodeWithChris — Swift Tutorial for Beginners", description: "The largest dedicated iOS tutorial channel, Chris walks through Swift basics with a hands-on project approach.", url: "https://www.youtube.com/c/CodeWithChris"),
                    Reference(type: .youtube, title: "Sean Allen — Swift Fundamentals", description: "Senior iOS engineer in Silicon Valley sharing 3 videos per week about Swift and iOS development.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "The Swift Programming Language (Official Book)", description: "Apple's own comprehensive guide to the Swift language. Free and always up to date.", url: "https://docs.swift.org/swift-book/"),
                    Reference(type: .web, title: "Hacking with Swift — 100 Days of SwiftUI (Days 1–14)", description: "Paul Hudson's beloved community course that takes a day-by-day approach to learning Swift and SwiftUI.", url: "https://www.hackingwithswift.com/100/swiftui"),
                    Reference(type: .course, title: "Stanford CS193p Spring 2025 — Lecture 1 & 2", description: "Stanford's free iOS development course, all 16 lectures available on YouTube. The gold standard for learning iOS development academically.", url: "https://cs193p.stanford.edu/")
                ],
                icon: "swift"
            ),
            Module(
                id: 2,
                title: "Control Flow & Collections",
                explanation: "Once you know how to store data, you need to know how to make decisions and work with groups of data. Swift's control flow is elegant — switch statements support powerful pattern matching that goes far beyond simple value comparison. You can match ranges, tuples, and even bind values inside cases. Collections — Arrays, Sets, and Dictionaries — are your daily workhorses. Understanding their performance characteristics (why Dictionary lookup is O(1) but Array search is O(n)) will directly impact your ability to solve interview problems efficiently. Higher-order functions like map, filter, and reduce let you write expressive, functional-style code that is both readable and performant. Master these and your code will look professional from day one.",
                topics: [
                    "if / else / else if",
                    "switch (pattern matching, value binding, where clauses)",
                    "for-in loops, while, repeat-while",
                    "stride(from:to:by:), stride(from:through:by:)",
                    "Array, Set, Dictionary — creation, mutation, iteration",
                    "Higher-order functions: map, filter, reduce, compactMap, flatMap",
                    "Ranges: ClosedRange, Range, one-sided ranges",
                    "Labeled statements, fallthrough, break, continue"
                ],
                miniProject: "Build a CLI contact book with search, add, delete using Dictionary",
                bigTechTip: "Know the time complexity of collection operations. Array append = O(1) amortized, Dictionary lookup = O(1) average.",
                codeExample: CodeExample(
                    title: "Pattern Matching & Higher-Order Functions",
                    code: """
                    // Switch with pattern matching
                    let statusCode = 404
                    switch statusCode {
                    case 200..<300:
                        print("Success")
                    case 400:
                        print("Bad Request")
                    case 404:
                        print("Not Found")
                    case 500...:
                        print("Server Error")
                    default:
                        print("Unknown")
                    }

                    // Higher-order functions
                    let numbers = [1, 2, 3, 4, 5, 6]
                    let evenSquares = numbers
                        .filter { $0.isMultiple(of: 2) }
                        .map { $0 * $0 }
                    // [4, 16, 36]
                    """,
                    explanation: "Swift's switch is exhaustive and supports powerful pattern matching. Higher-order functions enable concise, readable collection transformations."
                ),
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Swift Collections", description: "Practical walkthroughs on how collections work under the hood.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "CodeWithChris — Swift Arrays, Dictionaries, and Sets", description: "Beginner-friendly explanations with visual examples.", url: "https://www.youtube.com/c/CodeWithChris"),
                    Reference(type: .web, title: "Hacking with Swift — Arrays, Sets, Dictionaries", description: "Paul Hudson's free introduction to Swift covering all collection types.", url: "https://www.hackingwithswift.com/read/0/overview"),
                    Reference(type: .web, title: "Swift.org — Collection Types", description: "Official documentation with code examples and performance notes.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes"),
                    Reference(type: .web, title: "Swift API Design Guidelines", description: "Learn to name things the Swift way from day one.", url: "https://www.swift.org/documentation/api-design-guidelines/")
                ],
                icon: "arrow.triangle.branch"
            ),
            Module(
                id: 3,
                title: "Functions, Closures & Enums",
                explanation: "Functions are the fundamental building blocks of any program, and Swift makes them extremely flexible with features like argument labels, default values, and variadic parameters. But the real power comes with closures — anonymous functions that can capture and store references to variables from their surrounding context. Closures are everywhere in iOS development: in completion handlers, in SwiftUI view builders, in animation blocks, and in collection methods like map and filter. Understanding closure capture semantics — especially the difference between strong, weak, and unowned captures — is critical because getting it wrong causes memory leaks (retain cycles), one of the most common bugs in iOS apps. Enums in Swift are dramatically more powerful than in other languages; they can carry associated values, making them perfect for modeling states, errors, and results.",
                topics: [
                    "Function syntax, parameters (labels, default values, variadic, inout)",
                    "Return types, multiple return values via tuples",
                    "First-class functions, function types",
                    "Closures: syntax, trailing closure, shorthand ($0, $1)",
                    "Capturing values, capture lists, [weak self], [unowned self]",
                    "@escaping vs non-escaping closures",
                    "Enums: raw values, associated values, CaseIterable, Codable enums",
                    "Recursive enums (indirect)",
                    "Result<Success, Failure> type"
                ],
                miniProject: "Build a CLI calculator using enums for operations and closures for computation",
                bigTechTip: "Closure capture semantics and retain cycles are a TOP interview topic.",
                codeExample: CodeExample(
                    title: "Closures & Capture Lists",
                    code: """
                    // Closure with capture list
                    class DataLoader {
                        var data: [String] = []

                        func load(completion: @escaping () -> Void) {
                            // [weak self] prevents retain cycle
                            DispatchQueue.global().async { [weak self] in
                                guard let self else { return }
                                self.data = ["Item 1", "Item 2"]
                                completion()
                            }
                        }
                    }

                    // Enum with associated values
                    enum NetworkResult {
                        case success(Data)
                        case failure(Error)
                        case loading(progress: Double)
                    }
                    """,
                    explanation: "Use [weak self] in escaping closures to prevent retain cycles. Enums with associated values are a powerful way to model state."
                ),
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Closures in Swift", description: "One of the most-watched closure tutorials for iOS developers.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "Kavsoft — Swift Enums with Associated Values", description: "Clean, focused tutorials on Swift and SwiftUI features.", url: "https://www.youtube.com/c/Kavsoft"),
                    Reference(type: .web, title: "Swift by Sundell — Enums", description: "John Sundell's clear explanation of Swift enums and practical patterns.", url: "https://www.swiftbysundell.com/basics/enums/"),
                    Reference(type: .web, title: "Hacking with Swift — Closures", description: "Step-by-step closure tutorial from basics to advanced patterns.", url: "https://www.hackingwithswift.com/sixty/6/1/creating-basic-closures"),
                    Reference(type: .web, title: "Swift.org — Closures", description: "Official documentation on closures.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/")
                ],
                icon: "function"
            ),
            Module(
                id: 4,
                title: "Structs, Classes & Protocols",
                explanation: "This module covers one of the most fundamental decisions you'll make as a Swift developer: choosing between structs (value types) and classes (reference types). Swift encourages you to use structs by default — they're copied when passed around, making them inherently safer for concurrent code. Classes, on the other hand, are passed by reference, which means multiple parts of your code can point to and mutate the same instance. Understanding when to use each is a hallmark of a skilled Swift developer. Protocols are Swift's answer to interfaces, but they go much further with protocol extensions that provide default implementations. This enables \"Protocol-Oriented Programming\" (POP), a paradigm Apple champions. The some and any keywords (opaque vs. existential types) are newer additions that affect performance and API design — knowing the difference shows interviewers you're current with modern Swift.",
                topics: [
                    "Structs vs Classes (value vs reference semantics)",
                    "Properties: stored, computed, lazy, property observers (willSet, didSet)",
                    "Static & class properties/methods",
                    "Memberwise initializers, custom initializers, failable initializers",
                    "Inheritance, overriding, final",
                    "Protocols: requirements, default implementations, protocol extensions",
                    "Protocol composition (Protocol1 & Protocol2)",
                    "some vs any keywords (opaque vs existential types)",
                    "Noncopyable types (~Copyable) — Swift 6"
                ],
                miniProject: "Build a shape hierarchy using protocols (area, perimeter calculations)",
                bigTechTip: "\"Struct vs Class — when do you use each?\" is one of the most common iOS interview questions.",
                codeExample: CodeExample(
                    title: "Protocols & Value Types",
                    code: """
                    protocol Shape {
                        var area: Double { get }
                        var perimeter: Double { get }
                    }

                    extension Shape {
                        func describe() -> String {
                            "Area: \\(area), Perimeter: \\(perimeter)"
                        }
                    }

                    struct Circle: Shape {
                        let radius: Double
                        var area: Double { .pi * radius * radius }
                        var perimeter: Double { 2 * .pi * radius }
                    }

                    // Protocol composition
                    protocol Drawable { func draw() }
                    func render(_ shape: some Shape & Drawable) {
                        shape.draw()
                    }
                    """,
                    explanation: "Prefer structs (value types) by default. Use protocols for abstraction. 'some' gives better performance than 'any' for opaque types."
                ),
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Struct vs Class in Swift", description: "Clear comparison with real-world iOS examples.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "Lets Build That App — Protocol Oriented Programming", description: "Brian Voong demonstrates POP with practical projects.", url: "https://www.youtube.com/c/LetsBuildThatApp"),
                    Reference(type: .web, title: "Apple WWDC 2015 — Protocol-Oriented Programming in Swift", description: "The famous WWDC talk that introduced POP to the world.", url: "https://developer.apple.com/videos/play/wwdc2015/408/"),
                    Reference(type: .course, title: "Stanford CS193p — Lecture 3: MVVM and the Swift Type System", description: "Covers how structs, classes, and protocols work together in real app architecture.", url: "https://cs193p.stanford.edu/"),
                    Reference(type: .web, title: "Swift.org — Protocols", description: "Official protocol documentation.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/")
                ],
                icon: "cube"
            ),
            Module(
                id: 5,
                title: "Generics, Error Handling & Memory",
                explanation: "Generics let you write flexible, reusable code that works with any type while still being type-safe — they're behind most of Swift's standard library (Array<Element>, Dictionary<Key, Value>, Optional<Wrapped>). Error handling in Swift uses a structured do-try-catch pattern, and Swift 6 introduces typed throws, letting you specify exactly which error types a function can throw. But perhaps the most interview-critical topic in this module is memory management via ARC (Automatic Reference Counting). ARC automatically frees memory when there are no more strong references to an object, but it can't detect circular references (retain cycles). Understanding strong, weak, and unowned references — and when to use each — is essential. Memory leaks from retain cycles are one of the most common bugs in production iOS apps, and interviewers love testing this knowledge.",
                topics: [
                    "Generic functions & types",
                    "Type constraints (where clauses)",
                    "Associated types in protocols",
                    "Error handling: do-try-catch, throwing functions",
                    "Typed throws (Swift 6): func foo() throws(MyError)",
                    "Custom error types conforming to LocalizedError",
                    "ARC (Automatic Reference Counting)",
                    "Strong, weak, unowned references",
                    "Retain cycles & how to break them",
                    "Copy-on-Write semantics"
                ],
                miniProject: "Build a generic Cache<Key: Hashable, Value> with expiration",
                bigTechTip: "Draw retain cycle diagrams in interviews. Know delegate = weak, closure captures need [weak self].",
                codeExample: CodeExample(
                    title: "Generics & ARC",
                    code: """
                    // Generic type with constraints
                    struct Cache<Key: Hashable, Value> {
                        private var storage: [Key: (value: Value, expiry: Date)] = [:]

                        mutating func set(_ value: Value, forKey key: Key,
                                          ttl: TimeInterval = 300) {
                            storage[key] = (value, Date().addingTimeInterval(ttl))
                        }

                        func get(_ key: Key) -> Value? {
                            guard let entry = storage[key],
                                  entry.expiry > Date() else { return nil }
                            return entry.value
                        }
                    }

                    // Retain cycle example
                    class Parent {
                        var child: Child?
                    }
                    class Child {
                        weak var parent: Parent?  // weak breaks the cycle
                    }
                    """,
                    explanation: "Generics enable reusable, type-safe code. Use weak references to break retain cycles between objects that reference each other."
                ),
                references: [
                    Reference(type: .youtube, title: "Sean Allen — ARC & Memory Management in Swift", description: "Visual explanation of retain cycles with Xcode examples.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "CodeWithChris — Swift Generics Explained", description: "Beginner-friendly generics walkthrough.", url: "https://www.youtube.com/c/CodeWithChris"),
                    Reference(type: .web, title: "Hacking with Swift — Understanding ARC", description: "Practical examples of retain cycles and how to fix them.", url: "https://www.hackingwithswift.com/swift/5.1/opaque-return-types"),
                    Reference(type: .web, title: "Swift.org — Automatic Reference Counting", description: "Official documentation with detailed diagrams.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"),
                    Reference(type: .web, title: "Swift.org — Generics", description: "Official generics documentation.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/")
                ],
                icon: "memorychip"
            ),
            Module(
                id: 6,
                title: "Xcode Mastery & Developer Tools",
                explanation: "Xcode is your IDE, debugger, profiler, and deployment tool all in one. Mastering it dramatically increases your productivity. Beyond the basics of creating projects and writing code, you need to understand build configurations, schemes, and targets — especially when working on multi-module apps. Swift Package Manager (SPM) is now the standard way to manage dependencies and organize code into modules. Debugging skills are equally important: knowing how to set conditional breakpoints, use LLDB commands, and profile your app with Instruments (for memory leaks, CPU usage, and rendering performance) separates professional developers from hobbyists. At big tech companies, performance profiling is a regular part of the development cycle, not an afterthought.",
                topics: [
                    "Xcode workspace, project, target, scheme, configuration",
                    "Build settings & build phases",
                    "Swift Package Manager: adding, creating packages",
                    "Debugging: breakpoints (conditional, symbolic, exception)",
                    "LLDB commands",
                    "Instruments: Time Profiler, Allocations, Leaks",
                    "Xcode Previews for SwiftUI",
                    "Accessibility Inspector",
                    "Source control integration (Git in Xcode)",
                    "Xcode shortcuts & productivity tips"
                ],
                miniProject: "Set up a multi-module iOS project with SPM local packages",
                bigTechTip: "Know how to profile an app with Instruments. Performance questions are common at Apple & Meta.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Xcode Tips & Tricks", description: "Productivity shortcuts and debugging techniques.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "CodeWithChris — Xcode Tutorial for Beginners", description: "Complete walkthrough of the Xcode interface and workflow.", url: "https://www.youtube.com/c/CodeWithChris"),
                    Reference(type: .web, title: "Apple — Xcode Documentation", description: "Official guide to all Xcode features.", url: "https://developer.apple.com/documentation/xcode"),
                    Reference(type: .web, title: "Apple WWDC — Getting Started with Instruments", description: "WWDC session on profiling iOS apps.", url: "https://developer.apple.com/videos/play/wwdc2019/411/"),
                    Reference(type: .web, title: "Hacking with Swift — How to Create a Swift Package", description: "Practical guide to SPM.", url: "https://www.hackingwithswift.com/articles/146/how-to-create-a-swift-package-using-xcode")
                ],
                icon: "hammer"
            )
        ],
        icon: "1.square.fill"
    )

    // MARK: - Phase 2: SwiftUI & App Architecture

    private static let phase2 = Phase(
        id: 2,
        title: "SwiftUI & App Architecture",
        description: "Build modern, production-quality UIs with proper architecture.",
        explanation: "SwiftUI is Apple's declarative UI framework — instead of telling the system step-by-step how to update the screen (imperative, like UIKit), you describe what the screen should look like for a given state and SwiftUI handles the rest. This phase covers everything from basic views to complex navigation, state management, and app architecture patterns used at scale. Architecture matters because big tech codebases have dozens of engineers working on the same app — without clear patterns, the code becomes unmanageable.",
        modules: [
            Module(
                id: 7,
                title: "SwiftUI Fundamentals",
                explanation: "SwiftUI was introduced in 2019 and has matured significantly through iOS 17 and 18. At its core, every SwiftUI view conforms to the View protocol and has a body property that returns the view hierarchy. Views are value types (structs), which means they're lightweight and cheap to create — SwiftUI recreates them frequently to keep the UI in sync with your data. You'll learn the fundamental building blocks: text, images, buttons, stacks (VStack, HStack, ZStack), lists, and modifiers. The @State property wrapper is your first introduction to SwiftUI's reactive data flow — when state changes, the view automatically re-renders. Understanding that SwiftUI views are descriptions of UI (not the UI objects themselves) is the key mental shift from UIKit.",
                topics: [
                    "View protocol & body property",
                    "Text, Image, Button, Toggle, Slider, TextField, SecureField",
                    "Stacks: VStack, HStack, ZStack, LazyVStack, LazyHStack",
                    "Spacer, Divider, padding, frame, background, overlay",
                    "@State, @Binding — local state management",
                    "ForEach, List, ScrollView",
                    "Shapes: Rectangle, Circle, Capsule, custom shapes (Path)",
                    "ViewModifiers: built-in & custom",
                    "@ViewBuilder"
                ],
                miniProject: "Build a profile card UI with dynamic content",
                bigTechTip: "Understand SwiftUI's diffing algorithm. Views are value types — identity matters.",
                codeExample: CodeExample(
                    title: "SwiftUI View Basics",
                    code: """
                    struct ProfileCard: View {
                        @State private var isExpanded = false

                        var body: some View {
                            VStack(spacing: 16) {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 80))
                                    .foregroundStyle(.blue)

                                Text("John Doe")
                                    .font(.title2.bold())

                                if isExpanded {
                                    Text("iOS Developer")
                                        .foregroundStyle(.secondary)
                                }

                                Button(isExpanded ? "Less" : "More") {
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    """,
                    explanation: "SwiftUI views are lightweight value types. @State manages local mutable state. Use withAnimation for smooth transitions."
                ),
                references: [
                    Reference(type: .youtube, title: "CodeWithChris — SwiftUI Tutorial for Beginners", description: "The largest dedicated iOS tutorial channel with step-by-step SwiftUI projects.", url: "https://www.youtube.com/c/CodeWithChris"),
                    Reference(type: .youtube, title: "Kavsoft — SwiftUI UI Design Tutorials", description: "Beautiful SwiftUI UI builds with animations. Focused purely on SwiftUI.", url: "https://www.youtube.com/c/Kavsoft"),
                    Reference(type: .youtube, title: "Sean Allen — SwiftUI Fundamentals Course", description: "Free SwiftUI course building 4 apps from simple to complex.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .course, title: "Stanford CS193p Spring 2025", description: "All 16 lectures free. Builds a card-matching game (Memorize) from scratch using SwiftUI.", url: "https://cs193p.stanford.edu/"),
                    Reference(type: .web, title: "Hacking with Swift — 100 Days of SwiftUI", description: "The most recommended free SwiftUI course by the iOS developer community. 19+ apps built over 100 days.", url: "https://www.hackingwithswift.com/100/swiftui"),
                    Reference(type: .web, title: "Apple — SwiftUI Tutorials", description: "Apple's official step-by-step tutorials building a Landmarks app.", url: "https://developer.apple.com/tutorials/swiftui")
                ],
                icon: "rectangle.on.rectangle"
            ),
            Module(
                id: 8,
                title: "Advanced SwiftUI",
                explanation: "Once you're comfortable with basic views, it's time to build real app experiences. Navigation is one of the most important (and historically tricky) parts of SwiftUI. The modern approach uses NavigationStack with navigationDestination modifiers — this replaced the deprecated NavigationView and gives you type-safe, programmatic navigation via NavigationPath. For iPad and larger screens, NavigationSplitView provides multi-column layouts. You'll also learn sheets, alerts, and confirmation dialogs for modal presentations. Animations in SwiftUI are remarkably powerful and declarative — withAnimation, matchedGeometryEffect, and phaseAnimator let you create fluid transitions with minimal code. Gesture handling (taps, drags, long presses) makes your apps feel interactive and alive.",
                topics: [
                    "NavigationStack, NavigationLink, navigationDestination",
                    "NavigationSplitView (iPad / multi-column)",
                    "NavigationPath for programmatic navigation",
                    "TabView, TabSection (iOS 18+)",
                    "Sheets, fullScreenCover, popover, confirmationDialog, alert",
                    "@Environment, @EnvironmentObject, custom EnvironmentKeys",
                    "Preferences (PreferenceKey, GeometryReader)",
                    "Animation: withAnimation, matchedGeometryEffect, transition",
                    "Gesture: TapGesture, LongPressGesture, DragGesture",
                    "SF Symbols & custom assets"
                ],
                miniProject: "Build a multi-tab recipe app with navigation and animations",
                bigTechTip: "NavigationStack + navigationDestination is the modern pattern. Avoid deprecated NavigationView.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Kavsoft — Advanced SwiftUI Animations", description: "Complex animation tutorials that push SwiftUI's boundaries.", url: "https://www.youtube.com/c/Kavsoft"),
                    Reference(type: .youtube, title: "Sean Allen — SwiftUI Navigation", description: "Covers NavigationStack, programmatic navigation, and deep linking.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple WWDC 2022 — The SwiftUI Cookbook for Navigation", description: "Official session introducing NavigationStack.", url: "https://developer.apple.com/videos/play/wwdc2022/10054/"),
                    Reference(type: .web, title: "Hacking with Swift — SwiftUI Navigation", description: "Practical navigation patterns with code examples.", url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-programmatic-navigation-in-swiftui"),
                    Reference(type: .web, title: "Swift by Sundell — Navigating SwiftUI", description: "Deep dive into navigation architecture patterns.", url: "https://www.swiftbysundell.com/articles/swiftui-navigation/")
                ],
                icon: "sidebar.squares.leading"
            ),
            Module(
                id: 9,
                title: "State Management & Data Flow",
                explanation: "State management is the heart of any SwiftUI app. In iOS 17, Apple introduced the @Observable macro (from the Observation framework), which is a major improvement over the older ObservableObject protocol. With @Observable, SwiftUI tracks exactly which properties a view reads and only re-renders when those specific properties change — far more efficient than ObservableObject which triggered updates for any @Published property change. Understanding the full state management toolkit (@State for local state, @Binding for parent-child, @Observable for shared state, @Environment for dependency injection) and knowing the \"single source of truth\" principle is essential. The swift-dependencies library by Point-Free provides a clean, testable way to inject dependencies throughout your app.",
                topics: [
                    "@State, @Binding — review & deep dive",
                    "@Observable macro (Observation framework — iOS 17+)",
                    "@Bindable for Observable objects",
                    "@Environment(\\.modelContext) for SwiftData",
                    "Migrating from ObservableObject → @Observable",
                    "Single source of truth principle",
                    "Unidirectional data flow",
                    "Dependency injection patterns",
                    "swift-dependencies library by Point-Free",
                    "State restoration (@SceneStorage, @AppStorage)"
                ],
                miniProject: "Build a todo app demonstrating all state management patterns",
                bigTechTip: "Explain the difference between @Observable and ObservableObject. Know why Apple moved away from Combine-based observation.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — @Observable vs ObservableObject", description: "Compares old and new observation patterns.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .course, title: "Stanford CS193p — Lectures on MVVM and State", description: "Covers @State, @Binding, @ObservedObject, and the principles of data flow.", url: "https://cs193p.stanford.edu/"),
                    Reference(type: .web, title: "Apple WWDC 2023 — Discover Observation in SwiftUI", description: "Official session introducing @Observable.", url: "https://developer.apple.com/videos/play/wwdc2023/10149/"),
                    Reference(type: .web, title: "Point-Free — swift-dependencies", description: "The dependency injection library built for testable Swift apps.", url: "https://github.com/pointfreeco/swift-dependencies"),
                    Reference(type: .web, title: "Hacking with Swift — @Observable", description: "Practical guide to the new Observation framework.", url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-observable-objects-to-manage-state")
                ],
                icon: "arrow.triangle.2.circlepath"
            ),
            Module(
                id: 10,
                title: "App Architecture — MVVM + TCA",
                explanation: "At scale, you need architecture. MVVM (Model-View-ViewModel) is the most common pattern in SwiftUI apps — the ViewModel (now typically an @Observable class) holds business logic and state, keeping views thin and testable. But for larger apps, The Composable Architecture (TCA) by Point-Free offers a more structured approach. TCA enforces unidirectional data flow: user actions go into a Reducer, which produces new State and optional Effects (side effects like API calls). This makes every state change predictable and testable. TCA was designed over many episodes on Point-Free and provides excellent tooling for testing (TestStore), navigation, and dependency management. Many companies (including several major apps) use TCA in production. Learning both MVVM and TCA gives you flexibility — MVVM for simpler features, TCA when you need rigorous testability and composition.",
                topics: [
                    "Why architecture matters at scale",
                    "MVVM in SwiftUI: ViewModel as @Observable class",
                    "Coordinator pattern for navigation",
                    "The Composable Architecture (TCA) by Point-Free",
                    "Reducer, Store, ViewStore, Scope",
                    "Actions, State, Environment/Dependencies",
                    "Effects (async side effects)",
                    "Composition: combining reducers",
                    "Navigation in TCA",
                    "Testing reducers with TestStore"
                ],
                miniProject: "Build a counter + favorites list app using TCA with full test coverage",
                bigTechTip: "Big tech values testable architecture. TCA's test ergonomics are excellent talking points.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Point-Free — A Tour of the Composable Architecture", description: "Official TCA video series building an app from scratch by the creators Brandon Williams and Stephen Celis.", url: "https://www.pointfree.co/collections/composable-architecture/composable-architecture-1-0"),
                    Reference(type: .medium, title: "The Composable Architecture: Swift Guide to TCA", description: "Practical guide building a news app with TCA, covering reducers, composition, and modularization.", url: "https://medium.com/@dmitrylupich/the-composable-architecture-swift-guide-to-tca-c3bf9b2e86ef"),
                    Reference(type: .medium, title: "Getting Started with The Composable Architecture (TCA)", description: "Beginner-friendly introduction to TCA's core concepts: State, Action, Reducer, and Store.", url: "https://sabapathy7.medium.com/getting-started-with-the-composable-architecture-tca-7369f6ee4e4d"),
                    Reference(type: .web, title: "GitHub — swift-composable-architecture", description: "Official repository with extensive documentation, examples, and interactive tutorials.", url: "https://github.com/pointfreeco/swift-composable-architecture"),
                    Reference(type: .web, title: "Kodeco — Getting Started with The Composable Architecture", description: "Step-by-step tutorial building a GitHub repo viewer with TCA.", url: "https://www.kodeco.com/24550178-getting-started-with-the-composable-architecture"),
                    Reference(type: .web, title: "Lickability — How to Learn TCA", description: "Curated learning path for TCA from an agency that uses it in production.", url: "https://lickability.com/blog/how-to-learn-tca/"),
                    Reference(type: .web, title: "Bugfender — Learn Swift Composable Architecture", description: "Comprehensive guide covering when to use TCA vs simpler patterns.", url: "https://bugfender.com/blog/swift-composable-architecture/")
                ],
                icon: "building.columns"
            ),
            Module(
                id: 11,
                title: "Lists, Grids & Performance",
                explanation: "Most iOS apps center around displaying lists and grids of data — social feeds, product catalogs, settings screens. SwiftUI's List view provides built-in features like sections, swipe actions, pull-to-refresh, and searchable. For grid layouts, LazyVGrid and LazyHGrid with GridItem configurations give you Pinterest-style layouts. The \"lazy\" prefix is critical — it means SwiftUI only creates views as they scroll into view, essential for performance with large datasets. Understanding view identity (structural vs. explicit ID) is key to avoiding unnecessary re-renders. You'll also learn about pagination (infinite scrolling), skeleton loading states, and accessibility — VoiceOver support, Dynamic Type, and reduced motion preferences. Accessibility isn't optional at big tech companies; it's a requirement.",
                topics: [
                    "List: sections, swipe actions, pull-to-refresh, searchable",
                    "LazyVGrid, LazyHGrid, GridItem",
                    "Custom layouts (Layout protocol — iOS 16+)",
                    "Performance: view identity (id), equatable views",
                    "Avoiding unnecessary redraws",
                    "Task, task(id:) for async work in views",
                    "Pagination / infinite scrolling",
                    "Skeleton loading states",
                    "Empty states & error states",
                    "Accessibility: VoiceOver, Dynamic Type, reduce motion"
                ],
                miniProject: "Build an image grid gallery with pagination and pull-to-refresh",
                bigTechTip: "Explain how SwiftUI determines view identity (structural vs explicit). This trips up many candidates.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Kavsoft — SwiftUI Lazy Grids & Lists", description: "Beautiful grid layout tutorials with animations.", url: "https://www.youtube.com/c/Kavsoft"),
                    Reference(type: .youtube, title: "Sean Allen — SwiftUI Lists Deep Dive", description: "Covers searchable, pull-to-refresh, swipe actions.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple WWDC 2021 — Demystify SwiftUI", description: "Essential talk on view identity, lifetime, and dependencies.", url: "https://developer.apple.com/videos/play/wwdc2021/10022/"),
                    Reference(type: .web, title: "Apple — Accessibility in SwiftUI", description: "Official guide to making SwiftUI apps accessible.", url: "https://developer.apple.com/documentation/swiftui/accessibility"),
                    Reference(type: .web, title: "Hacking with Swift — SwiftUI Lists", description: "Practical list patterns and performance tips.", url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-list-of-dynamic-items")
                ],
                icon: "square.grid.3x3"
            ),
            Module(
                id: 12,
                title: "UIKit Interop & Legacy Skills",
                explanation: "Despite SwiftUI's rapid advancement, the reality is that most large iOS codebases at big tech companies are hybrid — they have years of UIKit code alongside newer SwiftUI features. You need to be comfortable in both worlds. UIViewRepresentable and UIViewControllerRepresentable let you wrap UIKit views for use in SwiftUI, while UIHostingController lets you embed SwiftUI views inside UIKit. Understanding the UIKit basics — view controller lifecycle (viewDidLoad, viewWillAppear, viewDidDisappear), UITableView, UICollectionView, and Auto Layout — is still essential for interviews and for working with existing code. The Coordinator pattern bridges UIKit's delegate-based communication with SwiftUI's declarative approach.",
                topics: [
                    "UIViewRepresentable & UIViewControllerRepresentable",
                    "Coordinator pattern for UIKit delegates",
                    "Hosting SwiftUI in UIKit (UIHostingController)",
                    "UIKit fundamentals: UIViewController lifecycle",
                    "UITableView, UICollectionView",
                    "Auto Layout basics (constraints, stack views)",
                    "Diffable Data Source",
                    "Migrating UIKit apps to SwiftUI incrementally"
                ],
                miniProject: "Wrap a UIKit map view (MKMapView) in SwiftUI with annotations",
                bigTechTip: "Most big tech codebases are hybrid UIKit + SwiftUI. Interop skills are essential.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — UIKit Fundamentals for iOS Interviews", description: "Covers view controller lifecycle, UITableView, and Auto Layout.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "Lets Build That App — UIKit Projects", description: "Brian Voong builds real-world apps with UIKit including YouTube, Facebook Messenger clones.", url: "https://www.youtube.com/c/LetsBuildThatApp"),
                    Reference(type: .web, title: "Apple — Interfacing with UIKit", description: "Official tutorial on UIViewRepresentable and UIViewControllerRepresentable.", url: "https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit"),
                    Reference(type: .web, title: "Hacking with Swift — UIKit to SwiftUI Migration", description: "Practical guide to wrapping UIKit components.", url: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-wrap-a-custom-uiview-for-swiftui"),
                    Reference(type: .web, title: "Swift by Sundell — Hosting SwiftUI in UIKit", description: "Patterns for incremental SwiftUI adoption.", url: "https://www.swiftbysundell.com/articles/swiftui-and-uikit-interoperability/")
                ],
                icon: "uiwindow.split.2x1"
            )
        ],
        icon: "2.square.fill"
    )

    // MARK: - Phase 3: Data, Networking & Persistence

    private static let phase3 = Phase(
        id: 3,
        title: "Data, Networking & Persistence",
        description: "Handle real-world data — networking, caching, persistence.",
        explanation: "Real apps need to fetch data from servers, store it locally, work offline, and sync in the background. This phase covers the modern async/await-based approach to concurrency, networking best practices, SwiftData for persistence, and the still-relevant Combine framework for legacy codebases. These skills are non-negotiable for any iOS role.",
        modules: [
            Module(
                id: 13,
                title: "Swift Concurrency Deep Dive",
                explanation: "Swift Concurrency, introduced in Swift 5.5 and fully matured in Swift 6, is a paradigm shift in how iOS apps handle asynchronous operations. Instead of callback hell and GCD queue juggling, you write async/await code that reads like synchronous code but runs asynchronously. Task and TaskGroup provide structured concurrency — child tasks are automatically cancelled when their parent is cancelled, eliminating a whole class of resource-leak bugs. Actors provide data isolation: they guarantee that only one task accesses their mutable state at a time, preventing data races at compile time. @MainActor ensures UI updates happen on the main thread. Swift 6's strict concurrency checking makes these guarantees enforceable by the compiler. Understanding Sendable, AsyncSequence, and AsyncStream rounds out your ability to build safe, modern async code.",
                topics: [
                    "async/await fundamentals",
                    "Task, Task.detached, TaskGroup, ThrowingTaskGroup",
                    "Structured vs unstructured concurrency",
                    "Actors: actor keyword, @MainActor, GlobalActor",
                    "Sendable protocol & Sendable closures",
                    "AsyncSequence, AsyncStream, AsyncThrowingStream",
                    "Task cancellation & cooperative cancellation",
                    "withCheckedContinuation / withCheckedThrowingContinuation",
                    "Swift 6 strict concurrency: data race safety at compile time",
                    "Debugging concurrency with Thread Sanitizer"
                ],
                miniProject: "Build an async image downloader with progress using AsyncStream",
                bigTechTip: "\"Explain the actor model in Swift\" is a top-tier interview question. Know data isolation.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Swift Concurrency Explained", description: "Practical async/await, actors, and TaskGroup tutorials.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .medium, title: "Mastering Swift Concurrency: async/await, Tasks, Actors, Sendable", description: "Comprehensive guide with real-world examples covering every major concurrency feature.", url: "https://medium.com/@kumarsuraj19111997/mastering-swift-concurrency-async-await-tasks-actors-sendable-structured-concurrency-3dff135ce588"),
                    Reference(type: .medium, title: "Swift Concurrency Deep Dive: Beyond async/await", description: "Goes beyond basics into building production-grade concurrent systems with actors.", url: "https://medium.com/@dhrumilraval212/swift-concurrency-deep-dive-beyond-async-await-architecting-concurrent-systems-with-actors-and-0bc46f0bbb74"),
                    Reference(type: .medium, title: "Swift Concurrency Cheat Sheet", description: "Extensive reference covering async/await, actors, continuations, and Combine bridging.", url: "https://liudasbar.medium.com/the-new-world-of-swift-concurrency-a-deep-dive-into-async-await-actors-and-more-e03ee9a72450"),
                    Reference(type: .medium, title: "The Complete Guide to Swift Concurrency", description: "Comprehensive journey from GCD basics to advanced Swift 6 patterns.", url: "https://medium.com/@thakurneeshu280/the-complete-guide-to-swift-concurrency-from-threading-to-actors-in-swift-6-a9cf006a19ac"),
                    Reference(type: .web, title: "Apple WWDC 2021 — Meet async/await in Swift", description: "Official introduction from Apple.", url: "https://developer.apple.com/videos/play/wwdc2021/10132/"),
                    Reference(type: .web, title: "Apple WWDC 2022 — Eliminate data races using Swift Concurrency", description: "Deep dive into strict concurrency.", url: "https://developer.apple.com/videos/play/wwdc2022/110351/")
                ],
                icon: "arrow.2.squarepath"
            ),
            Module(
                id: 14,
                title: "Networking",
                explanation: "Networking is what makes apps come alive — fetching data from APIs, uploading user content, downloading files. In modern iOS, URLSession supports async/await directly, making network code clean and readable. You'll learn to construct URLRequest objects with proper headers, HTTP methods, and body content. Codable (Swift's encoding/decoding protocol) is your primary tool for converting between JSON and Swift types — mastering custom CodingKeys, date decoding strategies, and handling nested containers is essential. Beyond basic requests, production apps need pagination handling, retry logic, network reachability monitoring (via NWPathMonitor), and proper error handling. The key architectural insight is building a protocol-based API client that can be easily mocked for testing — this abstraction is what interviewers look for.",
                topics: [
                    "URLSession: async data, upload, download tasks",
                    "URLRequest: headers, methods, body, caching policy",
                    "Codable: encoding/decoding JSON, custom CodingKeys",
                    "JSONDecoder strategies: keyDecodingStrategy, dateDecodingStrategy",
                    "Handling pagination, rate limiting, retry logic",
                    "Network reachability (NWPathMonitor)",
                    "Certificate pinning basics",
                    "API abstraction layer: protocol-based networking client",
                    "Mocking network for tests",
                    "Charles Proxy / Proxyman for debugging"
                ],
                miniProject: "Build a GitHub user search app consuming the GitHub REST API",
                bigTechTip: "Design a protocol-based API client. Show you can abstract and test networking.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Networking in Swift with URLSession", description: "Building a complete networking layer with error handling.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "CodeWithChris — API Calls in SwiftUI", description: "Beginner-friendly REST API tutorial.", url: "https://www.youtube.com/c/CodeWithChris"),
                    Reference(type: .web, title: "Hacking with Swift — URLSession and Codable", description: "Practical networking with real API examples.", url: "https://www.hackingwithswift.com/read/7/overview"),
                    Reference(type: .web, title: "Swift by Sundell — Networking in Swift", description: "Advanced networking patterns.", url: "https://www.swiftbysundell.com/articles/networking-with-combine-and-swiftui/"),
                    Reference(type: .web, title: "Apple — URLSession Documentation", description: "Official reference for all URLSession capabilities.", url: "https://developer.apple.com/documentation/foundation/urlsession")
                ],
                icon: "network"
            ),
            Module(
                id: 15,
                title: "SwiftData & Persistence",
                explanation: "SwiftData, introduced at WWDC 2023 for iOS 17, is Apple's modern persistence framework that replaces the boilerplate-heavy Core Data with a Swift-native, declarative API. You define models using the @Model macro, query data with @Query and #Predicate, and manage context through ModelContext. It integrates seamlessly with SwiftUI — changes to persisted data automatically trigger view updates. Beyond SwiftData, you need to know the full persistence toolkit: UserDefaults / @AppStorage for simple preferences, Keychain for secure storage (tokens, credentials), and FileManager for file-system operations. Understanding when to use each storage mechanism — and the trade-offs between them — is a frequent interview topic.",
                topics: [
                    "SwiftData: @Model, ModelContainer, ModelContext",
                    "Schema: @Attribute, @Relationship, unique constraints",
                    "CRUD operations with SwiftData",
                    "Sorting & filtering with #Predicate",
                    "Migration strategies (lightweight, custom)",
                    "SwiftData + SwiftUI integration (@Query macro)",
                    "Core Data interop (when needed)",
                    "UserDefaults & @AppStorage for simple preferences",
                    "Keychain for secure storage",
                    "File system: FileManager, app sandbox"
                ],
                miniProject: "Build a journaling app with SwiftData (entries, tags, search)",
                bigTechTip: "Know when to use SwiftData vs Core Data vs UserDefaults vs Keychain. Each has a use case.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — SwiftData Tutorial", description: "Complete SwiftData walkthrough from setup to queries.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "CodeWithChris — The Ultimate Beginner's Guide to SwiftData", description: "Comprehensive guide covering @Model, ModelContainer, and SwiftUI integration.", url: "https://codewithchris.com/swift-data/"),
                    Reference(type: .medium, title: "A Beginner's Guide to SwiftData with a To-Do App", description: "Hands-on tutorial building a todo app step by step.", url: "https://medium.com/@jakir/a-beginners-guide-to-swiftdata-with-a-to-do-app-b84ba7146118"),
                    Reference(type: .medium, title: "The Art of SwiftData in 2025", description: "Advanced architecture patterns for using SwiftData cleanly at scale.", url: "https://medium.com/@matgnt/the-art-of-swiftdata-in-2025-from-scattered-pieces-to-a-masterpiece-1fd0cefd8d87"),
                    Reference(type: .medium, title: "SwiftData in Depth: Building a Modern Persistence Layer", description: "Production-ready guide covering models, queries, relationships, and migration strategies.", url: "https://medium.com/@rashadsh/swiftdata-in-depth-building-a-modern-persistence-layer-043566be7f86"),
                    Reference(type: .web, title: "Hacking with Swift — SwiftData by Example", description: "The world's largest collection of SwiftData examples, tips, and techniques.", url: "https://www.hackingwithswift.com/quick-start/swiftdata"),
                    Reference(type: .web, title: "Apple WWDC 2023 — Meet SwiftData", description: "Official introduction from Apple.", url: "https://developer.apple.com/videos/play/wwdc2023/10187/")
                ],
                icon: "externaldrive"
            ),
            Module(
                id: 16,
                title: "Combine Framework",
                explanation: "While Swift Concurrency (async/await) is the future, Combine — Apple's reactive programming framework introduced in 2019 — is still heavily used in production codebases at many big tech companies. Combine provides a Publisher-Subscriber pattern for processing values over time: network responses, user input, timer events, and notifications. Key operators like map, filter, flatMap, combineLatest, and debounce let you build complex data pipelines declaratively. Understanding @Published, PassthroughSubject, and CurrentValueSubject is necessary for working with ObservableObject-based code (the pre-iOS 17 pattern). Crucially, you need to know how to bridge between Combine and async/await using .values and Future — many codebases use both paradigms simultaneously.",
                topics: [
                    "Why learn Combine in 2025–2026 (legacy codebases)",
                    "Publishers & Subscribers",
                    "Common operators: map, filter, flatMap, combineLatest, merge, zip",
                    "Subjects: PassthroughSubject, CurrentValueSubject",
                    "@Published property wrapper",
                    "Error handling in Combine: catch, retry, replaceError",
                    "Bridging Combine ↔ async/await (.values, Future)",
                    "Memory management: AnyCancellable, store(in:)"
                ],
                miniProject: "Refactor the GitHub search app to use Combine (then compare with async/await)",
                bigTechTip: "Some big tech codebases (Uber, Airbnb) still use Combine heavily. Know both paradigms.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Combine Framework in Swift", description: "Practical Combine tutorials.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Hacking with Swift — Combine", description: "Practical Combine examples and operator guide.", url: "https://www.hackingwithswift.com/quick-start/combine"),
                    Reference(type: .web, title: "Apple — Combine Documentation", description: "Official reference.", url: "https://developer.apple.com/documentation/combine"),
                    Reference(type: .web, title: "Swift by Sundell — Combine", description: "Clear explanations of Combine patterns.", url: "https://www.swiftbysundell.com/basics/combine/"),
                    Reference(type: .web, title: "objc.io — Thinking in Combine", description: "Deep understanding of reactive patterns in Swift.", url: "https://www.objc.io/")
                ],
                icon: "link"
            ),
            Module(
                id: 17,
                title: "Caching, Offline & Background",
                explanation: "Users expect apps to work even with poor or no connectivity. Offline-first architecture means your app stores data locally and syncs when a connection is available. This requires thoughtful caching strategies: NSCache for in-memory image caching, URLCache for HTTP response caching, and custom disk caches for persistent storage. Background tasks (BGTaskScheduler) let your app refresh data or perform processing while it's not in the foreground. You'll also learn about push notifications (both local and remote via APNs), WidgetKit for home screen widgets, and how to manage app lifecycle through scene phases. These features transform a basic app into a polished, production-quality experience.",
                topics: [
                    "Image caching strategies (NSCache, disk cache)",
                    "URLCache & HTTP caching headers",
                    "Offline-first architecture patterns",
                    "Background tasks: BGTaskScheduler, BGAppRefreshTask",
                    "Background URLSession for downloads/uploads",
                    "Push notifications: local & remote (APNs)",
                    "UserNotifications framework",
                    "Widgets: WidgetKit, TimelineProvider",
                    "App lifecycle: scene phases"
                ],
                miniProject: "Build a news reader app with offline caching and background refresh",
                bigTechTip: "Offline-first thinking impresses interviewers. Describe cache invalidation strategies.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — iOS Background Tasks", description: "Background refresh and download sessions.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple WWDC — Advances in App Background Execution", description: "Official background tasks session.", url: "https://developer.apple.com/videos/play/wwdc2019/707/"),
                    Reference(type: .web, title: "Apple — WidgetKit Documentation", description: "Building iOS widgets.", url: "https://developer.apple.com/documentation/widgetkit"),
                    Reference(type: .web, title: "Hacking with Swift — Push Notifications", description: "Local and remote notification guide.", url: "https://www.hackingwithswift.com/read/21/overview"),
                    Reference(type: .web, title: "NSHipster — URLCache", description: "Deep dive into HTTP caching on iOS.", url: "https://nshipster.com/nsurlcache/")
                ],
                icon: "arrow.clockwise.icloud"
            ),
            Module(
                id: 18,
                title: "App Lifecycle, Deep Links & Extensions",
                explanation: "Understanding the full app lifecycle — from launch to termination — is essential for managing resources, restoring state, and handling interruptions gracefully. The @main attribute, App protocol, and ScenePhase environment give you hooks into every lifecycle event. Deep linking (Universal Links and custom URL schemes) lets users navigate directly to specific content in your app from the web, other apps, or notifications — critical for user engagement. App Intents framework powers Siri integration, Spotlight search, and Shortcuts. App extensions (widgets, share extensions, notification extensions) extend your app's functionality beyond the main app, with shared data managed through App Groups.",
                topics: [
                    "App lifecycle: @main, App protocol, Scene, WindowGroup",
                    "ScenePhase: active, inactive, background",
                    "Universal Links & custom URL schemes",
                    "Deep linking architecture",
                    "App Intents framework (Shortcuts, Siri, Spotlight)",
                    "Share extensions, widget extensions",
                    "App Groups for shared data between extensions",
                    "Handoff & continuity",
                    "App Clips basics"
                ],
                miniProject: "Add deep linking, Spotlight search, and a widget to the news reader app",
                bigTechTip: "Deep linking architecture is a system design interview topic. Know URL routing patterns.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — iOS Deep Linking", description: "Universal Links and URL scheme handling.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple — Supporting Universal Links", description: "Official deep linking guide.", url: "https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app"),
                    Reference(type: .web, title: "Apple — App Intents", description: "Siri, Shortcuts, and Spotlight integration.", url: "https://developer.apple.com/documentation/appintents"),
                    Reference(type: .web, title: "Apple — Creating a Widget Extension", description: "Official widget guide.", url: "https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension"),
                    Reference(type: .web, title: "Hacking with Swift — App Groups", description: "Sharing data between app and extensions.", url: "https://www.hackingwithswift.com/read/32/overview")
                ],
                icon: "link.badge.plus"
            )
        ],
        icon: "3.square.fill"
    )

    // MARK: - Phase 4: Advanced Topics

    private static let phase4 = Phase(
        id: 4,
        title: "Advanced Topics",
        description: "Master advanced iOS topics that differentiate senior engineers.",
        explanation: "These modules cover the skills that separate mid-level from senior iOS engineers. Advanced Swift language features, comprehensive testing strategies, performance optimization, security, modularization, and CI/CD — mastering these topics demonstrates the depth and breadth expected at big tech companies.",
        modules: [
            Module(
                id: 19,
                title: "Advanced Swift",
                explanation: "Swift 5.9+ and Swift 6 introduce powerful metaprogramming capabilities. Property wrappers (@propertyWrapper) let you add custom behavior to stored properties — you've already used @State and @Binding, which are property wrappers. Result builders (@resultBuilder) power SwiftUI's declarative syntax. Macros (freestanding and attached) generate code at compile time, reducing boilerplate — @Observable, @Model, and #Predicate are all macros. Understanding opaque types (some) vs existential types (any) and their performance implications shows deep language knowledge. Noncopyable types (~Copyable), new in Swift 6, provide ownership semantics similar to Rust, giving you precise control over resource lifetimes.",
                topics: [
                    "Property wrappers: @propertyWrapper, creating custom wrappers",
                    "Result builders (@resultBuilder)",
                    "Macros (Swift 5.9+): freestanding & attached macros",
                    "@Observable macro internals",
                    "Key paths (\\Type.property), key path member lookup",
                    "Opaque return types (some) vs existential types (any)",
                    "Noncopyable types (~Copyable) — ownership, consume, borrowing",
                    "Regular expressions: Swift Regex, RegexBuilder DSL",
                    "String processing: Unicode, grapheme clusters"
                ],
                miniProject: "Create a custom property wrapper for validated form fields + a simple macro",
                bigTechTip: "Macros and property wrappers show language mastery. Great for senior-level interviews.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Point-Free — Swift Macros", description: "Advanced Swift content from Brandon Williams and Stephen Celis.", url: "https://www.pointfree.co/"),
                    Reference(type: .web, title: "Apple WWDC 2023 — Write Swift Macros", description: "Official macro introduction.", url: "https://developer.apple.com/videos/play/wwdc2023/10166/"),
                    Reference(type: .web, title: "Hacking with Swift — Property Wrappers", description: "Practical property wrapper guide.", url: "https://www.hackingwithswift.com/swift/5.1/property-wrappers"),
                    Reference(type: .web, title: "Swift.org — Macros", description: "Official macro documentation.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/"),
                    Reference(type: .web, title: "Swift by Sundell — Result Builders", description: "Understanding the magic behind SwiftUI syntax.", url: "https://www.swiftbysundell.com/articles/deep-dive-into-swift-function-builders/")
                ],
                icon: "chevron.left.forwardslash.chevron.right"
            ),
            Module(
                id: 20,
                title: "Testing & Quality",
                explanation: "Testing is what makes architecture matter. Swift Testing (introduced at WWDC 2024) is Apple's modern testing framework using @Test, @Suite, #expect, and #require — cleaner syntax than XCTest. You'll learn unit testing best practices (Arrange-Act-Assert), testing async code, mocking dependencies with protocols, and TCA's TestStore for exhaustive reducer testing. UI testing with XCUITest verifies user flows end-to-end. Snapshot testing (using Point-Free's swift-snapshot-testing) catches visual regressions. Code coverage analysis and linting (SwiftLint, SwiftFormat) ensure code quality at scale. At big tech companies, tests aren't optional — many require 80%+ coverage and block merges on test failures.",
                topics: [
                    "Swift Testing framework: @Test, @Suite, #expect, #require",
                    "XCTest (legacy): XCTestCase, assertions, performance tests",
                    "Unit testing best practices: Arrange-Act-Assert",
                    "Testing async code",
                    "Testing TCA reducers with TestStore",
                    "Mocking & stubbing: protocols, dependency injection",
                    "UI Testing: XCUITest, accessibility identifiers",
                    "Snapshot testing (swift-snapshot-testing)",
                    "Code coverage & analysis",
                    "Linting: SwiftLint, SwiftFormat"
                ],
                miniProject: "Achieve 90%+ test coverage on the journaling app",
                bigTechTip: "Write tests in interviews. Even if not asked, mentioning testability shows senior thinking.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — iOS Unit Testing", description: "Practical testing tutorials.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple WWDC 2024 — Meet Swift Testing", description: "Official introduction to the new framework.", url: "https://developer.apple.com/videos/play/wwdc2024/10179/"),
                    Reference(type: .web, title: "Point-Free — swift-snapshot-testing", description: "Snapshot testing library.", url: "https://github.com/pointfreeco/swift-snapshot-testing"),
                    Reference(type: .web, title: "Hacking with Swift — Testing Swift", description: "XCTest fundamentals.", url: "https://www.hackingwithswift.com/read/39/overview"),
                    Reference(type: .web, title: "Apple — Testing Documentation", description: "Official testing guides.", url: "https://developer.apple.com/documentation/testing")
                ],
                icon: "checkmark.shield"
            ),
            Module(
                id: 21,
                title: "Performance & Optimization",
                explanation: "Performance is what separates good apps from great ones. Instruments is your primary tool: Time Profiler shows you where CPU time is spent, Allocations tracks memory usage, Leaks detects retain cycles, and the Core Animation instrument reveals rendering bottlenecks. For SwiftUI, performance means minimizing unnecessary body evaluations through proper view identity and Equatable conformance. Image optimization (downsampling large images, using thumbnails, progressive loading) dramatically reduces memory usage. App launch time optimization (reducing pre-main work, lazy loading) ensures users aren't waiting. At big tech companies, there are strict performance budgets — apps must launch within a certain time, maintain 60fps scrolling, and stay within memory limits.",
                topics: [
                    "Instruments deep dive: Time Profiler, Allocations, Leaks",
                    "SwiftUI performance: minimizing body evaluations",
                    "Image optimization: downsampling, thumbnail generation",
                    "Memory management: autoreleasepool, memory warnings",
                    "App launch time optimization: pre-main vs post-main",
                    "Reduce binary size: dead code stripping",
                    "Energy efficiency: CPU usage, location services",
                    "MetricKit & on-device diagnostics",
                    "Network performance: HTTP/2, compression",
                    "Animation performance: 60fps, offscreen rendering"
                ],
                miniProject: "Profile and optimize the news reader app — achieve < 2s cold launch",
                bigTechTip: "Performance optimization is a senior engineer skill. Know how to use Instruments fluently.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — iOS Performance Tips", description: "Practical profiling with Instruments.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple WWDC — Ultimate Application Performance Survival Guide", description: "Comprehensive performance session.", url: "https://developer.apple.com/videos/play/wwdc2021/10181/"),
                    Reference(type: .web, title: "Apple — MetricKit Documentation", description: "On-device performance diagnostics.", url: "https://developer.apple.com/documentation/metrickit"),
                    Reference(type: .web, title: "Apple WWDC — Demystify SwiftUI Performance", description: "SwiftUI-specific performance guidance.", url: "https://developer.apple.com/videos/play/wwdc2023/10160/"),
                    Reference(type: .web, title: "Hacking with Swift — Image Optimization", description: "Memory management and image optimization tips.", url: "https://www.hackingwithswift.com/read/0/overview")
                ],
                icon: "gauge.with.dots.needle.67percent"
            ),
            Module(
                id: 22,
                title: "Security & Privacy",
                explanation: "Security and privacy are non-negotiable in production apps, especially at big tech companies handling sensitive user data. Keychain Services is the proper way to store secrets (tokens, passwords) — never UserDefaults. Biometric authentication (Face ID / Touch ID via LocalAuthentication) provides secure, frictionless login. App Transport Security (ATS) enforces HTTPS, and SSL/TLS pinning adds an extra layer of protection against man-in-the-middle attacks. Privacy manifests (required since 2024) and required reason APIs ensure your app transparently declares what data it accesses and why. Understanding the OWASP Mobile Top 10 security risks and how to mitigate them in iOS shows security-conscious engineering.",
                topics: [
                    "App Transport Security (ATS)",
                    "Keychain Services: storing secrets securely",
                    "Biometric auth: Face ID / Touch ID (LocalAuthentication)",
                    "Data protection API (file encryption levels)",
                    "SSL/TLS pinning",
                    "Secure coding practices: input validation",
                    "Privacy: App Tracking Transparency, privacy manifests",
                    "Obfuscation & jailbreak detection basics",
                    "OWASP Mobile Top 10",
                    "Handling sensitive data in logs & crash reports"
                ],
                miniProject: "Add biometric login and Keychain token storage to the GitHub app",
                bigTechTip: "Security questions are common at fintech & big tech. Know Keychain, biometrics, and pinning.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Keychain and Biometric Auth", description: "Practical security implementations.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple — Keychain Services", description: "Official Keychain documentation.", url: "https://developer.apple.com/documentation/security/keychain_services"),
                    Reference(type: .web, title: "Apple — Privacy Manifests", description: "Required since 2024.", url: "https://developer.apple.com/documentation/bundleresources/privacy_manifest_files"),
                    Reference(type: .web, title: "OWASP — Mobile Top 10", description: "Standard mobile security risks.", url: "https://owasp.org/www-project-mobile-top-10/"),
                    Reference(type: .web, title: "Apple — LocalAuthentication", description: "Face ID / Touch ID integration.", url: "https://developer.apple.com/documentation/localauthentication")
                ],
                icon: "lock.shield"
            ),
            Module(
                id: 23,
                title: "Modularization & Scalable Architecture",
                explanation: "When an app grows to millions of lines of code with dozens of engineers, monolithic architecture becomes a bottleneck — build times slow down, merge conflicts multiply, and changes in one area unexpectedly break another. Modularization using SPM local packages solves this by splitting the app into independent feature modules with explicit dependency boundaries. Each module has its own public API (interface module), implementation, and tests. A clean dependency graph ensures modules don't have circular dependencies. Feature flags and A/B testing architecture allow gradual rollout of new features. A design system module provides reusable UI components and tokens. Analytics and logging abstraction layers ensure consistent instrumentation. This architectural approach is how every major tech company structures their iOS apps.",
                topics: [
                    "Monolith → modular architecture",
                    "SPM local packages for feature modules",
                    "Module dependency graph design",
                    "Interface modules (protocols) vs implementation modules",
                    "Build time optimization through modularity",
                    "Feature flags & A/B testing architecture",
                    "Dependency injection at scale (swift-dependencies)",
                    "Design system module: reusable components",
                    "Analytics abstraction layer",
                    "Logging & observability (OSLog)"
                ],
                miniProject: "Refactor the capstone app into 5+ SPM modules with clean dependency graph",
                bigTechTip: "\"How would you modularize a large iOS app?\" is a system design question at every big tech.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Point-Free — Modular Architecture", description: "Deep dives into SPM modules and dependency management.", url: "https://www.pointfree.co/"),
                    Reference(type: .web, title: "Apple WWDC — Creating Swift Packages", description: "Official SPM session.", url: "https://developer.apple.com/videos/play/wwdc2019/410/"),
                    Reference(type: .web, title: "Point-Free — swift-dependencies", description: "Dependency injection for modular apps.", url: "https://github.com/pointfreeco/swift-dependencies"),
                    Reference(type: .web, title: "Kodeco — Modular Architecture in iOS", description: "Practical modularization guide.", url: "https://www.kodeco.com/"),
                    Reference(type: .web, title: "Uber Engineering Blog", description: "How Uber structures their massive iOS codebase.", url: "https://eng.uber.com/")
                ],
                icon: "shippingbox"
            ),
            Module(
                id: 24,
                title: "CI/CD & Release Engineering",
                explanation: "Continuous Integration and Continuous Deployment (CI/CD) automate building, testing, and deploying your app. Xcode Cloud (Apple's native CI/CD) integrates directly with Xcode and App Store Connect. GitHub Actions provides more flexibility for custom workflows. Fastlane automates tedious tasks: match manages code signing, gym builds your app, pilot uploads to TestFlight, and deliver submits to the App Store. Understanding code signing (certificates, provisioning profiles) is essential — it's one of the most confusing parts of iOS development. TestFlight enables both internal and external beta testing. App Store review guidelines knowledge prevents rejection. At scale, CI/CD includes build time budgets, flaky test detection, and feature flag-based gradual rollouts.",
                topics: [
                    "Xcode Cloud: workflows, triggers, environments",
                    "GitHub Actions for iOS: build, test, lint, deploy",
                    "Fastlane: match, gym, pilot, deliver",
                    "Code signing: certificates, provisioning profiles",
                    "TestFlight: internal & external testing",
                    "App Store Connect: metadata, screenshots",
                    "App Store review tips & common rejection reasons",
                    "Versioning strategy: semantic versioning",
                    "Crash reporting: Xcode Organizer",
                    "Feature flags for gradual rollout"
                ],
                miniProject: "Set up a full CI/CD pipeline for the capstone app with Xcode Cloud",
                bigTechTip: "Knowing CI/CD shows you can operate at scale. Mention build time budgets and flaky test strategies.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Xcode Cloud & TestFlight", description: "CI/CD setup walkthrough.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Apple — Xcode Cloud", description: "Official Xcode Cloud documentation.", url: "https://developer.apple.com/xcode-cloud/"),
                    Reference(type: .web, title: "Fastlane Docs", description: "Complete Fastlane setup and usage guide.", url: "https://docs.fastlane.tools/"),
                    Reference(type: .web, title: "Apple — Code Signing Guide", description: "Understanding certificates and profiles.", url: "https://developer.apple.com/support/code-signing/"),
                    Reference(type: .web, title: "GitHub Actions for iOS", description: "Setting up iOS CI with GitHub Actions.", url: "https://github.com/features/actions")
                ],
                icon: "arrow.triangle.2.circlepath.circle"
            )
        ],
        icon: "4.square.fill"
    )

    // MARK: - Phase 5: Interview Prep

    private static let phase5 = Phase(
        id: 5,
        title: "System Design & Interview Prep",
        description: "Prepare for big tech iOS interviews specifically.",
        explanation: "The best-paying tech companies administer a system design round as part of their final-stage interview loops. These interviews challenge you to architect a complex system on iOS — like designing an encrypted messaging app, a social feed, or an analytics SDK. Combined with algorithmic coding challenges and behavioral interviews, this phase gives you the complete preparation needed to succeed.",
        modules: [
            Module(
                id: 25,
                title: "iOS System Design",
                explanation: "Mobile system design interviews are different from backend system design. You'll be asked to design features like a photo-sharing feed, a chat app, an image loading library, or an analytics SDK. The key is thinking in layers: UI → ViewModel → Service → Network → Cache → Persistence. You need to discuss trade-offs (REST vs. GraphQL, polling vs. WebSockets), capacity planning (memory budget, disk budget, battery budget), and how to handle offline scenarios. The interview is as much about communication as technical knowledge — you lead the conversation, ask clarifying questions, sketch diagrams, and make explicit trade-off decisions. Practice multiple system designs and get comfortable thinking about scalability, reliability, and user experience simultaneously.",
                topics: [
                    "System design interview format for mobile",
                    "Client-server architecture for mobile apps",
                    "Designing an image loading library",
                    "Designing a networking layer with retry, caching, offline",
                    "Designing a chat app (WebSockets, long polling)",
                    "Designing a social feed (pagination, caching, prefetching)",
                    "Designing a video player (streaming, caching, DRM)",
                    "Designing an analytics SDK",
                    "API design: REST vs GraphQL for mobile",
                    "Capacity planning: memory, disk, battery budget"
                ],
                miniProject: "Write a complete system design doc for a social media feed feature",
                bigTechTip: "Practice drawing diagrams. Use layers: UI → ViewModel → Service → Network → Cache → Persistence.",
                codeExample: nil,
                references: [
                    Reference(type: .blog, title: "Jacob's Tech Tavern — iOS System Design Interviews in 2026", description: "Written from personal experience going through 3 system design challenges at 3 different big tech companies. Full worked example included.", url: "https://blog.jacobstechtavern.com/p/system-design-interview"),
                    Reference(type: .blog, title: "Jacob's Tech Tavern — Inside Meta's iOS System Design Interview", description: "Detailed breakdown of what Meta specifically looks for in iOS system design rounds.", url: "https://blog.jacobstechtavern.com/p/ios-system-design"),
                    Reference(type: .web, title: "The Mobile Interview — Cracking the Mobile System Design Interview", description: "Comprehensive framework from an engineer with 14+ years of mobile experience.", url: "https://themobileinterview.com/cracking-the-mobile-system-design-interview/"),
                    Reference(type: .web, title: "GitHub — weeeBox/mobile-system-design", description: "Open-source framework for mobile system design interviews with detailed templates.", url: "https://github.com/weeeBox/mobile-system-design"),
                    Reference(type: .web, title: "Swift Anytime — Ultimate Guide to Mobile System Design Interview", description: "Covers High Level Design, Low Level Design, and includes mock interview walkthrough.", url: "https://www.swiftanytime.com/blog/ultimate-guide-to-mobile-system-design-interview"),
                    Reference(type: .web, title: "The New Stack — How To Prepare for Big Tech Interviews as an iOS Engineer", description: "Practical guide covering coding, system design, and behavioral rounds.", url: "https://thenewstack.io/how-to-prepare-for-big-tech-interviews-as-an-ios-engineer/"),
                    Reference(type: .web, title: "System Design Newsletter — The Mobile Engineer's Guide", description: "Step-by-step strategy for the 45-minute interview format.", url: "https://newsletter.systemdesign.one/p/mobile-system-design-interview"),
                    Reference(type: .course, title: "iOS Interview Guide — System Design Video Course", description: "Walks through e-commerce, messenger, and Instagram-like app designs.", url: "https://iosinterviewguide.com/system-design-interview")
                ],
                icon: "doc.text.magnifyingglass"
            ),
            Module(
                id: 26,
                title: "Data Structures & Algorithms",
                explanation: "Algorithmic interviews (LeetCode-style) are still a core component of big tech hiring. You need to implement data structures and solve problems in Swift specifically. Focus on the patterns that appear most frequently: two pointers, sliding window, binary search, BFS/DFS, dynamic programming, and hash maps. Swift's standard library provides powerful collection types, but you should understand their internals — how Dictionary uses hash tables, how Array manages contiguous memory, and how to implement custom collections with Sequence and IteratorProtocol. LeetCode Medium is the target difficulty for most companies. Consistent daily practice (2–3 problems) over 3 months is more effective than cramming.",
                topics: [
                    "Big-O notation: time & space complexity",
                    "Arrays, linked lists, stacks, queues in Swift",
                    "Hash tables (Dictionary internals)",
                    "Trees: binary tree, BST, trie",
                    "Graphs: BFS, DFS, adjacency list",
                    "Sorting: merge sort, quick sort, Timsort",
                    "Binary search & variations",
                    "Dynamic programming: memoization, tabulation",
                    "Common patterns: two pointers, sliding window, prefix sum",
                    "Swift-specific: Sequence, IteratorProtocol, custom collections"
                ],
                miniProject: "Implement 5 common data structures as Swift packages with tests",
                bigTechTip: "LeetCode Medium is the target difficulty. Practice 2–3 problems daily for 3 months.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — iOS Interview Questions", description: "Swift-specific algorithm and interview prep.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .youtube, title: "CS Dojo — Data Structures & Algorithms", description: "Clear explanations of CS fundamentals with emphasis on interview prep.", url: "https://www.youtube.com/c/CSDojo"),
                    Reference(type: .web, title: "LeetCode — Swift Solutions", description: "Practice problems with Swift language support.", url: "https://leetcode.com/"),
                    Reference(type: .web, title: "Exercism — Swift Track", description: "Language fluency through coding exercises.", url: "https://exercism.org/tracks/swift"),
                    Reference(type: .book, title: "Cracking the Coding Interview by Gayle McDowell", description: "The classic interview prep book.", url: ""),
                    Reference(type: .web, title: "swift-algorithm-club", description: "Data structures and algorithms implemented in Swift.", url: "https://github.com/kodecocodes/swift-algorithm-club")
                ],
                icon: "chart.bar.doc.horizontal"
            ),
            Module(
                id: 27,
                title: "Behavioral & Culture Interviews",
                explanation: "Behavioral rounds are elimination rounds at big tech companies — you can ace the technical interviews and still fail because of a poor behavioral performance. The STAR method (Situation, Task, Action, Result) gives you a framework for telling compelling stories about your experience. You need 8–10 polished stories covering: solving a challenging technical problem, disagreeing with a teammate, handling failure, prioritizing under pressure, mentoring others, and driving a project from ambiguity to completion. Each story should demonstrate a specific leadership principle or competency the company values. Equally important: researching the specific company's culture and values, crafting your professional narrative (why this company? why this role?), and preparing thoughtful questions to ask your interviewers.",
                topics: [
                    "STAR method (Situation, Task, Action, Result)",
                    "\"Tell me about a challenging technical problem\"",
                    "\"Describe a disagreement with a teammate\"",
                    "\"How do you prioritize tasks?\"",
                    "\"Tell me about a time you failed\"",
                    "Company-specific culture research",
                    "Questions to ask interviewers",
                    "Crafting your professional narrative",
                    "Portfolio & GitHub presence",
                    "Writing a strong iOS-focused resume"
                ],
                miniProject: "Write 10 STAR stories from your experience (or projects)",
                bigTechTip: "Behavioral rounds are elimination rounds. Prepare as seriously as technical rounds.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — iOS Interview Tips", description: "Interview preparation and career advice.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Glassdoor — iOS Developer Interview Questions", description: "Real interview questions reported by candidates.", url: "https://www.glassdoor.com/"),
                    Reference(type: .book, title: "Cracking the Coding Interview — Behavioral Chapters", description: "Chapters on behavioral interviews.", url: ""),
                    Reference(type: .web, title: "levels.fyi", description: "Compensation data and interview experiences at tech companies.", url: "https://www.levels.fyi/"),
                    Reference(type: .web, title: "Teamblind", description: "Anonymous discussions about tech interviews and compensation.", url: "https://www.teamblind.com/")
                ],
                icon: "person.2"
            ),
            Module(
                id: 28,
                title: "Mock Interview Practice",
                explanation: "The best way to prepare for interviews is to simulate them. This module has you practice all three interview types: coding (2 LeetCode problems in 45 minutes), system design (architect a feature end-to-end in 45 minutes), and iOS domain knowledge rapid-fire (app lifecycle, SwiftUI vs UIKit, ARC, concurrency, testing). Take-home projects (common at some companies) require different skills — time management, documentation, and showcasing architectural thinking within constraints. Code review exercises (reviewing a PR and giving feedback) test your ability to communicate technical decisions clearly. Record yourself answering questions and review for filler words, pacing, and clarity.",
                topics: [
                    "Coding interview: 2 LeetCode problems in 45 min",
                    "System design: design a feature end-to-end in 45 min",
                    "iOS domain knowledge rapid-fire questions",
                    "App lifecycle, view lifecycle",
                    "SwiftUI vs UIKit rendering",
                    "ARC, retain cycles",
                    "Concurrency model (actors, Sendable)",
                    "Take-home project tips",
                    "Code review exercise: review a PR",
                    "Record yourself for self-review"
                ],
                miniProject: "Do 3 full mock interviews (coding + system design + behavioral)",
                bigTechTip: "Record yourself answering questions. Review for filler words, pacing, and clarity.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Mock iOS Interview", description: "Simulated iOS interview recordings.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "Pramp", description: "Free peer-to-peer mock interviews.", url: "https://www.pramp.com/"),
                    Reference(type: .web, title: "interviewing.io", description: "Anonymous mock interviews with engineers from top companies.", url: "https://interviewing.io/"),
                    Reference(type: .web, title: "LeetCode — Mock Assessment", description: "Timed practice sessions.", url: "https://leetcode.com/assessment/"),
                    Reference(type: .web, title: "iOS Interview Guide", description: "Comprehensive iOS-specific interview preparation platform.", url: "https://iosinterviewguide.com/")
                ],
                icon: "mic"
            )
        ],
        icon: "5.square.fill"
    )

    // MARK: - Phase 6: Capstone

    private static let phase6 = Phase(
        id: 6,
        title: "Capstone Project",
        description: "Build and ship a production-quality app demonstrating all skills.",
        explanation: "The capstone project is where everything comes together. You'll build a real app from scratch, using every skill learned across the curriculum — modern SwiftUI, TCA architecture, SwiftData persistence, Swift Concurrency networking, full test coverage, modular architecture, CI/CD pipeline, and more. This becomes both your portfolio piece and your proof of competence.",
        modules: [
            Module(
                id: 29,
                title: "Capstone — Full App Build",
                explanation: "The capstone app is \"DevJournal\" — an iOS app for developers to track their learning, write daily reflections, manage a reading list, and share progress. It incorporates 15 major features spanning the entire curriculum: onboarding flow with animations, Sign in with Apple authentication, a dashboard with learning stats and streaks, rich text journal entries, a reading list with URL previews, a tag system with search, offline-first SwiftData persistence, background sync, home screen widget, deep linking, dark mode and Dynamic Type support, localization, comprehensive tests (90%+ coverage), and performance optimization. The architecture uses TCA for core features, SPM modular structure with 5+ modules, swift-dependencies for DI, and Swift 6 strict concurrency throughout.",
                topics: [
                    "Onboarding flow with smooth animations",
                    "Authentication (Sign in with Apple)",
                    "Dashboard with learning stats & streaks",
                    "Journal entries with rich text (SwiftUI)",
                    "Reading list with URL preview (LinkPresentation)",
                    "Tag system & search with #Predicate",
                    "Offline-first with SwiftData",
                    "Background sync",
                    "Widget showing daily streak",
                    "Deep linking to specific entries",
                    "Dark mode & Dynamic Type support",
                    "Localization (2+ languages)",
                    "Unit tests (90%+ coverage)",
                    "UI tests for critical flows",
                    "Performance profiled & optimized"
                ],
                miniProject: "Build \"DevJournal\" — a full production app with TCA, SPM modules, and CI pipeline",
                bigTechTip: "A shipped app on the App Store is the strongest portfolio piece you can have.",
                codeExample: nil,
                references: [
                    Reference(type: .web, title: "Apple — Human Interface Guidelines", description: "Design principles for iOS apps.", url: "https://developer.apple.com/design/human-interface-guidelines/"),
                    Reference(type: .web, title: "Apple — App Store Review Guidelines", description: "What to follow for App Store approval.", url: "https://developer.apple.com/app-store/review/guidelines/"),
                    Reference(type: .web, title: "Apple — Sign in with Apple", description: "Authentication integration guide.", url: "https://developer.apple.com/sign-in-with-apple/"),
                    Reference(type: .web, title: "GitHub — isowords", description: "Open-source iOS word game built entirely with TCA. Excellent reference architecture.", url: "https://github.com/pointfreeco/isowords"),
                    Reference(type: .web, title: "objc.io — Thinking in SwiftUI", description: "Advanced SwiftUI patterns for production apps.", url: "https://www.objc.io/books/thinking-in-swiftui/")
                ],
                icon: "star"
            ),
            Module(
                id: 30,
                title: "Polish, Ship & Portfolio",
                explanation: "The final module transforms your app and yourself into a market-ready package. App Store Optimization (ASO) — title, subtitle, keywords, screenshots — determines whether people find and download your app. Creating compelling screenshots and preview videos requires marketing thinking. Post-launch, you'll monitor crashes, analyze user feedback, and iterate. Beyond the app, building your iOS developer brand is essential: a GitHub profile with pinned repos showing clean code, technical blog posts demonstrating depth of knowledge, and active participation in the iOS community (Swift Forums, iOS Dev Weekly, conferences). Your resume should highlight impact and measurable results, not just technologies used.",
                topics: [
                    "App Store Optimization (ASO): title, keywords, screenshots",
                    "Creating compelling App Store screenshots",
                    "Writing a privacy policy",
                    "Setting up analytics",
                    "Handling App Store review feedback",
                    "Post-launch: monitoring crashes, iterating",
                    "Open-source contribution strategy",
                    "GitHub with pinned repos",
                    "Technical blog posts",
                    "iOS developer communities",
                    "Conference talks",
                    "Updated resume & LinkedIn"
                ],
                miniProject: "Publish app on App Store, write 2 blog posts, update resume & portfolio",
                bigTechTip: "Your GitHub profile is your second resume. Pin your best repos and write great READMEs.",
                codeExample: nil,
                references: [
                    Reference(type: .youtube, title: "Sean Allen — Building Your iOS Dev Career", description: "Career advice and portfolio tips.", url: "https://www.youtube.com/c/SeanAllen"),
                    Reference(type: .web, title: "iOS Dev Weekly", description: "The essential weekly newsletter for iOS developers.", url: "https://iosdevweekly.com/"),
                    Reference(type: .web, title: "Swift Forums", description: "Official Swift language community discussions.", url: "https://forums.swift.org/"),
                    Reference(type: .web, title: "Swift by Sundell", description: "Articles and podcast, excellent for blog post inspiration.", url: "https://www.swiftbysundell.com/"),
                    Reference(type: .web, title: "App Store Connect Help", description: "Managing your app on the App Store.", url: "https://developer.apple.com/help/app-store-connect/")
                ],
                icon: "paperplane"
            )
        ],
        icon: "6.square.fill"
    )
}
