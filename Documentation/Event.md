# Event

An event system implementation.

``` swift
public class Event<T>
```

## Parameters

  - T: - T: Structure passed to handlers.

## Methods

### `raise(eventArgs:)`

``` swift
public func raise(eventArgs: T)
```

### `addHandler(handler:)`

``` swift
public func addHandler(handler: @escaping (T) -> Void)
```
