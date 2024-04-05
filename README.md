# ![Logo](./Icon.png?raw=true) Colors+

**Colors+** is a Tool for creating and editing a custom Window Overlay with Text and Images.

It can be used for many purposes like streaming or reducing eyestrain.

The Tool was tested with Windows 10 but should also work with Windows 11.

## Documentation

**Please Read the Instructions with care to avoid breaking something**

**Also the Tool may be flagged as a false positive by your System.**

**If you are still unsure please check and compile the Source Code yourself or try it in a VM first!**

The Tool itself is structured into two main segments:
1. The Main Settings Window where you can edit the Overlay.
2. The Overlay wich is applied partially or full over the Screen.

At any time you can use the **Reset Overlay** Button to reset all changes you made.
You can also switch the Overlay On or Off with the corresponding Button.
If you want to hide the Settings Window (wich you really want to do) just click the Mini-Icon on the Taskbar.

### Color

![Color Page Screenshot](./Images/Colors%20Plus%2001.png?raw=true)

The **Color** Box allows you to pick a preconfigured color for the Overlay by clicking the different Boxes.
You could also set a **custom Color** by clicking the Button and choosing one with the Color Picker.
The Button **Set Random Color** just sets a random choosen Color for the Overlay.

By using the Trackbars in the **Position and Dimensions** Box you can move and resize the Overlay by hand.

The **Transparency** Box allows you to change the Transparency of the Overlay through the Trackbar.
By clicking the Button **Set Current Color as Colorkey** the Overlay now uses Colorkey Transparency for its given Color. This is useful for applying total Transparency when working with Images or Text. If there are incorrectly colored edges on yout Text / Images just try another Color and press the Button again.

The **Overlay Options** are for resizing and positioning the Overlay in various ways.
Use **Fix Color on Multi Monitor Setup** repairs eventual Color Issues when working with multiple Monitors.

A word about the **Edit Overlay by Hand** Button:
By pressing this Button you enable the manual editing Mode in wich the Overlay behaves like a normal Window. You can now resize and position the Overlay by hand like a normal Window. To exit this mode just double click anywhere on the Overlay or press the Return key while the Overlay is focused. If you have inserted Images on the Overlay you can drag them with yout cursor to move them. A right click moves the Image to the Front.

**Full Size on current Screen** moves the Overlay to the current Screen where the Settings Window currently is.
**Full Size on Specific Screen** does the same but with a chosen Screen (Use the SpinEdit for this).
**Full Size on all Screens** tries to resize the Overlay above all Screens but its very buggy sometimes.

The **Attach to Window** Button does just that: you will have to input a valid Window Handle into the Edit Field (Use WinEdit Dx on [Github](https://github.com/EthernalStar/WinEdit-Dx) or [Codeberg](https://codeberg.org/EthernalStar/WinEdit-Dx) for obtaining the Window Handles) and the Overlay will attach itself to this Window. You can also correct the overlay a little bit by changing the corresponding SpinEdit.

### Text and Images

![Text and Images Page Screenshot](./Images/Colors%20Plus%2002.png?raw=true)

The **Text** Field is used for writing Text on the Overlay through the Memo Box.
You can also change the Font with the **Edit Font** Button and remove the Text with the **Clear Text** Button.
The X and Y TrackBars are used for moving the Text. You could also **Import** and **Export** the Text from / to Textfiles by using the corresponding Buttons.

The **Images** Field can be used to load a **Fullscreen Stretched Image** to the Size of the Overlay wich cannot be moved.
If you want to add an unlimited amount of new Images just click the **Create a new Image** Button and choose an Image.
You can load the Image **Full** size (its original size) or **Stretched** size (the Images are resized to the values written in the Edit Fields).
The Button **Delete all Images** does just that. **If you have selected a GIF it'll be automatically animated though the TGIFViewer component.**

If you want to switch the z order of Text and Images just use the **Priority** Button on the Bottom.

### Info

![Information Page Screenshot](./Images/Colors%20Plus%2003.png?raw=true)

It also has some Settings to switch the **Topmost** Status of the Overlay or the Settings Window.
You could also disable the **Tray Icon** but this is NOT recommended as it will prevent you from hiding the Settings Window.
As of v1.0.2 **Auto Save/Load Settings** toggles the ability to save all Settings in an ini File.

* The Button "**See latest Changelog**" just shows the most recent Changelog.
* The Button "**See License Information**" just shows the License of this Project.

There are also links to my Repositories on [Github](https://github.com/EthernalStar) or [Codeberg](https://codeberg.org/EthernalStar) where you could always find the latest Version.
If you have questions please don't hesitate to contact me over [E-Mail](mailto:NZSoft@Protonmail.com) or create an Issue on the Project Page.

There are also a few experimental features like the **Strobelight Effect**.
**WARNING: This feature may potentially trigger seizures for people with photosensitive epilepsy as the Overlay color will change fast and randomly.**

## Use Cases

Here are some situations where I use this Tool:

* Making a bright Screen without Brightness Controll darker when working late at night.
* Showing text notes on screen above all Windows to keep track of something (Used together with Color transparency).
* Attaching the Overlay to any Window for individual configurations (Use WinEdit Dx on [Github](https://github.com/EthernalStar/WinEdit-Dx) or [Codeberg](https://codeberg.org/EthernalStar/WinEdit-Dx) for obtaining the Window Handles).
* **As of Version 1.0.2 direct communication with WinEdit Dx can be enabled.**

## Building

**As of Version 1.0.2 this Application needs the [TGIFViewer](https://github.com/jdelauney/TGIFViewer) Component to be build.**
To build the Project you need to have the [Lazarus IDE](https://www.lazarus-ide.org/) Version 2.2.6 installed.
You can install the [TGIFViewer](https://github.com/jdelauney/TGIFViewer) Component directly with the Online Package Manager.
After you have installed the Component and downloaded the Source Code or cloned this Repo just open the Project in your Lazarus Installation.
To do this just open the .lpr file and you should be able to edit and compile the Project.
You can also build this project without GIF support by commenting out the line "{$DEFINE GIF_SUPPORT}" in line 5 of unit1.pas und unit2.pas.

## Issues

* If you have multiple Monitors configured and change the color of the Overlay while it is above multiple screens the color may get messed up. To fix this just use the "Fix Color on Multi Monitor Setup" Button on the Color Page.
* There is also the Problem that the TGIFViewer component doesn't have an OnDblClick Event wich means that applying the Overlay though doubleclick won't work with GIFs. However you can just press the Return key while the Overlay is focused.

## Planned Features

* Currently there are no planned Features.

## Changelog

* Version 1.0.0:
  * Initial Release.
* Version 1.0.1:
  * Added Information to Executable Manifest.
* Version 1.0.2:
  * Added support for GIFs with Animations.
  * Added Feature to save Settings.
  * Added correction Feature for Window attach mode.
  * Added experimental Features.
  * Rewritten Information Section to be more usable.
  * Added Communication with WinEdit Dx.

## License

* GNU General Public License v3.0. See [LICENSE](./LICENSE) for further Information.