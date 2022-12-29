# Other configurations

# Aliases
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
