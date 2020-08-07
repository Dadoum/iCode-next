//
// Created by dadoum on 01/08/2020.
//

import Foundation
import XcodeProj

/**
    Class that manages projects of different kinds
 */
public class ProjectService {
    /// Loaded project
    public static var project: XcodeProj? = nil
    /// Builder of the loaded project
    public static var projectBuilder: ProjectBuilder? = nil
    /// Array of all registered project builders
    public static var projectBuilders: [ProjectBuilder] = []
    /// Event triggered when new project is loaded.
    public static var projectLoaded: Event<ProjectLoadedEventArgs> = Event<ProjectLoadedEventArgs>()

    /**
        Registers a project builder.

         - Parameter builder: Project builder to register
     */
    public static func registerBuilder(builder: ProjectBuilder) {
        projectBuilders.append(builder as! ProjectBuilder)
    }

    /**
        Loads a project.

         - Parameter path: Path to project to load
     */
    public static func loadProject(path: String) throws {
        LogService.log("Searching for a project builder...")
        for pb in projectBuilders {
            if type(of: pb).canLoad(project: path) {
                LogService.log("A project builder has been found ! (\(type(of:pb)))")
                projectBuilder = pb
                let loadedProject = type(of: pb).loadProject(path: path)
                projectLoaded.raise(eventArgs: ProjectLoadedEventArgs(project: loadedProject))
                project = loadedProject
                return
            }
        }
        LogService.log("No project builder can load this project", severity: .error)
        throw ProjectLoadingError.noProjectHandlerFound
    }

    /**
        Build the active project.

         - Returns: Error code
     */
    public static func buildProject() -> Int {
        return projectBuilder!.buildProject(project: project!)
    }

    /**
        Runs the active project.

         - Returns: Error code
     */
    public static func runProject() -> Int {
        return projectBuilder!.runProject(project: project!)
    }

    /**
        Errors related to project loading.
     */
    public enum ProjectLoadingError : Error {
        /**
            Error related to project loading.
         */
        case invalidProject,
             insufficientPermission,
             nonExistingProject,
             noProjectHandlerFound
    }
}

public struct ProjectLoadedEventArgs {
    public var project : XcodeProj?
}
