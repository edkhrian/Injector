# Injector

A lightweight dependency injection library used primarly for my own SwiftUI projects 

## Install

Only available for Swift Package Manager

## Usage

Register all dependencies at once in separate file ProjectName+Injector or somewhere else:

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

Use the dependencies in a SwiftUI view or anywhere else:
```swift
import Foundation
import SwiftUI
import Injector

struct MainScreen: View {
  @Inject var syncService: SyncService
  @InjectObject var appState: AppState // works as @ObservedObject property wrapper, rerender the view on any changes happen
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

  func sync() {
    api.getImages()
    // ...
  }
}

```
