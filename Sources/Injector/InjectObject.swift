import Foundation
import SwiftUI

@available(macOS 10.15, *)
@propertyWrapper
public struct InjectObject<T: ObservableObject>: DynamicProperty {
  @ObservedObject public var wrappedValue: T
  
  public init() {
    wrappedValue = Injector.resolve()
  }
}
