//
// Created by dadoum on 02/08/2020.
//

import Foundation
import CoreFoundation
import PathKit
import XcodeProj

public class ARM_Darwin_ProjectBuilder : ProjectBuilder {
    public var supportedFilePattern: NSRegularExpression {
        get {
            do {
                return try NSRegularExpression(pattern: ".*\\.xcodeproj")
            }
            catch {
                fatalError("RegExs used in iCode are not supported.")
            }
        }
    }

    public static func canLoad(project: String) -> Bool {
        true
    }

    public static func loadProject(path: String) -> XcodeProj? {
        do {
            print(path)
            let project = try XcodeProj(path: Path(path))
            return project
        }
        catch {
            print("\(error) has been caught!")
        }
        return nil
    }

    public func buildProject(project: XcodeProj) -> Int {
        do {
            for target in project.pbxproj.nativeTargets {
                for xcp in project.pbxproj.buildFiles {
                    if let settings = xcp.settings {
                        LogService.log(settings["COMPILER_FLAGS"] as! String)
                    }
                }

                for config in target.buildConfigurationList!.buildConfigurations {
                    LogService.log(config.name)
                    let buildSett = config.buildSettings
                    LogService.log(String(describing: buildSett))
                }
            }

        }
        catch {
            return 1
        }
        return 1
    }

    public func runProject(project: XcodeProj) -> Int {
        fatalError("runProject(project:) has not been implemented")
    }
}
