# EZRoblox

A simple and quick powershell script designed to set a custom crosshair for your roblox client as well as download, extract, and run the latest version of Roblox FPS unlocker (https://github.com/axstin/rbxfpsunlocker).
By default it sets a higher contrast cursor but that can always be changed (explained below).

# [Download](https://github.com/Chacos5/EZRoblox/archive/refs/heads/main.zip)

# Usage:
Before doing anything you ***must*** enable running powershell scripts or Windows ***will*** complain becuase the code is unsigned. If you whish you can sign it yourself to keep a more secured system.

To do this open an elevated powershell terminal (as admin)  (`Win + X` then `Shift + A`)

Then run the following command:<br>
`Set-ExecutionPolicy unrestricted`

### Running the actual script
To run the script you ***must*** execute it from the directory the script is located in. That directory should contain all of the other supporting files for the script or else it wont work. Lazy coding, yes. Works, also yes.

Either right click the script and hit run or set up your computer to auto run scripts when you double click them. The script should run without any user input needed and will prompt you to hit enter when it finishes.
***Note: Powershell may ask you if you are sure you want to run a "script from the internet" in order for the script to work you have to accept by pressing `r`***

If you change any FPS unlocker settings it should save in a file called `settings` in the root of the folder.

I would recomend running it every time you want to play to grab the latest version and to ensure that the cursors get set after Roblox updates. (Roblox updates will clear the custom cursors)

If you desire you can also run the `FPSUnlockerDownload.ps1` script to just download the FPS unlocker.

### Important notes and extras
As stated above the script must remain with all of the other folders present in this GitHub as they store the other script as well as the curosr.

If needed you can change what cursor gets set by changing the `cursor.png` file in the `data` folder. It must be a PNG and probably be the same size but I am not sure if roblox limits you on size. (I would assume so)

And thats it! Its my first powershell script so it kinda sucks and might break if Roblox FPS unlocker changes how their releases are handeled but 🤷‍♂️. Feel free to mess with the code as its all under a GPL license.

