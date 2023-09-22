# list all the available recipes
default:
    @just --list --unsorted

# create a git tag and push it
tag ENV TAG:
    git tag {{ENV}}-v{{TAG}}
    git push --tags
