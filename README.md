# Injector

A lightweight dependency injection library used primarly for my own SwiftUI projects 

## Install

Only available for Swift Package Manager

## Usage

Register all dependencies at once in separate file ProjectName+Injections.swift or somewhere else:

```swift
import Injector

extension Injector: InjectorRegistration {
  public func registerAll() {
    Injector.register { API() }
    Injector.register { SyncService() }
    Injector.register { AppState() }
    // other dependencies
  }
}
```

There are two property wrappers available: `@Inject` and `@InjectObject` (cause to rerender a SwiftUI View on changes in an object, works as @ObservedObject)
```swift
import Foundation
import SwiftUI
import Injector

struct MainScreen: View {
  @Inject var syncService: SyncService
  @InjectObject var appState: AppState
  @StateObject var viewState = MainScreenState()
  
  var body: some View {
    Text("App \(appState.title)")
  }
}
```

```swift
import Foundation
import Injector

class SyncService {
  @Inject var api: API
  @Inject var appState: AppState

  func sync() {
    api.getImages()
    // ...
  }
}

```
