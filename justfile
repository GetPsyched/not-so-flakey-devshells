# list all the available recipes
default:
    @just --list --unsorted

# create a GitHub release with a tag
release TAG:
    gh release create "v{{TAG}}" --generate-notes
