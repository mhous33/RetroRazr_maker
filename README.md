# RetroRazr maker
### Motorola's RetroRazr app improved
##### Depixelated UI rendered from original V3 elements
* 2 super resolution styles to select from
* 5 original skins to select from
* 15 original wallpapers to select from
* Original Synergy font
* Original startup and shutdown sounds
##### Ability to use as launcher home
* Center button opens all apps list
* Browser button opens google search
* Center softkey opens google play store
### How to use:
* Clone this repository:
	* Or download the zip and extract
```
git clone https://github.com/mhous33/RetroRazr_maker.git
```
* Install dependencies:
	* Java 8 or higher
	* Python 3
	* timg
	* unzip
* Enter directory and launch the make script:
```
cd RetroRazr_maker
./make
```
* Enter vertical pixel value of target device
	* used to scale dimensions properly
* Select super resolution style
	* x4: basic 4x enhancement used to upscale
	* anime: animation specific 4x enhancement used to upscale
* Select skin
* Select wallpaper
* Build
* Install
### Credits & Sources
Original V3 firmware: [Planet Moto X](https://web.archive.org/web/20080730031435/http://www.planetmotox.net/monster_packs.php)

Firmware extraction tools:
[DRMPort](http://www.e398mod.com/content/view/447/28/) , [Simple Flex Parser](http://www.e398mod.com/content/view/468/28/) , [skinner4moto](https://web.archive.org/web/20070827002442/http://skinner4moto.de.vu/)

Super resolution tool: [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

RetroRazr source: [RetroRazr](https://dumps.tadiphone.dev/dumps/motorola/olson/-/blob/user-9-PPV29.266-50-a80bd-release-keys/system/system/priv-app/RetroRazr/RetroRazr.apk)

Apk (de)compiler: [Apktool](https://ibotpeaches.github.io/Apktool/)

Dimens editor: [Android-Dimen-Multiplier](https://github.com/mhous33/Android-Dimen-Multiplier)

Apk signer: [uber-apk-signer](https://github.com/patrickfav/uber-apk-signer)
