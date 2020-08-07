//
// Created by dadoum on 02/08/2020.
//

import Foundation

/**
    An event system implementation.
     - Parameter T: Structure passed to handlers.
 */
public class Event<T> {
    public typealias EventDelegate = (T) -> Void

    private var handlers : [EventDelegate] = []

    public func raise(eventArgs: T) {
        for handler in handlers {
            handler(eventArgs)
        }
    }

    public static func +=(left: Event<T>, right: @escaping EventDelegate) {
        left.handlers.append(right)
    }
}
