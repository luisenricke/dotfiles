# Sublime Text

## Location

- Windows

  ``` cmd
  user/AppData/Roaming/Sublime Text/Packages/User
  ```

- Unix/Linux

  ``` shell
  ~/.config/sublime-text-3/Packages/User
  ```

## Files

- Default (Windows).sublime-keymap
- GitGutter.sublime-settings
- Guna.sublime-settings
- Package Control.sublime-settings
- phpfmt.sublime-settings
- Preferences.sublime-settings

## Installation

### WSL

Run the below script to set up the environment.

``` shell
sh wsl.sh

```

NOTE: This script needs to run with WSL.

### Windows

- Settings

```shell
    # cmd
    mklink /H "C:\Users\user\AppData\Roaming\Sublime Text\Packages\User\Default (Windows).sublime-keymap" "C:\path\to\project\dotfiles\sublime\Default (Windows).sublime-keymap"
    mklink /H "C:\Users\user\AppData\Roaming\Sublime Text\Packages\User\GitGutter.sublime-settings" "C:\path\to\project\dotfiles\sublime\GitGutter.sublime-settings"
    mklink /H "C:\Users\user\AppData\Roaming\Sublime Text\Packages\User\Guna.sublime-settings" "C:\path\to\project\dotfiles\sublime\Guna.sublime-settings"
    mklink /H "C:\Users\user\AppData\Roaming\Sublime Text\Packages\User\Package Control.sublime-settings" "C:\path\to\project\dotfiles\sublime\Package Control.sublime-settings"
    mklink /H "C:\Users\user\AppData\Roaming\Sublime Text\Packages\User\phpfmt.sublime-settings" "C:\path\to\project\dotfiles\sublime\phpfmt.sublime-settings"
    mklink /H "C:\Users\user\AppData\Roaming\Sublime Text\Packages\User\Preferences.sublime-settings" "C:\path\to\project\dotfiles\sublime\Preferences.sublime-settings"
```
