
# Visual Studio Code

## Location

- Windows

  ``` cmd
  user/AppData/Roaming/Code/User
  ```

## Files

- keybindings.json
- settings.json

## Backup

- Extensions. The subsequent configuration is based on a response from [StackOverflow][1].

  ```shell
    # Unix
    code --list-extensions | xargs -L 1 echo code --install-extension
  ```

  ```shell
    # PowerShell
    code --list-extensions | % { "code --install-extension $_" }
  ```

## Installation

### WSL

- Run the below script to set up the environment.

``` shell
sh wsl.sh

```

NOTE: This script needs to run with WSL.

- Run the below file to set up the extensions.

``` shell
extensions.list

```

### Windows

- Settings

```shell
    # cmd
    mklink /H "C:\Users\user\AppData\Roaming\Code\User\settings.json" "C:\path\to\project\dotfiles\vscode\settings.json"
    mklink /H "C:\Users\user\AppData\Roaming\Code\User\keybindings.json" "C:\path\to\project\dotfiles\vscode\keybindings.json"
    mklink /H /J "C:\Users\user\AppData\Roaming\Code\User\snippets\" "C:\path\to\project\dotfiles\vscode\snippets\"
```

<!-- Reference -->

[1]: https://stackoverflow.com/a/49398449/12923478
