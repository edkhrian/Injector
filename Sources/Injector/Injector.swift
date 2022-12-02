import Foundation

public final class Injector {
  private var isRegistered = false
  private var dependencies = [String: Any]()
  private var factories = [String: () -> Any]()
  private static var shared = Injector()
  
  static func register<T>(_ factory: @escaping () -> T) {
    shared.register(factory)
  }
  
  static func resolve<T>() -> T {
    shared.resolve()
  }
  
  private func register<T>(_ factory: @escaping () -> T) {
    let key = String(describing: T.self)
    factories[key] = factory as () -> Any
  }
  
  private func resolve<T>() -> T {
    if factories.isEmpty, let registration = self as? InjectorRegistration {
      registration.registerAll()
    }
    let key = String(describing: T.self)
    if dependencies[key] == nil {
      dependencies[key] = factories[key]?()
    }
    let dependency = dependencies[key] as? T
    
    precondition(dependency != nil, "No dependecy found for \(key)")
    
    return dependency!
  }
  
  private init() { }
}
