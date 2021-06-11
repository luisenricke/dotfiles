
# Sublime Text 3

## Location

- Windows

  ``` cmd
  %WINDOWS_HOME%/AppData/Roaming/Code/User
  ```

## Files

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

## Configuration

- Run the below script to set up the environment.

``` shell
sh wsl.sh

```

NOTE: This script needs to run with WSL.

- Run the below file to set up the extensions.

``` shell
extensions.list

```

<!-- Reference -->

[1]: https://stackoverflow.com/a/49398449/12923478
