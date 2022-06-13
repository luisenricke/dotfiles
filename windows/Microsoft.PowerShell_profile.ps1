oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/luisenricke-colorful.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons

Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Import-Module z

Import-Module posh-git

function toBack {
    cd ..
}
Set-Alias .. toBack

function toSecondLastBack {
    cd ..\..
}
Set-Alias ..\.. toSecondLastBack

function toThirdLastBack {
    cd ..\..\..
}
Set-Alias ..\..\.. toThirdLastBack

function mysqlConsole {
    cmd /c "$ENV:ProgramFiles\MySQL\MySQL Server 8.0\bin\mysql" -u root -p
}
Set-Alias mysql_ mysqlConsole

function postgresqlConsole {
    cmd /c "$ENV:ProgramFiles\PostgreSQL\14\bin\psql"  -U postgres -h localhost -p 5432
}
Set-Alias psql_ postgresqlConsole

function artisanCommand($arg1,$arg2,$arg3,$arg4,$arg5) {
    php artisan $arg1 $arg2 $arg3 $arg4 $arg5
}

Set-Alias phpa artisanCommand
