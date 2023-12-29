# ![Logo](https://github.com/EthernalStar/Colors-Plus/blob/main/Icon.png?raw=true) Colors+

**Colors+** is a Tool for creating and editing a custom Window Overlay with Text and Images.  
It can be used for many purposes like streaming or reducing eyestrain.  
The Tool was tested with Windows 10 but should also work with Windows 11.  
  

## Documentation

**Please Read the Instructions with care to avoid breaking something**  
  
The Tool itself is structured into two main segments:  
1. The Main Settings Window where you can edit the Overlay.
2. The Overlay itself.
  
**Also the Tool may be flagged as a false positive by your System.**
**If you are still unsure please check and compile the Source Code yourself or try it in a VM first!**  
  
At any time you can use the **Reset Overlay** Button to reset all changes you made.  
You can also switch the Overlay On or Off with the corresponding Button.  
If you want to hide the Settings Window (wich you really want to do) just click the Mini-Icon on the Taskbar.  
  
### Color Page

![Window Attributes Screenshot](https://github.com/EthernalStar/Colors-Plus/blob/main/Images/Colors%20Plus%2001.png?raw=true)  

The **Color** Box allows you to pick a preconfigured color for the Overlay by clicking the different Boxes.  
You could also set a **custom Color** by clicking the Button and choosing one with the Color Picker.  
The Button **Set Random Color** just sets a random choosen Color for the Overlay.  

By using the Trackbars in the **Position and Dimensions** Box you can move and resize the Overlay by hand.  

The **Transparency** Box allows you to change the Transparency of the Overlay through the Trackbar.  
By clicking the Button **Set Current Color as Colorkey** the Overlay now uses Colorkey Transparency for its given Color. This is useful for applying total Transparency when working with Images or Text. If there are incorrectly colored edges on yout Text / Images just try another Color and press the Button again.  

The **Overlay Options** are for resizing and positioning the Overlay in various ways.  
Use **Fix Color on Multi Monitor Setup** repairs eventual Color Issues when working with multiple Monitors.  

A word about the **Edit Overlay by Hand** Button:  
By pressing this Button you enable the manual editing Mode in wich the Overlay behaves like a normal Window. You can now resize and position the Overlay by hand like a normal Window. To exit this mode just double click anywhere on the Overlay. If you have inserted Images on the Overlay you can drag them with yout cursor to move them. A right click moves the Image to the Front.  
  
**Full Size on current Screen** moves the Overlay to the current Screen where the Settings Window currently is.  
**Full Size on Specific Screen** does the same but with a chosen Screen (Use the SpinEdit for this).  
**Full Size on all Screens** tries to resize the Overlay above all Screens but its very buggy sometimes.  
  
The only **Experimental Feature** right now is the **Attach to Window** Button wich does just that: you will have to input a valid Window Handle into the Edit Field (Use [WinEdit Dx](https://github.com/EthernalStar/WinEdit-Dx) for obtaining the Window Handles) and the Overlay will attach itself to this Window.  
  
### Text and Images Page

![Window Attributes Screenshot](https://github.com/EthernalStar/Colors-Plus/blob/main/Images/Colors%20Plus%2002.png?raw=true)  

The **Text** Field is used for writing Text on the Overlay through the Memo Box.  
You can also change the Font with the **Edit Font** Button and remove the Text with the **Clear Text** Button.  
The X and Y TrackBars are used for moving the Text. You could also **Import** and **Export** the Text from / to Textfiles by using the corresponding Buttons.  

The **Images** Field can be used to load a **Fullscreen Stretched Image** to the Size of the Overlay wich cannot be moved.  
If you want to add an unlimited amount of new Images just click the **Create a new Image** Button and choose an Image.  
You can load the Image **Full** size (its original size) or **Stretched** size (the Images are resized to the values written in the Edit Fields).  
The Button **Delete all Images** does just that.  

If you want to switch the z order of Text and Images just use the **Priority** Button on the Bottom.  
  
### Information Page

![Window Attributes Screenshot](https://github.com/EthernalStar/Colors-Plus/blob/main/Images/Colors%20Plus%2003.png?raw=true)
  

### Use Cases

Here are some situations where I use this Tool:  

Making a bright Screen without Brightness Controll darker when working late at night.  

Showing text notes on screen above all Windows to keep track of something (Used together with Color transparency).  

Attaching the Overlay to any Window for individual configurations (Use [WinEdit Dx](https://github.com/EthernalStar/WinEdit-Dx) for obtaining the Window Handles).  

The Possibilities of using this Tool for useful or unuseful things are endless.  
  

### Building

There should not be any Problem building the Application because it does not rely on any external installed Packages.  
To build the Project you need to have the Lazarus IDE Version 2.2.6 installed and clone this Repository to yor local Machine.  
Now just open the .lpr file in your Lazarus Installation and you should be able to edit and compile the Project.  
  

## Issues

If you have multiple Monitors configured and change the color of the Overlay while it is above multiple screens the color may get messed up.  
To fix this just use the "Fix Color on Multi Monitor Setup" Button on the Color Page.  
  

## Planned Features

Currently there are a few Features planned for the Future like adding GIFs with animations to the Overlay or Saving Configurations.  
  

## Changelog

Version 1.00: Initial Release  
  

## License

GNU General Public License v3.0. See [LICENSE](https://github.com/EthernalStar/Colors-Plus/blob/main/LICENSE) for further Information.
