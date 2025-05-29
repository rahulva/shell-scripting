# Build Configuration





# Dependency management
- Repositorioes
- Dependencies
    - Transitive dependencies

# Build Lifecycle

# Adaptablity (Plugin)
https://docs.gradle.org/current/userguide/plugin_basics.html

Plugin Types
- Core
- Community
- Local

`java` pluging

 `appplication` <- `java`

 `library` <- `java`


# Trasks
https://docs.gradle.org/current/userguide/task_basics.html
 - Compile
 -  Test
 - Publish


```bash
List tasks
./gradlew tasks

List tasks from even sub mudle (all tasks)
./gradlew tasks --all

./gradlew app:test
```


# Gradle properties
https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_configuration_properties

`org.gradle.configuration-cache=true`
`org.gradle.verbose=true`

```./gradlew test --console=verbose``` or ```./gradlew test --console=plain```

```./gradlew test -q``` Quite (Hide logs)

`--dry-run` displays the task that would run without running them

Tasks
Input > Actions > Outputs

`./gradlew app:compileJava`


Task output/outcome labels
https://docs.gradle.org/current/userguide/part5_gradle_inc_builds.html#step_4_understanding_outcome_labels

Lifecycle Tasks
eg: check, build

Applying plugins
see task dependencies

https://plugins.gradle.org/

../gradlew :app:tasks

tiJson - Creates a JSON file with task dependencies of a given task, and their task types.
tiOrder - Displays which tasks would be executed in what order for a given task, and their task types.
tiTree - Displays task dependencies of a given task as a tree, and their task types.
