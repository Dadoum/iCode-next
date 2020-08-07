import Foundation
import CoreADI

/**
    Entry point of program.

     - Parameter args: the arguments that were used to invoke the program.
 */
func main(_ args: [String]) -> Int32 {
    registerDefaultProjectBuilders()
    do {
        ProjectService.projectLoaded.raise(eventArgs: ProjectLoadedEventArgs(project: nil))
        try ProjectService.loadProject(path: "/home/dadoum/Téléchargements/Undecimus/Undecimus.xcodeproj/")
        ProjectService.buildProject()
    }
    catch {
        LogService.log("Project load failed.", severity: .warning)
        return 1
    }

    return 0
}

/**
    Registers default project builders.
 */
func registerDefaultProjectBuilders() {
    ProjectService.registerBuilder(builder: ARM_Darwin_ProjectBuilder())
}

// Use a main function
exit(main(CommandLine.arguments))
