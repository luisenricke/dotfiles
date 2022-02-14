# Windows

## Alias

1. Put this file in %USERPROFILE%.
2. Run aliases-doskey.reg.
3. Close and re-open another console.

## PHP

- Download the required [version](https://windows.php.net/download).
- Unzip binaries.
- Install [Microsoft Visual C++ Redistributable](https://docs.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-160).
- Add path of binaries to environment variable.
- Run the next command to test installation `php -v`.

## PowerShell

- Install Meslo font.
- Install and configure `oh-my-posh`, `git-posh`.
- Link theme to posh theme folder with the next command in cmd.

```shell
 mklink /H "C:\Users\user\.oh-my-posh\themes\luisenricke.omp.json" "C:\path\to\project\dotfiles\windows\luisenricke.omp.json"
```

- Save the next script in file call it from `$PROFILE` in PowerShell.

```shell
Import-Module oh-my-posh
Set-PoshPrompt -Theme luisenricke
Import-Module posh-git
```

## Composer

- It is required to have some version of PHP configured.
- Download the [file](https://getcomposer.org/download/).
- Run the next command in cmd `echo @php "%~dp0composer.phar" %*>composer.bat` in the directory that contains binaries.
- Run the next command to test installation `composer --version`.
