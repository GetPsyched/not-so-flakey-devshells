# list all the available recipes
default:
    @just --list --unsorted

# format all nix files
tag TAG:
    @gh release create v{{TAG}} --generate-notes
