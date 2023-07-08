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
Write-Host -ForegroundColor Green "
  ______ ___________       _     _           
 |  ____|___  /  __ \     | |   | |          
 | |__     / /| |__) |___ | |__ | | _____  __
 |  __|   / / |  _  // _ \| '_ \| |/ _ \ \/ /
 | |____ / /__| | \ \ (_) | |_) | | (_) >  < 
 |______/_____|_|  \_\___/|_.__/|_|\___/_/\_\
                                             
                                             
"
                                                                           

$resourceDir = Get-Location # Define what the root directory of the script is to allow access to the image files
Write-Host -ForegroundColor Green "Resource directory is: "$resourceDir 

New-Item $resourceDir\temp -Force | Out-Null

Write-Host -ForegroundColor Green "Running Roblox FPS unlocker downloader"

Invoke-Expression -Command .\data\FPSUnlockerDownload.ps1 # Before running anything run the FPS unlocker script



# Start of crosshair modification
Write-Host -ForegroundColor Green "Starting crosshair modification"

Write-Host -ForegroundColor Green "Moving to Roblox Directory"
cd "$Env:localappdata\Roblox\Versions" # Move to the roblox folder

Write-Host -ForegroundColor Green "Newest folder is:" $(Get-ChildItem | Where { $_.PSIsContainer } | Sort CreationTime -Descending | Select -First 1)

Get-ChildItem | Where { $_.PSIsContainer } | Sort CreationTime -Descending | Select -First 1 | cd  # Find the newest folder and move into it with cd


Write-Host -ForegroundColor Green "Moving to keyboardmouse textures directory"
cd .\content\textures\Cursors\KeyboardMouse # Change to keyboardmouse cursors directory 

Write-Host -ForegroundColor Green "Deleting old cursors"
Remove-Item -ErrorAction SilentlyContinue -Path .\ArrowCursor.png  # Delete the old mouse curosrs
Remove-Item -ErrorAction SilentlyContinue -Path .\ArrowFarCursor.png
Remove-Item -ErrorAction SilentlyContinue -Path .\IBeamCursor.png

Write-Host -ForegroundColor Green "Copying new cursors"
Copy-Item -Path $resourceDir\data\cursor.png -Destination .\ArrowCursor.png #Copy in new mouse cursors
Copy-Item -Path $resourceDir\data\cursor.png -Destination .\ArrowFarCursor.png
Copy-Item -Path $resourceDir\data\cursor.png -Destination .\IBeamCursor.png

Write-Host -ForegroundColor Green "Moving to textures directory"
cd ..\..\ # Go back to the textures folder
Write-Host -ForegroundColor Green "Deleting and copying shift lock cursor"
Remove-Item -ErrorAction SilentlyContinue -Path .\MouseLockedCursor.png # Delete shift lock cursor
Copy-Item -Path $resourceDir\data\cursor.png -Destination .\MouseLockedCursor.png # Copy new cursor

cd $resourceDir
Read-Host -Prompt "All done! Press enter to exit the script" 
