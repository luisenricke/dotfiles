# Starship

## Windows

### Configuration

- Install the application according to the [documentation](https://starship.rs/guide/).
- Link custom config to config theme folder with the next command. Note: Update the specific values for the env.

```powershell
cmd /c mklink /H "C:\Users\user\.config\starship.toml" "C:\path\to\dotfiles\starship\starship.toml"
```

- Create or update `Microsoft.PowerShell_profile.ps1` with the command.

```powershell
notepad $PROFILE
```

- Add configuration to use the shell prompt

```powershell
Invoke-Expression (&starship init powershell)
```

### References

- [DOC - starship](https://starship.rs)
