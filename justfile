# list all the available recipes
default:
    @just --list --unsorted

# create a GitHub release with a tag
release ENV TAG:
    gh release create "{{ENV}}-v{{TAG}}" --generate-notes
