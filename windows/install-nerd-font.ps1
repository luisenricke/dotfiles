param (
    [string]$FontName = "FiraCode"  # Nombre de la fuente que se desea descargar (por defecto es FiraCode)
)

# Verificar si se tiene curl disponible
if (-not (Get-Command "curl" -ErrorAction SilentlyContinue)) {
    Write-Host "curl no está instalado. Asegúrate de tenerlo disponible o instala Git Bash."
    exit
}

# URL base de GitHub para Nerd Fonts
$baseUrl = "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"

# Obtener la URL del archivo ZIP más reciente para la fuente solicitada
Write-Host "Obteniendo la última versión para $FontName..."
$releaseInfo = curl -s $baseUrl | ConvertFrom-Json

# Buscar el archivo ZIP correspondiente al nombre de la fuente
$fontAsset = $releaseInfo.assets | Where-Object { $_.name -like "*$FontName*" -and $_.name -like "*.zip" }

if (-not $fontAsset) {
    Write-Host "No se encontró un archivo ZIP para $FontName en la última versión de Nerd Fonts."
    exit
}

# Establecer la URL para descargar el archivo ZIP de la fuente
$fontUrl = $fontAsset.browser_download_url
# Establecer la ruta donde se almacenará el archivo descargado
$downloadPath = "$env:USERPROFILE\Downloads\$FontName.zip"
# Establecer la ruta donde se descomprimirán las fuentes
$extractPath = "$env:USERPROFILE\Downloads\$FontName"

# Crear el directorio de destino si no existe
if (-not (Test-Path -Path $extractPath)) {
    Write-Host "Creando el directorio para descomprimir en $extractPath..."
    New-Item -ItemType Directory -Force -Path $extractPath
}

# Descargar el archivo ZIP de Nerd Fonts
Write-Host "Descargando $FontName de Nerd Fonts..."
curl -L $fontUrl -o $downloadPath

# Descomprimir el archivo ZIP
Write-Host "Descomprimiendo $FontName..."
Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

# Eliminar el archivo ZIP después de descomprimirlo
Remove-Item -Path $downloadPath

# Crear un objeto COM para acceder a la carpeta de fuentes de Windows
# 0x14 hace referencia a la carpeta de "Fuentes" en Windows
$ShellApplication = New-Object -ComObject shell.application
$Fonts = $ShellApplication.NameSpace(0x14)

# Copiar las fuentes descomprimidas al directorio de fuentes de Windows
Write-Host "Instalando las fuentes..."
Get-ChildItem -Path "$extractPath" -Include '*.ttf' -Recurse | ForEach-Object -Process {
    $Fonts.CopyHere($_.FullName)
}

# Confirmar que la instalación fue exitosa
Write-Host "$FontName de Nerd Fonts ha sido instalada exitosamente."
