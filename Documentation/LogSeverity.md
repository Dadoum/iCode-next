# LogSeverity

Severity of a log

``` swift
public enum LogSeverity
```

## Enumeration Cases

### `info`

Basic information which has no effect about how program is running.

``` swift
case info
```

### `warning`

Unexpected behaviour/error which has no immediate effect.

``` swift
case warning
```

### `error`

Unexpected behaviour/error which will force a task to abort.

``` swift
case error
```

### `fatal`

Unexpected behaviour/error which will force the whole program to exit.

``` swift
case fatal
```
