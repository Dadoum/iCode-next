# LogService

Logging helper class

``` swift
public class LogService
```

## Methods

### `log(_:severity:file:line:)`

Print text with time and invocation informations, and write it inside the internal log file.

``` swift
public static func log(_ text: String, severity: LogSeverity = .info, file: String = #file, line: Int = #line)
```

#### Parameters

  - text: - text: the text that will be logged
  - severity: - severity: severity of the log
