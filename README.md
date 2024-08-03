# Install

- Delete all Intro Movies from your game folders. The movies are in  "SteamInstalation\steamapps\common\Hell Let Loose\HLL\Content\Movies"
- You must have a game resolution of 1920x1080, 2560x1440, or 3840x2160 for this to work. It may work with ultra widescreen monitors using those resolutions but that is untested. 
- Download the latest release from the [releases](https://github.com/sbeinart86/HLL-Sequential-Seed/releases) page.
- Extract the zip file
- Double click on `enable.bat` to run
- Click the `More info` button on defender pop up
> Why are you seeing this pop up? Because I am not paying microsoft for a certificate to run this script. If you have concerns about the code you can check all of it in notepad++ the exe files have the instructions they execute at the bottom of the file. 
  
![first](https://github.com/Craven73/hll-seed/assets/50681292/e02530fc-ebca-4e7b-968d-823681db9a2c)

- Click `Run anyway`

![second](https://github.com/Craven73/hll-seed/assets/50681292/bcc3a17d-b388-49db-a4db-46ac89a636a2)

- Repeat these same steps for `script.bat`
- At this point you should be able to open up your Windows Task Scheduler and see the newly created task `SYN seed`
- You can find your Windows Task Scheduler by hitting the windows key and typing "Task" then clicking on the "Task Schduler"
![task](https://github.com/Craven73/hll-seed/assets/50681292/d57a539e-9eb3-49e5-9e53-5c65ebd34308)
  
- Even if you start late you will still be helping out! The task skips over already seeded servers so dont be afraid to start it manualy whenever you can if thats what you want to do.
- You can manualy launch the bot by going to the instal directory "C:\users\*youruserprofile*\hll-seq-seed" and launching script.bat

IF YOU WANT YOUR COMPUTER TO GO TO SLEEP AFTER SEEDING!

- Go to the instal directory should be "C:\users\*youruserprofile*\hll-seq-seed"
- Find the script.bat file.
- Right Click the file and select "edit in Notepad"
- Go to the end of the file
- Delete the letters "REM" and the space.

It should now read like 


> echo Putting the PC to sleep... <br>
> powercfg -h off <br>
> rundll32.exe powrprof.dll,SetSuspendState 0,1,0 <br>
> powercfg -h on <br>


- It should put your computer to sleep after seeding now. 
