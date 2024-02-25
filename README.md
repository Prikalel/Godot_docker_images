# GODOT images

Dockerfiles for checking and building godot projects.

## Example

in gitlab ci/cd you can do:

```yaml
  script:
    - mkdir builds
    - mkdir -p /builds/windows/
    - godot --path `pwd` --headless --verbose --export-debug "Windows Desktop" /builds/windows/your_best_game.exe
    - mv /builds/windows/ builds/windows/
```

note that `export_presets.cfg` must exist in repository root (where your `project.godot` is placed).