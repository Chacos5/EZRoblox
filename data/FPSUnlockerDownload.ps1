<#  EZRoblox

    Copyright (C) 2023 Chacos5

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.#>

$apiUrl = "https://api.github.com/repos/axstin/rbxfpsunlocker/releases/latest" # The url that gets requested

Stop-Process -ErrorAction SilentlyContinue -Name rbxfpsunlocker # Before doing anything kill any current FPS unlocker processes
Write-Host -ForegroundColor Green "Killed any FPS unlocker processes"


$request = Invoke-WebRequest -Uri $apiUrl | ConvertFrom-Json # Make api request, convert to powershell object, store in variable
Write-Host -ForegroundColor Green "Made API request"

Invoke-WebRequest -Uri $request.assets[0].browser_download_url -OutFile .\temp\unlocker.zip # Invoke a web request to the url housed within the json
Write-Host -ForegroundColor Green "Downloaded ZIP"

Expand-Archive -Path .\temp\unlocker.zip -DestinationPath .\data -Force # Extract the zip file
Write-Host -ForegroundColor Green "Extracted ZIP"

Remove-Item -Path .\temp\unlocker.zip # Delete the zip file as it is no longer needed

.\data\rbxfpsunlocker.exe # Run FPS unlocker
Write-Host -ForegroundColor Green "Ran FPS unlocker. Done!`n`n"
