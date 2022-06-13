oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/luisenricke-colorful.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons

Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Import-Module z

Import-Module posh-git
