# ProjectService

Class that manages projects of different kinds

``` swift
public class ProjectService
```

## Properties

### `project`

Loaded project

``` swift
var project: Project?
```

### `projectBuilder`

Builder of the loaded project

``` swift
var projectBuilder: ProjectBuilder?
```

### `projectBuilders`

Array of all registered project builders

``` swift
var projectBuilders: [ProjectBuilder]
```

### `projectLoaded`

Event triggered when new project is loaded.

``` swift
var projectLoaded: Event<ProjectLoadedEventHandler>
```

## Methods

### `registerBuilder(builder:)`

Registers a project builder.

``` swift
public static func registerBuilder(builder: ProjectBuilder)
```

#### Parameters

  - builder: - builder: Project builder to register

### `loadProject(path:)`

Loads a project.

``` swift
public static func loadProject(path: String) throws
```

#### Parameters

  - path: - path: Path to project to load

### `buildProject()`

Build the active project.

``` swift
public static func buildProject() -> Int
```

#### Returns

Error code

### `runProject()`

Runs the active project.

``` swift
public static func runProject() -> Int
```

#### Returns

Error code
