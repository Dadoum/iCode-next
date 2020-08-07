import Foundation

/**
    Logging helper class
 */
public class LogService {
    /**
        Print text with time and invocation informations, and write it inside the internal log file.

        - Parameter text: the text that will be logged
        - Parameter severity: severity of the log
     */
    public static func log(_ text: String, severity: LogSeverity = .info, file: String = #file, line: Int = #line) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSSS" 
        let hourString = formatter.string(from: Date())
        let log = "[\(hourString)] [\(severity.description)] [\(file.lastPathComponent) at line \(line)]: " + text
        print(log)
    }
}

/**
    Severity of a log
 */
public enum LogSeverity {
    /// Basic information which has no effect about how program is running.
    case info
    /// Unexpected behaviour/error which has no immediate effect.
    case warning
    /// Unexpected behaviour/error which will force a task to abort.
    case error
    /// Unexpected behaviour/error which will force the whole program to exit.
    case fatal

    /// Converts a LogSeverity object into a its log form.
    var description : String {
        switch self {
        case .info: return "INFO"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        case .fatal: return "FATAL"
        }
    }
}
