# WUD-Key-Checker
The WUD-Key-Checker is a Batch script that uses a title key database to find the correct title key for Nintendo Wii U backups in the WUD format.

![GitHub Release](https://img.shields.io/github/v/release/xxmichibxx/WUD-Key-Checker) ![Issues](https://img.shields.io/github/issues/xxmichibxx/WUD-Key-Checker) ![GitHub Repo stars](https://img.shields.io/github/stars/xxmichibxx/WUD-Key-Checker) 

## Screenshot
<p align="left"><a href="https://github.com/xxmichibxx/WUD-Key-Checker"><img src="https://i.imgur.com/DmZ6Wew.png" alt="Logo"></a></p>

## Requirements
* Java 8

## Supported operating systems
* Windows 7 or higher
* Windows Server 2008 R2 or higher

## Usage
Drag & Drop your WUD file into the "WUD-Key-Checker.bat".

You can also run the batch via command line e.g. ```WUD-Key-Checker.bat "Animal Crossing - Amiibo Festival (Europe) (En,Fr,De,Es,It,Nl,Pt,Ru).wud"```.

## FAQ
How does this even work in Batch?
* The script uses the JWUDTool from Maschell, trying each key for the given WUD file. When the correct key is used, the meta.xml is extracted successfully.

That's all well and good, but what about the performance?
* Batch is not well-know for its performace but it does its job. Using the regular title key database the script takes a maximum of 4 min. Using the extendend database around a maximum of 17 min.

What is the difference between the ```titlekey_WUD.db``` and the ```titlekey_AIO.db```?
* The AIO, or extended database, includes all title keys I've found on the web, excluding the keys from the WUD database. Also, the AIO includes keys that are not only for WUD files (NUS keys). Unfortunately, I cannot include all possible WUD title keys because they are not always labeled as WUD keys on the web.

## Notes
* WUX files are not supported. These must first be decrypted.
* It's not possible to run the batch directly. The batch always needs a parameter.

## Credits
* `JWUDTool` - [Maschell](https://github.com/Maschell/JWUDTool)
