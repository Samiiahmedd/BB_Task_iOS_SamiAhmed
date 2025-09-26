
import Combine
import NetworkLayer
import CoreLocation
import UIKit


typealias Identifier = Int

extension Identifier {
    static var defaultValue: Identifier {
        return 0
    }
}

extension CLLocationCoordinate2D {
    static var defaultValue: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(0, 0)
    }
}


extension String {
    static var defaultValue: String {
        return ""
    }
}

typealias GenericPublisher<Model> = AnyPublisher<Model, NetworkError>
typealias EventPublisher<T> = PassthroughSubject<T, Never>
typealias VoidEventPublisher = EventPublisher<Void>


extension Float {
    static var defaultValue: Float {
        return 0
    }
}


extension Double {
    static var defaultValue: Double {
        return 0
    }
}

extension Bool {
    static var defaultValue: Bool {
        return false
    }
}


//Arrays
typealias CustomArray<T> = [T]

extension Array where Element: DefaultValueProviding {
    static var defaultValue: CustomArray<Element> {
        return [Element.defaultValue]
    }
}

protocol DefaultValueProviding {
    static var defaultValue: Self { get }
}

extension Array {
    static var defaultValue: [Element] {
        return []
    }
}

extension Dictionary {
    static var defaultValue: [Key: Value] {
        return [:]
    }
}
