//
// Created by dadoum on 01/08/2020.
//

import Foundation
import XcodeProj

/**
    Object representing how to manipulate a project.
 */
public protocol ProjectBuilder {
    /// RegEx to identify which projects should be loaded by the builder
    var supportedFilePattern : NSRegularExpression { get }

    /**
        Determines whether a project is loadable by this builder

         - Parameter path: Path to the project file.
         - Returns: Boolean
     */
    static func canLoad(project: String) -> Bool

    /**
        Loads a project.

         - Parameter path: Path to the project file.
         - Returns: Loaded project
     */
    static func loadProject(path: String) -> XcodeProj?
    /**
        Build the specified project.

         - Parameter project: Project to build.
         - Returns: Exit code.
     */
    func buildProject(project: XcodeProj) -> Int
    /**
        Run the specified project.

         - Parameter project: Project to run.
         - Returns: Exit code.
     */
    func runProject(project: XcodeProj) -> Int
}
