# Cloud Native Buildpacks Build Action

> ARCHIVED: Use this instead https://github.com/dfreilich/pack-action

This action uses the `pack` utility to convert source code to a container image via [Cloud Native Buildpacks](https://buildpacks.io).

## Example

This example will:
- Build source located in the root of the source repository
- Tag the image with a "snapshot" tag (see docs below)
- Push the resulting image to Docker Hub

It assumes you have created secrets to provide your Docker Hub username and password.

```yaml
name: Build
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Build and Push
      uses: niallthomson/cnb-build-action@master
      with:
        imageName: niallthomson/sample-application
        publish: true
        snapshot: true
        registry: docker.io
        registryUsername: ${{ secrets.DOCKER_USERNAME }}
        registryPassword: ${{ secrets.DOCKER_PASSWORD }}
```

## Inputs

- `imageName`: *(Required)* The name of the image that will be created.
- `path`: The path to the source code to build from relative to the repository root. Defaults to the repository root.
- `builder`: The CNB builder image to use. Defaults to `cloudfoundry/cnb:bionic`.
- `publish`: If set to `true` will push the image created to the appropriate container registry. Defaults to `false`.
- `snapshot`: If set to `true` will tag the image with {YEAR}{MONTH}{DAY}{HOUR}{MINUTE}{SECOND}{first 6 digits of the git sha}. Defaults to `false`.
- `registry`: When using `publish`, sets the registry that will be logged in to.
- `registryUsername`: When using `publish`, sets the username used to login to the registry.
- `registryPassword`: When using `publish`, sets the password used to login to the registry.


## Outputs

- `imageName`: The name of the image that was created, including tag.
