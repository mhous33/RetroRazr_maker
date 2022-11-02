# RetroRazr maker
### Motorola's RetroRazr app improved
##### Depixelated UI rendered from original V3 elements
* 15 original wallpapers to select from
* 5 original skins to select from
* 2 super resolution styles to select from
* Original Synergy font
* Original startup and shutdown sounds
##### Ability to use as launcher home
* Center button opens all apps list
* Browser button opens google search
* Center softkey opens google play store
### How to use
##### Install dependencies
* apktool
* bc
* p7zip
* python3
* timg
* kitty (optional, improves terminal image resolution)
##### Clone this repository
* Or download the zip and extract
```
git clone https://github.com/mhous33/RetroRazr_maker.git
```
##### Enter directory
```
cd RetroRazr_maker
```
##### Launch the make script
```
./make
```
* Or optionally, for improved terminal image resolution
```
kitty ./make
```
* Customize wallpaper
* Customize skin
* Customize target device's vertical pixel value
	* used to scale dimensions properly
* Customize super resolution style
	* x4: standard style 4x enhancement used to upscale
	* anime: anime style 4x enhancement used to upscale
* Build
### Credits & Sources
Original V3 firmware [Planet Moto X](https://web.archive.org/web/20080730031435/http://www.planetmotox.net/monster_packs.php)

Firmware extraction tools [DRMPort](http://www.e398mod.com/content/view/447/28/) , [Simple Flex Parser](http://www.e398mod.com/content/view/468/28/) , [skinner4moto](https://web.archive.org/web/20070827002442/http://skinner4moto.de.vu/)

Super resolution tool [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

RetroRazr source [RetroRazr](https://dumps.tadiphone.dev/dumps/motorola/olson/-/blob/user-9-PPV29.266-50-a80bd-release-keys/system/system/priv-app/RetroRazr/RetroRazr.apk)

Dimens editor [Android-Dimen-Multiplier](https://github.com/mhous33/Android-Dimen-Multiplier)

Apk signer [uber-apk-signer](https://github.com/patrickfav/uber-apk-signer)

