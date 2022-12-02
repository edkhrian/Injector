import Foundation
import SwiftUI

@propertyWrapper
public struct Inject<T> {
  public var wrappedValue: T {
    get { return Injector.resolve() }
  }
  public init() {}
}
