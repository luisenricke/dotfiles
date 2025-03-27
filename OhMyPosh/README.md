# Oh my Posh

## PowerShell

- Install and configure [Oh my posh](https://ohmyposh.dev/docs/installation/windows).
- Link custom theme to posh theme folder with the next command. Note: Update the specific values for the env.
- It is recommended to use `emodipt-extend.omp.json`.

```powershell
cmd /c mklink /H "C:\Users\user\AppData\Local\Programs\oh-my-posh\themes\custom-theme.omp.json" "C:\path\to\dotfiles\windows\themes\custom-colorful.omp.json"
```

## References

- [Doc - Oh my posh](https://ohmyposh.dev/docs)
