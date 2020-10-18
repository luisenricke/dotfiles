# Visual Studio Code

## Location files

- Windows
  - %WINDOWS_HOME%/AppData/Roaming/Code/User
    - keybindings.json
    - settings.json
    - locale.json

## Extensions

The subsequent configuration is based on a response from [StackOverflow][1].

- Backup

  ```shell
    # Unix
    code --list-extensions | xargs -L 1 echo code --install-extension
  ```

  ```shell
    # PowerShell
    code --list-extensions | % { "code --install-extension $_" }
  ```

- Install

You only run the file generated

<!-- Reference -->

[1]: https://stackoverflow.com/a/49398449/12923478
