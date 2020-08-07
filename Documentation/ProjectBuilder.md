# ProjectBuilder

Object representing how to manipulate a project.

``` swift
public protocol ProjectBuilder
```

## Requirements

## supportedFilePattern

RegEx to identify which projects should be loaded by the builder

``` swift
var supportedFilePattern: NSRegularExpression
```

## loadProject(path:)

Loads a project.

``` swift
static func loadProject(path: String) -> Project
```

### Parameters

  - path: - path: Path to the project file.

### Returns

Loaded project

## buildProject(project:)

Build the specified project.

``` swift
func buildProject(project: Project) -> Int
```

### Parameters

  - project: - project: Project to build.

### Returns

Exit code.

## runProject(project:)

Run the specified project.

``` swift
func runProject(project: Project) -> Int
```

### Parameters

  - project: - project: Project to run.

### Returns

Exit code.
