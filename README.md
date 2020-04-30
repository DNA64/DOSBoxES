# DOSBoxES

**NO RETROARCH REQUIRED!**

# About

Launch DOSBox games via Emulation Station using the [Stand Alone DOSBox release by ModMyClassic](https://classicmodscloud.com/project_eris/mods/1.0.0/dosbox_0.7.4_SONYPSC-cfb0146.mod).


## Requirements:

This release was designed to work with [Project Eris](https://modmyclassic.com/project-eris/). It has not been tested with other projects. This will **NOT** work with the build of DOSBox that depends on RetroArch.

## Downloads:

Coming soon!

## Installation:

To install simply download the Project Eris `.mod` package found under the releases tab and copy the file to the `/media/transfer` folder on the root of your USB drive.

## F.A.Q.:

**Q:** How do I exit a game back to Emulation Station?

**A:** The process is different for all games, for now you will need to lookup that information in the games manual. Some games do not have any method of exiting them, because in the old days, there was nothing to exit to. For these and other games you can't find the exit information for, you can use `Alt`+`Ctrl`+`Del` to Escape back to the Project Eris Boot Menu.

## Troubleshooting:

Not all games will work right out of the box so to speak. Some may require a special configuration file or initial installation or setup. The good news is, DOSBox has been around for a LONG LONG time. So there is already tons of valuable information out there to help you get these games working and troubleshoot any issues you might have. Also make sure your file isn't corupted. You can do this by comparing it's checksum to a known good one found online.

Got an issue not listed here? Let me know!

## Credits:

DOSBoxES was created by viral_dna (aka DNA64). 
Additional Coding and Troubleshooting was provided by DefKorns.
The script also uses code from the [Emulation Station F.A.Q.](https://emulationstation.org/faq.html)

Aditional information found useful during the developement of this project can be found on the [DOSBox Wiki.](https://www.dosbox.com/wiki/Usage)

## Project History

I had been working on finishing up some old DOSBox projects I started on years ago, when Swingflip suggested releasing a stand alone build of DOSBox that would offer more performance then anything else curently available. The only problem, there was no way to launch those games from within Emulation Station. 

While researching the Emulation Station website to see if anything was already available that might help, I came accross a script. It was just what I was looking for.. or was it?

The script required you to manually enter the names of your games exactly in order to work, to me this just wasn't acceptable, and I knew the same could be said for many of the end users. So why not automate it? And that is exactly what I set out to do. The end result is this project.
