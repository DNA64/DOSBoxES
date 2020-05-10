# DOSBoxES
![Emulation Station with the Simple theme](https://i.imgur.com/ZQe1b3Y.png)
[A short demo is available for viewing here](https://streamable.com/bt1x71)


**NO RETROARCH REQUIRED!**


## About


Launch DOSBox games via Emulationstation using the [Standalone DOSBox release by ModMyClassic](https://classicmodscloud.com/project_eris/mods/1.0.0/dosbox_0.7.4_SONYPSC-cfb0146.mod).



## Requirements:


- Sony PlayStation Classic Console

- [Project Eris](https://modmyclassic.com/project-eris/)

- [Standalone DOSBox release by ModMyClassic](https://classicmodscloud.com/project_eris/mods/1.0.0/dosbox_0.7.4_SONYPSC-cfb0146.mod)


This will **NOT** work nor is it intended to work with the build of DOSBox that depends on RetroArch.


## Downloads:


https://github.com/DNA64/DOSBoxES/releases/latest/download/dosbox-es-standalone_SONYPSC.mod


## Installation:


To install simply download the Project Eris `.mod` package found under the releases tab of the project page and copy the file to the `/media/project_eris/mods` folder on the root of your USB drive.


Place your extracted DOS game folders in `/media/roms/dosboxes` ensuring the main executable used to launch the game is the only one in the folder with a lowercase file extension (.exe .com .bat). This will keep you menu nice and clean as shown in the demo above.

Example: `/media/roms/pc/KEEN/KEEN.exe`

## F.A.Q.:


**Q:** How do I exit a game back to Emulationstation (ES)?


**A:** You can try pressing one of the key combinations below to return to ES. The process is different for most games, for now you will need to lookup that information in the games manual. Some games do not have any method of exiting them, because in the old days, there was nothing to exit to. For these and other games you can't find the exit information for, you can use `Alt`+`Ctrl`+`Del` to Escape back to the Project Eris Boot Menu, this can be a slow process!


Known Exit Key Combos to return to ES:

- `Alt`+`F10`

- `Alt`+`X`

- `Ctrl`+`F9`

- `Ctrl`+`Q`

Got an question not listed here? Let us know and we'll do my best to answer it, and maybe even add it to the list.

**Q:** How do I add boxart for the games?

**A:** There are a number of ways to do this, and this is covered in many [tutorials for Emulation Station](https://www.youtube.com/watch?v=yuoCSnFP22A). However, you can [view a short clip HERE](https://streamable.com/bt1x71) that shows how to do this if you have the wifi mod. If you don't have the wifi mod, you can always connect your USB drive to your PC and use ES or another scraping tool to scrape the games, then connect it back to the PSC.

## Troubleshooting:

#### Inaccurate number of games displayed, missing files not shown, or extra files displayed in menu.

In order to keep the menu free and clear of all those unwanted additional files, Emulationstation will ONLY list files with a lowercase extentsion. Example: TMNTEGA.exe (Where as TNMNTEGA.EXE will not be displayed). You may need to reboot for these settings to take effect. In the event the changes do not take effect please delete the `gamelist.xml` file located in `/media/project_eris/opt/emulationstation/.emulationstation/gamelists/dosboxes/`


Not all games will work right out of the box so to speak. Some may require a special configuration file or initial installation or setup. The good news is, DOSBox has been around for a LONG LONG time. So there is already tons of valuable information out there to help you get these games working and troubleshoot any issues you might have. Also make sure your file isn't corrupted. You can do this by comparing it's checksum to a known good one found online.

**Known bugs and other issues**

- We've fixed all the ones we've found!
Found an issue not listed here? [Click Here](https://github.com/DNA64/DOSBoxES/issues) and fill out a report.


## Credits:


DOSBoxES is the result of a team effort between myself [viral_dna](https://github.com/dna64) (aka DNA64) and [DefKorns](https://defkorns.netlify.app). 


Additional information found useful during the development of this project can be found at the links below.


- [DOSBox Wiki.](https://www.dosbox.com/wiki/Usage)


- [Emulation Station F.A.Q.](https://emulationstation.org/faq.html)


## Project History


It all began when I had been working on finishing up some old DOSBox projects I started on years ago, when Swingflip suggested releasing a stand alone build of DOSBox that would offer more performance then anything else currently available. The only problem, there was no way to launch games from within this new stand alone build Emulationstation, or was there? 


While researching the Emulationstation website for inspiration with the script I was working on, I came across one that required you to manually enter the names of your games exactly in order for it to work. To me this just wasn't acceptable, and I knew the same could be said for many of the end users. So why not automate it? And that is exactly what I set out to do. 


What started out as a solo project of mine, ended up becoming a team effort between DefKorns and myself. As it turns out, we were both working on similar projects at the same time. As he put..."Great minds think alike!". [Checkout his Project Here](https://defkorns.github.io/project-eris-2-emulationstation/)


DefKorns graciously offered to help out and I accepted, and he has been invaluable to the project and an absolute pleasure to work with as always. It took some back and forth ideas for us to perfect it, taking into account things like possible spaces in both folder and filenames as well as few other obstacles, but the end result is this project. - Enjoy!
