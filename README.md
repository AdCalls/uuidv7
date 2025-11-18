# uuidv7

A package used by AdCalls to generate UUID's version 7.

## Installing
### Authenticating
To authenticate yourself to install the package you must create a
`gradle.properties` file inside the root directory. This file should contain 2 properties:
```
gpr.user=
gpr.token=
```
The token should have at least the `read:packages` scope. Tokens can
be created on the [GitHub Developer Settings](https://github.com/settings/tokens).
Also see [Personal Access Tokens](https://docs.github.com/en/packages/learn-github-packages/publishing-a-package#publishing-a-package).

### Dependencies
To use this library inside your Java application simply include
the following statement in your project's `build.gradle`:
```
repositories {
    ...
    mavenCentral()

    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/AdCalls/uuidv7")
        credentials {
            username = project.findProperty("gpr.user")
            password = project.findProperty("gpr.token")
        }
    }
}

dependencies {
    ...
    implementation 'com.adcalls:uuidv7:1.+'
}
```

## Making changes
After making changes a new package release will have to be made.
To do this you update the `version` tag inside `/src/build.gradle`.

## Releasing
### Authenticating
To authenticate to release a new version please see [Authentication](#authenticating).
Note that the required scope for releasing a new version is `write:packages`.

### Publishing
After making your changes and updating the version tag you will have to run
`$ ./gradlew publish`.
