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

- Install `Windows Terminal`
- Install the latest Powershell. The latest version I am using is 7.2.4.
- Install any font of [NerdFonts](https://www.nerdfonts.com/). Preferably it can be `Meslo` or `Caskaydia Cove`.
- Create or update `Microsoft.PowerShell_profile.ps1` with the command.

```powershell
notepad $PROFILE
```

- Install the packages to want to use

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module z -AllowClobber
```

- Link or update the file of `Microsoft.PowerShell_profile.ps1` with the next configuration.

```powershell
# Link command
cmd /c mklink /H "C:\Users\LuisVillalobos\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "C:\Users\LuisVillalobos\Projects\dotfiles\windows\Microsoft.PowerShell_profile.ps1"

# Content of the file - Check to update configuration in the repository
Import-Module -Name Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Import-Module z

Import-Module posh-git
```

- If you want it to predict the folders you have to use the z command and enter the folder and reuse it in other files location

```powershell
z 'C:\Users\user\nested\folder'
```

---

### References

- [Youtube - How to make the ultimate Terminal Prompt on Windows 11 - This video is LONG and WORDY and DETAILED](https://youtu.be/VT2L1SXFq9U)
- [Blog - My Ultimate PowerShell prompt with Oh My Posh and the Windows Terminal](https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal)
- [Blog - Adding Predictive IntelliSense to my Windows Terminal PowerShell Prompt with PSReadline](https://www.hanselman.com/blog/adding-predictive-intellisense-to-my-windows-terminal-powershell-prompt-with-psreadline)
- [Blog - Spend less time CD'ing around directories with the PowerShell Z shortcut](https://www.hanselman.com/blog/spend-less-time-cding-around-directories-with-the-powershell-z-shortcut)
- [Doc - Oh my posh](https://ohmyposh.dev/docs)
- [Doc - Posh-Git](https://github.com/dahlbyk/posh-git)

## Composer

- It is required to have some version of PHP configured.
- Download the [file](https://getcomposer.org/download/).
- Run the next command in cmd `echo @php "%~dp0composer.phar" %*>composer.bat` in the directory that contains binaries.
- Run the next command to test installation `composer --version`.
