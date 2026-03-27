# iOS Development Mastery — Beginner to Big Tech Ready

## Project Overview

This is a self-paced iOS development learning project structured as a curriculum that takes you from absolute beginner to big-tech-interview-ready iOS engineer. Every module includes theory, hands-on coding, and a mini-project. The final capstone is a production-quality app showcasing all skills.

**Target:** Land an iOS engineering role at a big tech company (Apple, Google, Meta, Netflix, Spotify, Uber, Airbnb, etc.)

**Tech Stack (2025–2026 Modern iOS):**

- Language: **Swift 6** (strict concurrency, typed throws, noncopyable types)
- UI Framework: **SwiftUI** (primary), UIKit (interop & legacy)
- Architecture: **TCA (The Composable Architecture)** + MVVM
- Async: **Swift Concurrency** (async/await, actors, structured concurrency, AsyncSequence)
- Data: **SwiftData** + Core Data interop
- Networking: **URLSession async/await**, Combine (legacy support)
- Navigation: **NavigationStack / NavigationSplitView**
- Dependency Injection: **swift-dependencies**
- Testing: **Swift Testing framework**, XCTest, snapshot testing
- CI/CD: **Xcode Cloud**, GitHub Actions, Fastlane
- Package Manager: **Swift Package Manager (SPM)**
- Minimum Deployment: **iOS 17+**
- IDE: **Xcode 16+**

---

## Coding Standards & Conventions

When generating any Swift code in this project, follow these rules:

1. **Swift 6 strict concurrency** — enable `StrictConcurrency` in build settings; every new file must compile cleanly under strict concurrency checking.
2. **SwiftUI first** — default to SwiftUI for all UI. Only use UIKit via `UIViewRepresentable` / `UIViewControllerRepresentable` when SwiftUI has no equivalent.
3. **No force unwraps** — use `guard let`, `if let`, or nil-coalescing. Zero `!` except for `@IBOutlet` (rare).
4. **MARK comments** — organize files with `// MARK: -` sections.
5. **Protocol-oriented** — prefer protocols + extensions over inheritance.
6. **Value types first** — use `struct` by default; `class` only when reference semantics are required.
7. **Access control** — mark everything `private` or `internal` explicitly; expose `public` only when needed.
8. **Naming** — follow Swift API Design Guidelines: clarity at the point of use, fluent English phrases.
9. **Error handling** — use typed throws (Swift 6), custom error enums conforming to `LocalizedError`.
10. **Documentation** — add `///` doc comments on every public type and method.
11. **Tests** — every feature module must have a corresponding test target using Swift Testing (`@Test`, `#expect`).

---

## Curriculum Structure

The curriculum is divided into **6 phases** across **30 modules**. Each module contains:

- 📖 **Concept** — theory & explanation
- 💻 **Code Lab** — guided hands-on coding
- 🏗️ **Mini Project** — build something real
- ✅ **Checkpoint** — quiz / self-assessment
- 🎯 **Big Tech Tip** — interview-relevant insight

---

## Phase 1: Foundation (Modules 1–6)

> **Goal:** Master Swift language fundamentals and Xcode tooling. This phase is about building an unshakeable foundation in the Swift programming language. You'll learn how Swift thinks — its type system, its emphasis on safety through optionals, and its preference for value types. Don't rush through this phase; every advanced topic you'll encounter later builds directly on these concepts. Big tech interviewers frequently test fundamentals because they reveal how deeply you understand the tools you use every day.

---

### Module 1: Swift Language Essentials

Swift is a modern, type-safe language designed by Apple as the primary language for all Apple platforms. It was introduced in 2014 and has evolved rapidly — the current version, Swift 6, introduces strict concurrency checking that catches data races at compile time. As a beginner, you'll start with the building blocks: how to declare variables and constants, work with basic data types, and handle the concept of "optional" values — a core Swift feature that forces you to explicitly handle cases where a value might be missing. This is one of Swift's superpowers: it eliminates an entire class of bugs (null pointer exceptions) that plague other languages. Understanding optionals deeply will set you apart in interviews and in real codebases.

**Mini Project:** Build a CLI temperature converter (Celsius ↔ Fahrenheit ↔ Kelvin)

**Big Tech Tip:** Interviewers expect you to handle optionals safely. Never force-unwrap in interviews.

**References:**
- 📺 YouTube: [CodeWithChris — Swift Tutorial for Beginners](https://www.youtube.com/c/CodeWithChris) — The largest dedicated iOS tutorial channel, Chris walks through Swift basics with a hands-on project approach.
- 📺 YouTube: [Sean Allen — Swift Fundamentals](https://www.youtube.com/c/SeanAllen) — Senior iOS engineer in Silicon Valley sharing 3 videos per week about Swift and iOS development.
- 📖 Web: [The Swift Programming Language (Official Book)](https://docs.swift.org/swift-book/) — Apple's own comprehensive guide to the Swift language. Free and always up to date.
- 📖 Web: [Hacking with Swift — 100 Days of SwiftUI (Days 1–14)](https://www.hackingwithswift.com/100/swiftui) — Paul Hudson's beloved community course that takes a day-by-day approach to learning Swift and SwiftUI.
- 🎓 Course: [Stanford CS193p Spring 2025 — Lecture 1 & 2](https://cs193p.stanford.edu/) — Stanford's free iOS development course, all 16 lectures available on YouTube. The gold standard for learning iOS development academically.

---

### Module 2: Control Flow & Collections

Once you know how to store data, you need to know how to make decisions and work with groups of data. Swift's control flow is elegant — `switch` statements support powerful pattern matching that goes far beyond simple value comparison. You can match ranges, tuples, and even bind values inside cases. Collections — Arrays, Sets, and Dictionaries — are your daily workhorses. Understanding their performance characteristics (why Dictionary lookup is O(1) but Array search is O(n)) will directly impact your ability to solve interview problems efficiently. Higher-order functions like `map`, `filter`, and `reduce` let you write expressive, functional-style code that is both readable and performant. Master these and your code will look professional from day one.

**Mini Project:** Build a CLI contact book with search, add, delete using Dictionary

**Big Tech Tip:** Know the time complexity of collection operations. Array append = O(1) amortized, Dictionary lookup = O(1) average.

**References:**
- 📺 YouTube: [Sean Allen — Swift Collections](https://www.youtube.com/c/SeanAllen) — Practical walkthroughs on how collections work under the hood.
- 📺 YouTube: [CodeWithChris — Swift Arrays, Dictionaries, and Sets](https://www.youtube.com/c/CodeWithChris) — Beginner-friendly explanations with visual examples.
- 📖 Web: [Hacking with Swift — Arrays, Sets, Dictionaries](https://www.hackingwithswift.com/read/0/overview) — Paul Hudson's free introduction to Swift covering all collection types.
- 📖 Web: [Swift.org — Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes) — Official documentation with code examples and performance notes.
- 📖 Web: [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) — Learn to name things the Swift way from day one.

---

### Module 3: Functions, Closures & Enums

Functions are the fundamental building blocks of any program, and Swift makes them extremely flexible with features like argument labels, default values, and variadic parameters. But the real power comes with closures — anonymous functions that can capture and store references to variables from their surrounding context. Closures are everywhere in iOS development: in completion handlers, in SwiftUI view builders, in animation blocks, and in collection methods like `map` and `filter`. Understanding closure capture semantics — especially the difference between strong, weak, and unowned captures — is critical because getting it wrong causes memory leaks (retain cycles), one of the most common bugs in iOS apps. Enums in Swift are dramatically more powerful than in other languages; they can carry associated values, making them perfect for modeling states, errors, and results.

**Mini Project:** Build a CLI calculator using enums for operations and closures for computation

**Big Tech Tip:** Closure capture semantics and retain cycles are a TOP interview topic. Practice explaining capture lists ([weak self], [unowned self]).

**References:**
- 📺 YouTube: [Sean Allen — Closures in Swift](https://www.youtube.com/c/SeanAllen) — One of the most-watched closure tutorials for iOS developers.
- 📺 YouTube: [Kavsoft — Swift Enums with Associated Values](https://www.youtube.com/c/Kavsoft) — Clean, focused tutorials on Swift and SwiftUI features.
- 📖 Web: [Swift by Sundell — Enums](https://www.swiftbysundell.com/basics/enums/) — John Sundell's clear explanation of Swift enums and practical patterns.
- 📖 Web: [Hacking with Swift — Closures](https://www.hackingwithswift.com/sixty/6/1/creating-basic-closures) — Step-by-step closure tutorial from basics to advanced patterns.
- 📖 Web: [Swift.org — Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/) — Official documentation on closures.

---

### Module 4: Structs, Classes & Protocols

This module covers one of the most fundamental decisions you'll make as a Swift developer: choosing between structs (value types) and classes (reference types). Swift encourages you to use structs by default — they're copied when passed around, making them inherently safer for concurrent code. Classes, on the other hand, are passed by reference, which means multiple parts of your code can point to and mutate the same instance. Understanding when to use each is a hallmark of a skilled Swift developer. Protocols are Swift's answer to interfaces, but they go much further with protocol extensions that provide default implementations. This enables "Protocol-Oriented Programming" (POP), a paradigm Apple champions. The `some` and `any` keywords (opaque vs. existential types) are newer additions that affect performance and API design — knowing the difference shows interviewers you're current with modern Swift.

**Mini Project:** Build a shape hierarchy using protocols (area, perimeter calculations)

**Big Tech Tip:** "Struct vs Class — when do you use each?" is one of the most common iOS interview questions. Know value vs. reference semantics cold.

**References:**
- 📺 YouTube: [Sean Allen — Struct vs Class in Swift](https://www.youtube.com/c/SeanAllen) — Clear comparison with real-world iOS examples.
- 📺 YouTube: [Lets Build That App — Protocol Oriented Programming](https://www.youtube.com/c/LetsBuildThatApp) — Brian Voong demonstrates POP with practical projects.
- 📖 Web: [Apple WWDC 2015 — Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/) — The famous WWDC talk that introduced POP to the world.
- 🎓 Course: [Stanford CS193p — Lecture 3: MVVM and the Swift Type System](https://cs193p.stanford.edu/) — Covers how structs, classes, and protocols work together in real app architecture.
- 📖 Web: [Swift.org — Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/) — Official protocol documentation.

---

### Module 5: Generics, Error Handling & Memory Management

Generics let you write flexible, reusable code that works with any type while still being type-safe — they're behind most of Swift's standard library (Array<Element>, Dictionary<Key, Value>, Optional<Wrapped>). Error handling in Swift uses a structured `do-try-catch` pattern, and Swift 6 introduces typed throws, letting you specify exactly which error types a function can throw. But perhaps the most interview-critical topic in this module is memory management via ARC (Automatic Reference Counting). ARC automatically frees memory when there are no more strong references to an object, but it can't detect circular references (retain cycles). Understanding strong, weak, and unowned references — and when to use each — is essential. Memory leaks from retain cycles are one of the most common bugs in production iOS apps, and interviewers love testing this knowledge.

**Mini Project:** Build a generic Cache<Key: Hashable, Value> with expiration

**Big Tech Tip:** Draw retain cycle diagrams in interviews. Know: delegate = weak, closure captures often need [weak self], parent-child = strong parent → weak child.

**References:**
- 📺 YouTube: [Sean Allen — ARC & Memory Management in Swift](https://www.youtube.com/c/SeanAllen) — Visual explanation of retain cycles with Xcode examples.
- 📺 YouTube: [CodeWithChris — Swift Generics Explained](https://www.youtube.com/c/CodeWithChris) — Beginner-friendly generics walkthrough.
- 📖 Web: [Hacking with Swift — Understanding ARC](https://www.hackingwithswift.com/swift/5.1/opaque-return-types) — Practical examples of retain cycles and how to fix them.
- 📖 Web: [Swift.org — Automatic Reference Counting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting) — Official documentation with detailed diagrams.
- 📖 Web: [Swift.org — Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/) — Official generics documentation.

---

### Module 6: Xcode Mastery & Developer Tools

Xcode is your IDE, debugger, profiler, and deployment tool all in one. Mastering it dramatically increases your productivity. Beyond the basics of creating projects and writing code, you need to understand build configurations, schemes, and targets — especially when working on multi-module apps. Swift Package Manager (SPM) is now the standard way to manage dependencies and organize code into modules. Debugging skills are equally important: knowing how to set conditional breakpoints, use LLDB commands, and profile your app with Instruments (for memory leaks, CPU usage, and rendering performance) separates professional developers from hobbyists. At big tech companies, performance profiling is a regular part of the development cycle, not an afterthought.

**Mini Project:** Set up a multi-module iOS project with SPM local packages

**Big Tech Tip:** Know how to profile an app with Instruments. Performance questions are common at Apple & Meta interviews.

**References:**
- 📺 YouTube: [Sean Allen — Xcode Tips & Tricks](https://www.youtube.com/c/SeanAllen) — Productivity shortcuts and debugging techniques.
- 📺 YouTube: [CodeWithChris — Xcode Tutorial for Beginners](https://www.youtube.com/c/CodeWithChris) — Complete walkthrough of the Xcode interface and workflow.
- 📖 Web: [Apple — Xcode Documentation](https://developer.apple.com/documentation/xcode) — Official guide to all Xcode features.
- 📖 Web: [Apple WWDC — Getting Started with Instruments](https://developer.apple.com/videos/play/wwdc2019/411/) — WWDC session on profiling iOS apps.
- 📖 Web: [Hacking with Swift — How to Create a Swift Package](https://www.hackingwithswift.com/articles/146/how-to-create-a-swift-package-using-xcode) — Practical guide to SPM.

---

## Phase 2: SwiftUI & App Architecture (Modules 7–12)

> **Goal:** Build modern, production-quality UIs with proper architecture. SwiftUI is Apple's declarative UI framework — instead of telling the system step-by-step how to update the screen (imperative, like UIKit), you describe what the screen should look like for a given state and SwiftUI handles the rest. This phase covers everything from basic views to complex navigation, state management, and app architecture patterns used at scale. Architecture matters because big tech codebases have dozens of engineers working on the same app — without clear patterns, the code becomes unmanageable.

---

### Module 7: SwiftUI Fundamentals

SwiftUI was introduced in 2019 and has matured significantly through iOS 17 and 18. At its core, every SwiftUI view conforms to the `View` protocol and has a `body` property that returns the view hierarchy. Views are value types (structs), which means they're lightweight and cheap to create — SwiftUI recreates them frequently to keep the UI in sync with your data. You'll learn the fundamental building blocks: text, images, buttons, stacks (VStack, HStack, ZStack), lists, and modifiers. The `@State` property wrapper is your first introduction to SwiftUI's reactive data flow — when state changes, the view automatically re-renders. Understanding that SwiftUI views are descriptions of UI (not the UI objects themselves) is the key mental shift from UIKit.

**Mini Project:** Build a profile card UI with dynamic content

**Big Tech Tip:** Understand SwiftUI's diffing algorithm. Views are value types — structural identity vs. explicit identity matters for performance.

**References:**
- 📺 YouTube: [CodeWithChris — SwiftUI Tutorial for Beginners](https://www.youtube.com/c/CodeWithChris) — The largest dedicated iOS tutorial channel with step-by-step SwiftUI projects.
- 📺 YouTube: [Kavsoft — SwiftUI UI Design Tutorials](https://www.youtube.com/c/Kavsoft) — Beautiful SwiftUI UI builds with animations. Focused purely on SwiftUI.
- 📺 YouTube: [Sean Allen — SwiftUI Fundamentals Course](https://www.youtube.com/c/SeanAllen) — Free SwiftUI course building 4 apps from simple to complex.
- 🎓 Course: [Stanford CS193p Spring 2025](https://cs193p.stanford.edu/) — All 16 lectures free. Builds a card-matching game (Memorize) from scratch using SwiftUI.
- 📖 Web: [Hacking with Swift — 100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) — The most recommended free SwiftUI course by the iOS developer community. 19+ apps built over 100 days.
- 📖 Web: [Apple — SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui) — Apple's official step-by-step tutorials building a Landmarks app.

---

### Module 8: Advanced SwiftUI

Once you're comfortable with basic views, it's time to build real app experiences. Navigation is one of the most important (and historically tricky) parts of SwiftUI. The modern approach uses `NavigationStack` with `navigationDestination` modifiers — this replaced the deprecated `NavigationView` and gives you type-safe, programmatic navigation via `NavigationPath`. For iPad and larger screens, `NavigationSplitView` provides multi-column layouts. You'll also learn sheets, alerts, and confirmation dialogs for modal presentations. Animations in SwiftUI are remarkably powerful and declarative — `withAnimation`, `matchedGeometryEffect`, and `phaseAnimator` let you create fluid transitions with minimal code. Gesture handling (taps, drags, long presses) makes your apps feel interactive and alive.

**Mini Project:** Build a multi-tab recipe app with navigation and animations

**Big Tech Tip:** NavigationStack + navigationDestination is the modern pattern. Avoid deprecated NavigationView in interviews.

**References:**
- 📺 YouTube: [Kavsoft — Advanced SwiftUI Animations](https://www.youtube.com/c/Kavsoft) — Complex animation tutorials that push SwiftUI's boundaries.
- 📺 YouTube: [Sean Allen — SwiftUI Navigation](https://www.youtube.com/c/SeanAllen) — Covers NavigationStack, programmatic navigation, and deep linking.
- 📖 Web: [Apple WWDC 2022 — The SwiftUI Cookbook for Navigation](https://developer.apple.com/videos/play/wwdc2022/10054/) — Official session introducing NavigationStack.
- 📖 Web: [Hacking with Swift — SwiftUI Navigation](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-programmatic-navigation-in-swiftui) — Practical navigation patterns with code examples.
- 📖 Web: [Swift by Sundell — Navigating SwiftUI](https://www.swiftbysundell.com/articles/swiftui-navigation/) — Deep dive into navigation architecture patterns.

---

### Module 9: State Management & Data Flow

State management is the heart of any SwiftUI app. In iOS 17, Apple introduced the `@Observable` macro (from the Observation framework), which is a major improvement over the older `ObservableObject` protocol. With `@Observable`, SwiftUI tracks exactly which properties a view reads and only re-renders when those specific properties change — far more efficient than `ObservableObject` which triggered updates for any `@Published` property change. Understanding the full state management toolkit (`@State` for local state, `@Binding` for parent-child, `@Observable` for shared state, `@Environment` for dependency injection) and knowing the "single source of truth" principle is essential. The `swift-dependencies` library by Point-Free provides a clean, testable way to inject dependencies throughout your app.

**Mini Project:** Build a todo app demonstrating all state management patterns

**Big Tech Tip:** Explain the difference between @Observable and ObservableObject. Know why Apple moved away from Combine-based observation to the Observation framework.

**References:**
- 📺 YouTube: [Sean Allen — @Observable vs ObservableObject](https://www.youtube.com/c/SeanAllen) — Compares old and new observation patterns.
- 🎓 Course: [Stanford CS193p — Lectures on MVVM and State](https://cs193p.stanford.edu/) — Covers @State, @Binding, @ObservedObject, and the principles of data flow.
- 📖 Web: [Apple WWDC 2023 — Discover Observation in SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10149/) — Official session introducing @Observable.
- 📖 Web: [Point-Free — swift-dependencies](https://github.com/pointfreeco/swift-dependencies) — The dependency injection library built for testable Swift apps.
- 📖 Web: [Hacking with Swift — @Observable](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-observable-objects-to-manage-state) — Practical guide to the new Observation framework.

---

### Module 10: App Architecture — MVVM + TCA

At scale, you need architecture. MVVM (Model-View-ViewModel) is the most common pattern in SwiftUI apps — the ViewModel (now typically an `@Observable` class) holds business logic and state, keeping views thin and testable. But for larger apps, The Composable Architecture (TCA) by Point-Free offers a more structured approach. TCA enforces unidirectional data flow: user actions go into a Reducer, which produces new State and optional Effects (side effects like API calls). This makes every state change predictable and testable. TCA was designed over many episodes on Point-Free and provides excellent tooling for testing (TestStore), navigation, and dependency management. Many companies (including several major apps) use TCA in production. Learning both MVVM and TCA gives you flexibility — MVVM for simpler features, TCA when you need rigorous testability and composition.

**Mini Project:** Build a counter + favorites list app using TCA with full test coverage

**Big Tech Tip:** Big tech values testable architecture. TCA's `TestStore` lets you assert every state change and effect — great talking point in interviews.

**References:**
- 📺 YouTube: [Point-Free — A Tour of the Composable Architecture](https://www.pointfree.co/collections/composable-architecture/composable-architecture-1-0) — Official TCA video series building an app from scratch by the creators Brandon Williams and Stephen Celis.
- 📖 Medium: [The Composable Architecture: Swift Guide to TCA](https://medium.com/@dmitrylupich/the-composable-architecture-swift-guide-to-tca-c3bf9b2e86ef) — Practical guide building a news app with TCA, covering reducers, composition, and modularization.
- 📖 Medium: [Getting Started with The Composable Architecture (TCA)](https://sabapathy7.medium.com/getting-started-with-the-composable-architecture-tca-7369f6ee4e4d) — Beginner-friendly introduction to TCA's core concepts: State, Action, Reducer, and Store.
- 📖 Web: [GitHub — swift-composable-architecture](https://github.com/pointfreeco/swift-composable-architecture) — Official repository with extensive documentation, examples, and interactive tutorials.
- 📖 Web: [Kodeco — Getting Started with The Composable Architecture](https://www.kodeco.com/24550178-getting-started-with-the-composable-architecture) — Step-by-step tutorial building a GitHub repo viewer with TCA.
- 📖 Web: [Lickability — How to Learn TCA](https://lickability.com/blog/how-to-learn-tca/) — Curated learning path for TCA from an agency that uses it in production.
- 📖 Web: [Bugfender — Learn Swift Composable Architecture](https://bugfender.com/blog/swift-composable-architecture/) — Comprehensive guide covering when to use TCA vs simpler patterns.

---

### Module 11: Lists, Grids & Performance

Most iOS apps center around displaying lists and grids of data — social feeds, product catalogs, settings screens. SwiftUI's `List` view provides built-in features like sections, swipe actions, pull-to-refresh, and searchable. For grid layouts, `LazyVGrid` and `LazyHGrid` with `GridItem` configurations give you Pinterest-style layouts. The "lazy" prefix is critical — it means SwiftUI only creates views as they scroll into view, essential for performance with large datasets. Understanding view identity (structural vs. explicit ID) is key to avoiding unnecessary re-renders. You'll also learn about pagination (infinite scrolling), skeleton loading states, and accessibility — VoiceOver support, Dynamic Type, and reduced motion preferences. Accessibility isn't optional at big tech companies; it's a requirement.

**Mini Project:** Build an image grid gallery with pagination and pull-to-refresh

**Big Tech Tip:** Explain how SwiftUI determines view identity (structural vs explicit). This trips up many candidates and shows deep framework understanding.

**References:**
- 📺 YouTube: [Kavsoft — SwiftUI Lazy Grids & Lists](https://www.youtube.com/c/Kavsoft) — Beautiful grid layout tutorials with animations.
- 📺 YouTube: [Sean Allen — SwiftUI Lists Deep Dive](https://www.youtube.com/c/SeanAllen) — Covers searchable, pull-to-refresh, swipe actions.
- 📖 Web: [Apple WWDC 2021 — Demystify SwiftUI](https://developer.apple.com/videos/play/wwdc2021/10022/) — Essential talk on view identity, lifetime, and dependencies.
- 📖 Web: [Apple — Accessibility in SwiftUI](https://developer.apple.com/documentation/swiftui/accessibility) — Official guide to making SwiftUI apps accessible.
- 📖 Web: [Hacking with Swift — SwiftUI Lists](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-list-of-dynamic-items) — Practical list patterns and performance tips.

---

### Module 12: UIKit Interop & Legacy Codebase Skills

Despite SwiftUI's rapid advancement, the reality is that most large iOS codebases at big tech companies are hybrid — they have years of UIKit code alongside newer SwiftUI features. You need to be comfortable in both worlds. `UIViewRepresentable` and `UIViewControllerRepresentable` let you wrap UIKit views for use in SwiftUI, while `UIHostingController` lets you embed SwiftUI views inside UIKit. Understanding the UIKit basics — view controller lifecycle (`viewDidLoad`, `viewWillAppear`, `viewDidDisappear`), `UITableView`, `UICollectionView`, and Auto Layout — is still essential for interviews and for working with existing code. The Coordinator pattern bridges UIKit's delegate-based communication with SwiftUI's declarative approach.

**Mini Project:** Wrap a UIKit map view (MKMapView) in SwiftUI with annotations

**Big Tech Tip:** Most big tech codebases are hybrid UIKit + SwiftUI. Demonstrating interop skills shows you can be productive from day one.

**References:**
- 📺 YouTube: [Sean Allen — UIKit Fundamentals for iOS Interviews](https://www.youtube.com/c/SeanAllen) — Covers view controller lifecycle, UITableView, and Auto Layout.
- 📺 YouTube: [Lets Build That App — UIKit Projects](https://www.youtube.com/c/LetsBuildThatApp) — Brian Voong builds real-world apps with UIKit including YouTube, Facebook Messenger clones.
- 📖 Web: [Apple — Interfacing with UIKit](https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit) — Official tutorial on UIViewRepresentable and UIViewControllerRepresentable.
- 📖 Web: [Hacking with Swift — UIKit to SwiftUI Migration](https://www.hackingwithswift.com/quick-start/swiftui/how-to-wrap-a-custom-uiview-for-swiftui) — Practical guide to wrapping UIKit components.
- 📖 Web: [Swift by Sundell — Hosting SwiftUI in UIKit](https://www.swiftbysundell.com/articles/swiftui-and-uikit-interoperability/) — Patterns for incremental SwiftUI adoption.

---

## Phase 3: Data, Networking & Persistence (Modules 13–18)

> **Goal:** Handle real-world data — networking, caching, persistence. Real apps need to fetch data from servers, store it locally, work offline, and sync in the background. This phase covers the modern async/await-based approach to concurrency, networking best practices, SwiftData for persistence, and the still-relevant Combine framework for legacy codebases. These skills are non-negotiable for any iOS role.

---

### Module 13: Swift Concurrency Deep Dive

Swift Concurrency, introduced in Swift 5.5 and fully matured in Swift 6, is a paradigm shift in how iOS apps handle asynchronous operations. Instead of callback hell and GCD queue juggling, you write `async/await` code that reads like synchronous code but runs asynchronously. `Task` and `TaskGroup` provide structured concurrency — child tasks are automatically cancelled when their parent is cancelled, eliminating a whole class of resource-leak bugs. Actors provide data isolation: they guarantee that only one task accesses their mutable state at a time, preventing data races at compile time. `@MainActor` ensures UI updates happen on the main thread. Swift 6's strict concurrency checking makes these guarantees enforceable by the compiler. Understanding `Sendable`, `AsyncSequence`, and `AsyncStream` rounds out your ability to build safe, modern async code.

**Mini Project:** Build an async image downloader with progress using AsyncStream

**Big Tech Tip:** "Explain the actor model in Swift" is a top-tier interview question. Know data isolation, `@MainActor`, and the difference between structured vs unstructured concurrency.

**References:**
- 📺 YouTube: [Sean Allen — Swift Concurrency Explained](https://www.youtube.com/c/SeanAllen) — Practical async/await, actors, and TaskGroup tutorials.
- 📖 Medium: [Mastering Swift Concurrency: async/await, Tasks, Actors, Sendable & Structured Concurrency](https://medium.com/@kumarsuraj19111997/mastering-swift-concurrency-async-await-tasks-actors-sendable-structured-concurrency-3dff135ce588) — Comprehensive guide with real-world examples covering every major concurrency feature.
- 📖 Medium: [Swift Concurrency Deep Dive: Beyond async/await](https://medium.com/@dhrumilraval212/swift-concurrency-deep-dive-beyond-async-await-architecting-concurrent-systems-with-actors-and-0bc46f0bbb74) — Goes beyond basics into building production-grade concurrent systems with actors.
- 📖 Medium: [Swift Concurrency Cheat Sheet](https://liudasbar.medium.com/the-new-world-of-swift-concurrency-a-deep-dive-into-async-await-actors-and-more-e03ee9a72450) — Extensive reference covering async/await, actors, continuations, and Combine bridging.
- 📖 Medium: [The Complete Guide to Swift Concurrency: From Threading to Actors in Swift 6](https://medium.com/@thakurneeshu280/the-complete-guide-to-swift-concurrency-from-threading-to-actors-in-swift-6-a9cf006a19ac) — Comprehensive journey from GCD basics to advanced Swift 6 patterns.
- 📖 Web: [Apple WWDC 2021 — Meet async/await in Swift](https://developer.apple.com/videos/play/wwdc2021/10132/) — Official introduction from Apple.
- 📖 Web: [Apple WWDC 2022 — Eliminate data races using Swift Concurrency](https://developer.apple.com/videos/play/wwdc2022/110351/) — Deep dive into strict concurrency.

---

### Module 14: Networking

Networking is what makes apps come alive — fetching data from APIs, uploading user content, downloading files. In modern iOS, `URLSession` supports async/await directly, making network code clean and readable. You'll learn to construct `URLRequest` objects with proper headers, HTTP methods, and body content. `Codable` (Swift's encoding/decoding protocol) is your primary tool for converting between JSON and Swift types — mastering custom `CodingKeys`, date decoding strategies, and handling nested containers is essential. Beyond basic requests, production apps need pagination handling, retry logic, network reachability monitoring (via `NWPathMonitor`), and proper error handling. The key architectural insight is building a protocol-based API client that can be easily mocked for testing — this abstraction is what interviewers look for.

**Mini Project:** Build a GitHub user search app consuming the GitHub REST API

**Big Tech Tip:** Design a protocol-based API client in interviews. Show you can abstract networking for testability and clean separation of concerns.

**References:**
- 📺 YouTube: [Sean Allen — Networking in Swift with URLSession](https://www.youtube.com/c/SeanAllen) — Building a complete networking layer with error handling.
- 📺 YouTube: [CodeWithChris — API Calls in SwiftUI](https://www.youtube.com/c/CodeWithChris) — Beginner-friendly REST API tutorial.
- 📖 Web: [Hacking with Swift — URLSession and Codable](https://www.hackingwithswift.com/read/7/overview) — Practical networking with real API examples.
- 📖 Web: [Swift by Sundell — Networking in Swift](https://www.swiftbysundell.com/articles/networking-with-combine-and-swiftui/) — Advanced networking patterns.
- 📖 Web: [Apple — URLSession Documentation](https://developer.apple.com/documentation/foundation/urlsession) — Official reference for all URLSession capabilities.

---

### Module 15: SwiftData & Persistence

SwiftData, introduced at WWDC 2023 for iOS 17, is Apple's modern persistence framework that replaces the boilerplate-heavy Core Data with a Swift-native, declarative API. You define models using the `@Model` macro, query data with `@Query` and `#Predicate`, and manage context through `ModelContext`. It integrates seamlessly with SwiftUI — changes to persisted data automatically trigger view updates. Beyond SwiftData, you need to know the full persistence toolkit: `UserDefaults` / `@AppStorage` for simple preferences, Keychain for secure storage (tokens, credentials), and `FileManager` for file-system operations. Understanding when to use each storage mechanism — and the trade-offs between them — is a frequent interview topic.

**Mini Project:** Build a journaling app with SwiftData (entries, tags, search using #Predicate)

**Big Tech Tip:** Know when to use SwiftData vs Core Data vs UserDefaults vs Keychain. Each solves a different problem.

**References:**
- 📺 YouTube: [Sean Allen — SwiftData Tutorial](https://www.youtube.com/c/SeanAllen) — Complete SwiftData walkthrough from setup to queries.
- 📺 YouTube: [CodeWithChris — The Ultimate Beginner's Guide to SwiftData](https://codewithchris.com/swift-data/) — Comprehensive guide covering @Model, ModelContainer, and SwiftUI integration.
- 📖 Medium: [A Beginner's Guide to SwiftData with a To-Do App](https://medium.com/@jakir/a-beginners-guide-to-swiftdata-with-a-to-do-app-b84ba7146118) — Hands-on tutorial building a todo app step by step.
- 📖 Medium: [The Art of SwiftData in 2025](https://medium.com/@matgnt/the-art-of-swiftdata-in-2025-from-scattered-pieces-to-a-masterpiece-1fd0cefd8d87) — Advanced architecture patterns for using SwiftData cleanly at scale.
- 📖 Medium: [SwiftData in Depth: Building a Modern Persistence Layer](https://medium.com/@rashadsh/swiftdata-in-depth-building-a-modern-persistence-layer-043566be7f86) — Production-ready guide covering models, queries, relationships, and migration strategies.
- 📖 Web: [Hacking with Swift — SwiftData by Example](https://www.hackingwithswift.com/quick-start/swiftdata) — The world's largest collection of SwiftData examples, tips, and techniques.
- 📖 Web: [Apple WWDC 2023 — Meet SwiftData](https://developer.apple.com/videos/play/wwdc2023/10187/) — Official introduction from Apple.

---

### Module 16: Combine Framework (Legacy & Interop)

While Swift Concurrency (async/await) is the future, Combine — Apple's reactive programming framework introduced in 2019 — is still heavily used in production codebases at many big tech companies. Combine provides a Publisher-Subscriber pattern for processing values over time: network responses, user input, timer events, and notifications. Key operators like `map`, `filter`, `flatMap`, `combineLatest`, and `debounce` let you build complex data pipelines declaratively. Understanding `@Published`, `PassthroughSubject`, and `CurrentValueSubject` is necessary for working with `ObservableObject`-based code (the pre-iOS 17 pattern). Crucially, you need to know how to bridge between Combine and async/await using `.values` and `Future` — many codebases use both paradigms simultaneously.

**Mini Project:** Refactor the GitHub search app to use Combine (then compare with async/await)

**Big Tech Tip:** Some big tech codebases (Uber, Airbnb) still use Combine heavily. Know both paradigms and how to bridge between them.

**References:**
- 📺 YouTube: [Sean Allen — Combine Framework in Swift](https://www.youtube.com/c/SeanAllen) — Practical Combine tutorials.
- 📖 Web: [Hacking with Swift — Combine](https://www.hackingwithswift.com/quick-start/combine) — Practical Combine examples and operator guide.
- 📖 Web: [Apple — Combine Documentation](https://developer.apple.com/documentation/combine) — Official reference.
- 📖 Web: [Swift by Sundell — Combine](https://www.swiftbysundell.com/basics/combine/) — Clear explanations of Combine patterns.
- 📖 Web: [objc.io — Thinking in Combine](https://www.objc.io/) — Deep understanding of reactive patterns in Swift.

---

### Module 17: Caching, Offline & Background Tasks

Users expect apps to work even with poor or no connectivity. Offline-first architecture means your app stores data locally and syncs when a connection is available. This requires thoughtful caching strategies: `NSCache` for in-memory image caching, `URLCache` for HTTP response caching, and custom disk caches for persistent storage. Background tasks (`BGTaskScheduler`) let your app refresh data or perform processing while it's not in the foreground. You'll also learn about push notifications (both local and remote via APNs), WidgetKit for home screen widgets, and how to manage app lifecycle through scene phases. These features transform a basic app into a polished, production-quality experience.

**Mini Project:** Build a news reader app with offline caching and background refresh

**Big Tech Tip:** Offline-first thinking impresses interviewers. Describe cache invalidation strategies (time-based, event-based, hybrid).

**References:**
- 📺 YouTube: [Sean Allen — iOS Background Tasks](https://www.youtube.com/c/SeanAllen) — Background refresh and download sessions.
- 📖 Web: [Apple WWDC — Advances in App Background Execution](https://developer.apple.com/videos/play/wwdc2019/707/) — Official background tasks session.
- 📖 Web: [Apple — WidgetKit Documentation](https://developer.apple.com/documentation/widgetkit) — Building iOS widgets.
- 📖 Web: [Hacking with Swift — Push Notifications](https://www.hackingwithswift.com/read/21/overview) — Local and remote notification guide.
- 📖 Web: [NSHipster — URLCache](https://nshipster.com/nsurlcache/) — Deep dive into HTTP caching on iOS.

---

### Module 18: App Lifecycle, Deep Links & Extensions

Understanding the full app lifecycle — from launch to termination — is essential for managing resources, restoring state, and handling interruptions gracefully. The `@main` attribute, `App` protocol, and `ScenePhase` environment give you hooks into every lifecycle event. Deep linking (Universal Links and custom URL schemes) lets users navigate directly to specific content in your app from the web, other apps, or notifications — critical for user engagement. App Intents framework powers Siri integration, Spotlight search, and Shortcuts. App extensions (widgets, share extensions, notification extensions) extend your app's functionality beyond the main app, with shared data managed through App Groups.

**Mini Project:** Add deep linking, Spotlight search, and a widget to the news reader app

**Big Tech Tip:** Deep linking architecture is a system design interview topic. Know URL routing patterns and how to handle navigation from external sources.

**References:**
- 📺 YouTube: [Sean Allen — iOS Deep Linking](https://www.youtube.com/c/SeanAllen) — Universal Links and URL scheme handling.
- 📖 Web: [Apple — Supporting Universal Links](https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app) — Official deep linking guide.
- 📖 Web: [Apple — App Intents](https://developer.apple.com/documentation/appintents) — Siri, Shortcuts, and Spotlight integration.
- 📖 Web: [Apple — Creating a Widget Extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension) — Official widget guide.
- 📖 Web: [Hacking with Swift — App Groups](https://www.hackingwithswift.com/read/32/overview) — Sharing data between app and extensions.

---

## Phase 4: Advanced Topics (Modules 19–24)

> **Goal:** Master advanced iOS topics that differentiate senior engineers. These modules cover the skills that separate mid-level from senior iOS engineers. Advanced Swift language features, comprehensive testing strategies, performance optimization, security, modularization, and CI/CD — mastering these topics demonstrates the depth and breadth expected at big tech companies.

---

### Module 19: Advanced Swift

Swift 5.9+ and Swift 6 introduce powerful metaprogramming capabilities. Property wrappers (`@propertyWrapper`) let you add custom behavior to stored properties — you've already used `@State` and `@Binding`, which are property wrappers. Result builders (`@resultBuilder`) power SwiftUI's declarative syntax. Macros (freestanding and attached) generate code at compile time, reducing boilerplate — `@Observable`, `@Model`, and `#Predicate` are all macros. Understanding opaque types (`some`) vs existential types (`any`) and their performance implications shows deep language knowledge. Noncopyable types (`~Copyable`), new in Swift 6, provide ownership semantics similar to Rust, giving you precise control over resource lifetimes.

**Mini Project:** Create a custom property wrapper for validated form fields + a simple macro

**Big Tech Tip:** Macros and property wrappers show language mastery. Great for senior-level interviews.

**References:**
- 📺 YouTube: [Point-Free — Swift Macros](https://www.pointfree.co/) — Advanced Swift content from Brandon Williams and Stephen Celis.
- 📖 Web: [Apple WWDC 2023 — Write Swift Macros](https://developer.apple.com/videos/play/wwdc2023/10166/) — Official macro introduction.
- 📖 Web: [Hacking with Swift — Property Wrappers](https://www.hackingwithswift.com/swift/5.1/property-wrappers) — Practical property wrapper guide.
- 📖 Web: [Swift.org — Macros](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/) — Official macro documentation.
- 📖 Web: [Swift by Sundell — Result Builders](https://www.swiftbysundell.com/articles/deep-dive-into-swift-function-builders/) — Understanding the magic behind SwiftUI syntax.

---

### Module 20: Testing & Quality

Testing is what makes architecture matter. Swift Testing (introduced at WWDC 2024) is Apple's modern testing framework using `@Test`, `@Suite`, `#expect`, and `#require` — cleaner syntax than XCTest. You'll learn unit testing best practices (Arrange-Act-Assert), testing async code, mocking dependencies with protocols, and TCA's `TestStore` for exhaustive reducer testing. UI testing with `XCUITest` verifies user flows end-to-end. Snapshot testing (using Point-Free's `swift-snapshot-testing`) catches visual regressions. Code coverage analysis and linting (SwiftLint, SwiftFormat) ensure code quality at scale. At big tech companies, tests aren't optional — many require 80%+ coverage and block merges on test failures.

**Mini Project:** Achieve 90%+ test coverage on the journaling app (unit + UI + snapshot tests)

**Big Tech Tip:** Write tests in interviews. Even if not asked, mentioning testability shows senior thinking.

**References:**
- 📺 YouTube: [Sean Allen — iOS Unit Testing](https://www.youtube.com/c/SeanAllen) — Practical testing tutorials.
- 📖 Web: [Apple WWDC 2024 — Meet Swift Testing](https://developer.apple.com/videos/play/wwdc2024/10179/) — Official introduction to the new framework.
- 📖 Web: [Point-Free — swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing) — Snapshot testing library.
- 📖 Web: [Hacking with Swift — Testing Swift](https://www.hackingwithswift.com/read/39/overview) — XCTest fundamentals.
- 📖 Web: [Apple — Testing Documentation](https://developer.apple.com/documentation/testing) — Official testing guides.

---

### Module 21: Performance & Optimization

Performance is what separates good apps from great ones. Instruments is your primary tool: Time Profiler shows you where CPU time is spent, Allocations tracks memory usage, Leaks detects retain cycles, and the Core Animation instrument reveals rendering bottlenecks. For SwiftUI, performance means minimizing unnecessary body evaluations through proper view identity and `Equatable` conformance. Image optimization (downsampling large images, using thumbnails, progressive loading) dramatically reduces memory usage. App launch time optimization (reducing pre-main work, lazy loading) ensures users aren't waiting. At big tech companies, there are strict performance budgets — apps must launch within a certain time, maintain 60fps scrolling, and stay within memory limits.

**Mini Project:** Profile and optimize the news reader app — achieve < 2s cold launch

**Big Tech Tip:** Performance optimization is a senior engineer skill. Know how to use Instruments fluently and articulate optimization strategies.

**References:**
- 📺 YouTube: [Sean Allen — iOS Performance Tips](https://www.youtube.com/c/SeanAllen) — Practical profiling with Instruments.
- 📖 Web: [Apple WWDC — Ultimate Application Performance Survival Guide](https://developer.apple.com/videos/play/wwdc2021/10181/) — Comprehensive performance session.
- 📖 Web: [Apple — MetricKit Documentation](https://developer.apple.com/documentation/metrickit) — On-device performance diagnostics.
- 📖 Web: [Apple WWDC — Demystify SwiftUI Performance](https://developer.apple.com/videos/play/wwdc2023/10160/) — SwiftUI-specific performance guidance.
- 📖 Web: [Hacking with Swift — Image Optimization](https://www.hackingwithswift.com/read/0/overview) — Memory management and image optimization tips.

---

### Module 22: Security & Privacy

Security and privacy are non-negotiable in production apps, especially at big tech companies handling sensitive user data. Keychain Services is the proper way to store secrets (tokens, passwords) — never UserDefaults. Biometric authentication (Face ID / Touch ID via `LocalAuthentication`) provides secure, frictionless login. App Transport Security (ATS) enforces HTTPS, and SSL/TLS pinning adds an extra layer of protection against man-in-the-middle attacks. Privacy manifests (required since 2024) and required reason APIs ensure your app transparently declares what data it accesses and why. Understanding the OWASP Mobile Top 10 security risks and how to mitigate them in iOS shows security-conscious engineering.

**Mini Project:** Add biometric login and Keychain token storage to the GitHub app

**Big Tech Tip:** Security questions are common at fintech and big tech. Know Keychain, biometrics, ATS, and certificate pinning.

**References:**
- 📺 YouTube: [Sean Allen — Keychain and Biometric Auth](https://www.youtube.com/c/SeanAllen) — Practical security implementations.
- 📖 Web: [Apple — Keychain Services](https://developer.apple.com/documentation/security/keychain_services) — Official Keychain documentation.
- 📖 Web: [Apple — Privacy Manifests](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files) — Required since 2024.
- 📖 Web: [OWASP — Mobile Top 10](https://owasp.org/www-project-mobile-top-10/) — Standard mobile security risks.
- 📖 Web: [Apple — LocalAuthentication](https://developer.apple.com/documentation/localauthentication) — Face ID / Touch ID integration.

---

### Module 23: Modularization & Scalable Architecture

When an app grows to millions of lines of code with dozens of engineers, monolithic architecture becomes a bottleneck — build times slow down, merge conflicts multiply, and changes in one area unexpectedly break another. Modularization using SPM local packages solves this by splitting the app into independent feature modules with explicit dependency boundaries. Each module has its own public API (interface module), implementation, and tests. A clean dependency graph ensures modules don't have circular dependencies. Feature flags and A/B testing architecture allow gradual rollout of new features. A design system module provides reusable UI components and tokens. Analytics and logging abstraction layers ensure consistent instrumentation. This architectural approach is how every major tech company structures their iOS apps.

**Mini Project:** Refactor the capstone app into 5+ SPM modules with clean dependency graph

**Big Tech Tip:** "How would you modularize a large iOS app?" is a system design question at every big tech company.

**References:**
- 📺 YouTube: [Point-Free — Modular Architecture](https://www.pointfree.co/) — Deep dives into SPM modules and dependency management.
- 📖 Web: [Apple WWDC — Creating Swift Packages](https://developer.apple.com/videos/play/wwdc2019/410/) — Official SPM session.
- 📖 Web: [Point-Free — swift-dependencies](https://github.com/pointfreeco/swift-dependencies) — Dependency injection for modular apps.
- 📖 Web: [Kodeco — Modular Architecture in iOS](https://www.kodeco.com/) — Practical modularization guide.
- 📖 Web: [Uber Engineering Blog](https://eng.uber.com/) — How Uber structures their massive iOS codebase.

---

### Module 24: CI/CD & Release Engineering

Continuous Integration and Continuous Deployment (CI/CD) automate building, testing, and deploying your app. Xcode Cloud (Apple's native CI/CD) integrates directly with Xcode and App Store Connect. GitHub Actions provides more flexibility for custom workflows. Fastlane automates tedious tasks: `match` manages code signing, `gym` builds your app, `pilot` uploads to TestFlight, and `deliver` submits to the App Store. Understanding code signing (certificates, provisioning profiles) is essential — it's one of the most confusing parts of iOS development. TestFlight enables both internal and external beta testing. App Store review guidelines knowledge prevents rejection. At scale, CI/CD includes build time budgets, flaky test detection, and feature flag-based gradual rollouts.

**Mini Project:** Set up a full CI/CD pipeline for the capstone app with Xcode Cloud

**Big Tech Tip:** Knowing CI/CD shows you can operate at scale. Mention build time budgets, flaky test strategies, and trunk-based development.

**References:**
- 📺 YouTube: [Sean Allen — Xcode Cloud & TestFlight](https://www.youtube.com/c/SeanAllen) — CI/CD setup walkthrough.
- 📖 Web: [Apple — Xcode Cloud](https://developer.apple.com/xcode-cloud/) — Official Xcode Cloud documentation.
- 📖 Web: [Fastlane Docs](https://docs.fastlane.tools/) — Complete Fastlane setup and usage guide.
- 📖 Web: [Apple — Code Signing Guide](https://developer.apple.com/support/code-signing/) — Understanding certificates and profiles.
- 📖 Web: [GitHub Actions for iOS](https://github.com/features/actions) — Setting up iOS CI with GitHub Actions.

---

## Phase 5: System Design & Interview Prep (Modules 25–28)

> **Goal:** Prepare for big tech iOS interviews specifically. The best-paying tech companies administer a system design round as part of their final-stage interview loops. These interviews challenge you to architect a complex system on iOS — like designing an encrypted messaging app, a social feed, or an analytics SDK. Combined with algorithmic coding challenges and behavioral interviews, this phase gives you the complete preparation needed to succeed.

---

### Module 25: iOS System Design

Mobile system design interviews are different from backend system design. You'll be asked to design features like a photo-sharing feed, a chat app, an image loading library, or an analytics SDK. The key is thinking in layers: UI → ViewModel → Service → Network → Cache → Persistence. You need to discuss trade-offs (REST vs. GraphQL, polling vs. WebSockets), capacity planning (memory budget, disk budget, battery budget), and how to handle offline scenarios. The interview is as much about communication as technical knowledge — you lead the conversation, ask clarifying questions, sketch diagrams, and make explicit trade-off decisions. Practice multiple system designs and get comfortable thinking about scalability, reliability, and user experience simultaneously.

**Mini Project:** Write a complete system design doc for a social media feed feature

**Big Tech Tip:** Practice drawing layered architecture diagrams. Think in terms of: what data flows where, what gets cached, what happens offline.

**References:**
- 📖 Blog: [Jacob's Tech Tavern — iOS System Design Interviews in 2026](https://blog.jacobstechtavern.com/p/system-design-interview) — Written from personal experience going through 3 system design challenges at 3 different big tech companies in late 2025. Full worked example included.
- 📖 Blog: [Jacob's Tech Tavern — Inside Meta's iOS System Design Interview](https://blog.jacobstechtavern.com/p/ios-system-design) — Detailed breakdown of what Meta specifically looks for in iOS system design rounds.
- 📖 Web: [The Mobile Interview — Cracking the Mobile System Design Interview](https://themobileinterview.com/cracking-the-mobile-system-design-interview/) — Comprehensive framework from an engineer with 14+ years of mobile experience.
- 📖 Web: [GitHub — weeeBox/mobile-system-design](https://github.com/weeeBox/mobile-system-design) — Open-source framework for mobile system design interviews with detailed templates.
- 📖 Web: [Swift Anytime — Ultimate Guide to Mobile System Design Interview](https://www.swiftanytime.com/blog/ultimate-guide-to-mobile-system-design-interview) — Covers High Level Design, Low Level Design, and includes mock interview walkthrough.
- 📖 Web: [The New Stack — How To Prepare for Big Tech Interviews as an iOS Engineer](https://thenewstack.io/how-to-prepare-for-big-tech-interviews-as-an-ios-engineer/) — Practical guide covering coding, system design, and behavioral rounds.
- 📖 Web: [System Design Newsletter — The Mobile Engineer's Guide](https://newsletter.systemdesign.one/p/mobile-system-design-interview) — Step-by-step strategy for the 45-minute interview format.
- 📖 Course: [iOS Interview Guide — System Design Video Course](https://iosinterviewguide.com/system-design-interview) — Walks through e-commerce, messenger, and Instagram-like app designs.

---

### Module 26: Data Structures & Algorithms in Swift

Algorithmic interviews (LeetCode-style) are still a core component of big tech hiring. You need to implement data structures and solve problems in Swift specifically. Focus on the patterns that appear most frequently: two pointers, sliding window, binary search, BFS/DFS, dynamic programming, and hash maps. Swift's standard library provides powerful collection types, but you should understand their internals — how `Dictionary` uses hash tables, how `Array` manages contiguous memory, and how to implement custom collections with `Sequence` and `IteratorProtocol`. LeetCode Medium is the target difficulty for most companies. Consistent daily practice (2–3 problems) over 3 months is more effective than cramming.

**Mini Project:** Implement 5 common data structures as Swift packages with tests

**Big Tech Tip:** LeetCode Medium is the target difficulty. Practice 2–3 problems daily for 3 months. Focus on patterns, not memorizing solutions.

**References:**
- 📺 YouTube: [Sean Allen — iOS Interview Questions](https://www.youtube.com/c/SeanAllen) — Swift-specific algorithm and interview prep.
- 📺 YouTube: [CS Dojo — Data Structures & Algorithms](https://www.youtube.com/c/CSDojo) — Clear explanations of CS fundamentals with emphasis on interview prep.
- 📖 Web: [LeetCode — Swift Solutions](https://leetcode.com/) — Practice problems with Swift language support.
- 📖 Web: [Exercism — Swift Track](https://exercism.org/tracks/swift) — Language fluency through coding exercises.
- 📖 Book: "Cracking the Coding Interview" by Gayle McDowell — The classic interview prep book.
- 📖 Web: [swift-algorithm-club](https://github.com/kodecocodes/swift-algorithm-club) — Data structures and algorithms implemented in Swift.

---

### Module 27: Behavioral & Culture Interviews

Behavioral rounds are elimination rounds at big tech companies — you can ace the technical interviews and still fail because of a poor behavioral performance. The STAR method (Situation, Task, Action, Result) gives you a framework for telling compelling stories about your experience. You need 8–10 polished stories covering: solving a challenging technical problem, disagreeing with a teammate, handling failure, prioritizing under pressure, mentoring others, and driving a project from ambiguity to completion. Each story should demonstrate a specific leadership principle or competency the company values. Equally important: researching the specific company's culture and values, crafting your professional narrative (why this company? why this role?), and preparing thoughtful questions to ask your interviewers.

**Exercise:** Write 10 STAR stories from your experience (or projects)

**Big Tech Tip:** Behavioral rounds are elimination rounds. Prepare as seriously as technical rounds. Practice out loud.

**References:**
- 📺 YouTube: [Sean Allen — iOS Interview Tips](https://www.youtube.com/c/SeanAllen) — Interview preparation and career advice.
- 📖 Web: [Glassdoor — iOS Developer Interview Questions](https://www.glassdoor.com/) — Real interview questions reported by candidates.
- 📖 Book: "Cracking the Coding Interview" — Chapters on behavioral interviews.
- 📖 Web: [levels.fyi](https://www.levels.fyi/) — Compensation data and interview experiences at tech companies.
- 📖 Web: [Teamblind](https://www.teamblind.com/) — Anonymous discussions about tech interviews and compensation.

---

### Module 28: Mock Interview Practice

The best way to prepare for interviews is to simulate them. This module has you practice all three interview types: coding (2 LeetCode problems in 45 minutes), system design (architect a feature end-to-end in 45 minutes), and iOS domain knowledge rapid-fire (app lifecycle, SwiftUI vs UIKit, ARC, concurrency, testing). Take-home projects (common at some companies) require different skills — time management, documentation, and showcasing architectural thinking within constraints. Code review exercises (reviewing a PR and giving feedback) test your ability to communicate technical decisions clearly. Record yourself answering questions and review for filler words, pacing, and clarity.

**Exercise:** Do 3 full mock interviews (coding + system design + behavioral)

**Big Tech Tip:** Record yourself answering questions. Review for filler words, pacing, and clarity. Time yourself strictly.

**References:**
- 📺 YouTube: [Sean Allen — Mock iOS Interview](https://www.youtube.com/c/SeanAllen) — Simulated iOS interview recordings.
- 📖 Web: [Pramp](https://www.pramp.com/) — Free peer-to-peer mock interviews.
- 📖 Web: [interviewing.io](https://interviewing.io/) — Anonymous mock interviews with engineers from top companies.
- 📖 Web: [LeetCode — Mock Assessment](https://leetcode.com/assessment/) — Timed practice sessions.
- 📖 Web: [iOS Interview Guide](https://iosinterviewguide.com/) — Comprehensive iOS-specific interview preparation platform.

---

## Phase 6: Capstone Project (Modules 29–30)

> **Goal:** Build and ship a production-quality app demonstrating all skills. The capstone project is where everything comes together. You'll build a real app from scratch, using every skill learned across the curriculum — modern SwiftUI, TCA architecture, SwiftData persistence, Swift Concurrency networking, full test coverage, modular architecture, CI/CD pipeline, and more. This becomes both your portfolio piece and your proof of competence.

---

### Module 29: Capstone — Full App Build

The capstone app is "DevJournal" — an iOS app for developers to track their learning, write daily reflections, manage a reading list, and share progress. It incorporates 15 major features spanning the entire curriculum: onboarding flow with animations, Sign in with Apple authentication, a dashboard with learning stats and streaks, rich text journal entries, a reading list with URL previews, a tag system with search, offline-first SwiftData persistence, background sync, home screen widget, deep linking, dark mode and Dynamic Type support, localization, comprehensive tests (90%+ coverage), and performance optimization. The architecture uses TCA for core features, SPM modular structure with 5+ modules, swift-dependencies for DI, and Swift 6 strict concurrency throughout.

**Deliverable:** Complete, testable, performant app ready for TestFlight distribution

**References:**
- 📖 Web: [Apple — Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) — Design principles for iOS apps.
- 📖 Web: [Apple — App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) — What to follow for App Store approval.
- 📖 Web: [Apple — Sign in with Apple](https://developer.apple.com/sign-in-with-apple/) — Authentication integration guide.
- 📖 Web: [GitHub — isowords](https://github.com/pointfreeco/isowords) — Open-source iOS word game built entirely with TCA. Excellent reference architecture.
- 📖 Web: [objc.io — Thinking in SwiftUI](https://www.objc.io/books/thinking-in-swiftui/) — Advanced SwiftUI patterns for production apps.

---

### Module 30: Polish, Ship & Portfolio

The final module transforms your app and yourself into a market-ready package. App Store Optimization (ASO) — title, subtitle, keywords, screenshots — determines whether people find and download your app. Creating compelling screenshots and preview videos requires marketing thinking. Post-launch, you'll monitor crashes, analyze user feedback, and iterate. Beyond the app, building your iOS developer brand is essential: a GitHub profile with pinned repos showing clean code, technical blog posts demonstrating depth of knowledge, and active participation in the iOS community (Swift Forums, iOS Dev Weekly, conferences). Your resume should highlight impact and measurable results, not just technologies used.

**Final Deliverables:**
1. Published app on App Store (or TestFlight)
2. GitHub repo with clean commit history & README
3. 2 technical blog posts about challenges solved
4. Updated resume & LinkedIn
5. Portfolio website

**References:**
- 📺 YouTube: [Sean Allen — Building Your iOS Dev Career](https://www.youtube.com/c/SeanAllen) — Career advice and portfolio tips.
- 📖 Web: [iOS Dev Weekly](https://iosdevweekly.com/) — The essential weekly newsletter for iOS developers.
- 📖 Web: [Swift Forums](https://forums.swift.org/) — Official Swift language community discussions.
- 📖 Web: [Swift by Sundell](https://www.swiftbysundell.com/) — Articles and podcast, excellent for blog post inspiration.
- 📖 Web: [App Store Connect Help](https://developer.apple.com/help/app-store-connect/) — Managing your app on the App Store.

---

## Key Learning Resources — Master Reference

### YouTube Channels (Subscribe to all)
| Channel | Focus | Why Follow |
|---------|-------|-----------|
| [CodeWithChris](https://www.youtube.com/c/CodeWithChris) | Beginner SwiftUI & Swift | Largest dedicated iOS tutorial channel, challenge-based learning |
| [Sean Allen](https://www.youtube.com/c/SeanAllen) | iOS career & interviews | Senior Silicon Valley iOS engineer, 3 videos/week, interview prep |
| [Kavsoft](https://www.youtube.com/c/Kavsoft) | SwiftUI UI designs | Beautiful UI tutorials that push SwiftUI's boundaries |
| [Paul Hudson / Hacking with Swift](https://www.youtube.com/c/PaulHudson) | Everything Swift | Creator of 100 Days of SwiftUI, prolific educator |
| [Lets Build That App](https://www.youtube.com/c/LetsBuildThatApp) | Full app builds | Builds real apps from scratch (YouTube, Messenger clones) |
| [Kilo Loco](https://www.youtube.com/c/KiloLoco) | Swift & SwiftUI | Project-based tutorials with focus on practical real-world apps |
| [Brian Advent](https://www.youtube.com/c/BrianAdvent) | Advanced iOS (ARKit, Core ML) | Deep dives into advanced iOS frameworks |
| [Fireship](https://www.youtube.com/c/Fireship) | Tech overview | Lightning-fast explainers to understand tech landscape broadly |
| [Point-Free](https://www.pointfree.co/) | Advanced Swift & TCA | The gold standard for advanced Swift architecture (paid, but invaluable) |

### Free Courses
| Course | Provider | Description |
|--------|----------|-------------|
| [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) | Hacking with Swift | Community-favorite, builds 19+ apps day by day |
| [CS193p Spring 2025](https://cs193p.stanford.edu/) | Stanford University | All 16 lectures free on YouTube, the academic gold standard |
| [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui) | Apple | Official step-by-step tutorials building a Landmarks app |
| [Develop in Swift](https://developer.apple.com/tutorials/develop-in-swift) | Apple | Apple's own Swift learning path |

### Blogs & Newsletters
| Resource | Description |
|----------|-------------|
| [Hacking with Swift](https://www.hackingwithswift.com/) | Largest collection of Swift tutorials and examples |
| [Swift by Sundell](https://www.swiftbysundell.com/) | Deep articles and podcast on Swift development |
| [iOS Dev Weekly](https://iosdevweekly.com/) | Essential weekly newsletter curating top iOS content |
| [Jacob's Tech Tavern](https://blog.jacobstechtavern.com/) | Big tech iOS interview prep and system design |
| [Swift Forums](https://forums.swift.org/) | Official Swift language community discussions |
| [Point-Free Blog](https://www.pointfree.co/blog) | Advanced Swift and TCA updates |
| [Kodeco (formerly raywenderlich)](https://www.kodeco.com/) | Comprehensive tutorials and books for iOS development |

### Books
| Book | Author | Focus |
|------|--------|-------|
| The Swift Programming Language | Apple | Official language reference |
| Thinking in SwiftUI | objc.io | Deep understanding of SwiftUI's mental model |
| Advanced Swift | objc.io | Expert-level Swift knowledge |
| Cracking the Coding Interview | Gayle McDowell | Algorithm interview preparation |
| Building Mobile Apps at Scale | Gergely Orosz | How big tech builds mobile apps |

---

## How to Use This File with Claude Code

1. **Start each module** by asking: "Let's work on Module X. Explain the concepts and create the code lab."
2. **Build mini projects** by asking: "Create the mini project for Module X with full code and tests."
3. **Get quizzed** by asking: "Quiz me on Module X topics for interview prep."
4. **System design practice** by asking: "Walk me through the system design of [feature]."
5. **Code review** by asking: "Review my code for [file] and suggest improvements."
6. **Mock interview** by asking: "Give me a mock iOS interview question on [topic]."

### Suggested Pace

| Timeline | Modules | Hours/Week |
|----------|---------|-----------|
| Month 1 | 1–6 (Foundation) | 15–20 |
| Month 2 | 7–12 (SwiftUI & Architecture) | 15–20 |
| Month 3 | 13–18 (Data & Networking) | 15–20 |
| Month 4 | 19–24 (Advanced) | 20–25 |
| Month 5 | 25–28 (Interview Prep) | 20–25 |
| Month 6 | 29–30 (Capstone & Ship) | 25–30 |

**Total: ~6 months to big-tech-ready (with dedication)**

---

## Progress Tracker

```
Phase 1: Foundation
[ ] Module 1: Swift Language Essentials
[ ] Module 2: Control Flow & Collections
[ ] Module 3: Functions, Closures & Enums
[ ] Module 4: Structs, Classes & Protocols
[ ] Module 5: Generics, Error Handling & Memory Management
[ ] Module 6: Xcode Mastery & Developer Tools

Phase 2: SwiftUI & App Architecture
[ ] Module 7: SwiftUI Fundamentals
[ ] Module 8: Advanced SwiftUI
[ ] Module 9: State Management & Data Flow
[ ] Module 10: App Architecture — MVVM + TCA
[ ] Module 11: Lists, Grids & Performance
[ ] Module 12: UIKit Interop & Legacy Codebase Skills

Phase 3: Data, Networking & Persistence
[ ] Module 13: Swift Concurrency Deep Dive
[ ] Module 14: Networking
[ ] Module 15: SwiftData & Persistence
[ ] Module 16: Combine Framework
[ ] Module 17: Caching, Offline & Background Tasks
[ ] Module 18: App Lifecycle, Deep Links & Extensions

Phase 4: Advanced Topics
[ ] Module 19: Advanced Swift
[ ] Module 20: Testing & Quality
[ ] Module 21: Performance & Optimization
[ ] Module 22: Security & Privacy
[ ] Module 23: Modularization & Scalable Architecture
[ ] Module 24: CI/CD & Release Engineering

Phase 5: Interview Prep
[ ] Module 25: iOS System Design
[ ] Module 26: Data Structures & Algorithms in Swift
[ ] Module 27: Behavioral & Culture Interviews
[ ] Module 28: Mock Interview Practice

Phase 6: Capstone
[ ] Module 29: Capstone — Full App Build
[ ] Module 30: Polish, Ship & Portfolio
```
