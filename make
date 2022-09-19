#!/usr/bin/env bash

start_new () {
	if [[ -d RetroRazr ]] ; then
		rm -rf RetroRazr
	fi
	unzip files/RetroRazr.zip -d . &>/dev/null
}
enter_vpixel () {
	echo "RESOLUTION:"
	echo""
	vpixel=""
	while ! [[ $vpixel =~ ^[0-9]{4} ]] ; do
		read -p "Please enter vertical pixel value of target: " vpixel
		echo ""
	done
	multiplier=$(echo "print($vpixel/2142)" | python3)
	echo ""
}
select_sr () {
	echo "SR STYLE:"
	echo ""
	echo "Original RAZR V3 UI elements are enhanced"
	echo "using the following super resolution styles:"
	echo ""
	PS3="Please select a SR style for UI elements: "
	select style in x4 anime ; do
		case $style in
			$style ) sr=$style
				break;;
			* ) echo "Invalid option.";;
		esac
	done
	echo ""
}
select_skin () {
	echo "SKIN:"
	echo ""
	timg -g80 -W --grid=5 --title=%b files/$sr/previews/*
	echo ""
	PS3="Please select a skin: "
	skins=$(basename -a files/$sr/skins/*)
	COLUMNS=1
	select skin in $skins ; do
		case $skin in
			$skin ) echo ""
				cp files/$sr/skins/$skin/* RetroRazr/res/drawable
				cp files/common/skins/$skin/* RetroRazr/res/values
				break;;
			* ) echo "Invalid option.";;
		esac
	done
}
select_wallpaper () {
	echo "WALLPAPER:"
	echo ""
	timg -g80 -W --grid=5 --title=%b files/$sr/wallpapers/*
	echo ""
	PS3="Please select a wallpaper: "
	wallpapers=$(basename -a files/$sr/wallpapers/*)
	COLUMNS=1
	select wallpaper in $wallpapers ; do
		case $wallpaper in
			$wallpaper ) echo ""
				cp files/$sr/wallpapers/$wallpaper RetroRazr/res/drawable/homescreen_wallpaper.png
				break;;
			* ) echo "Invalid option.";;
		esac
	done
}
edit_files () {
	cp files/$sr/common/* RetroRazr/res/drawable
	cp -r files/common/root/* RetroRazr
	python3 utils/multiple.py $multiplier files/common/root/res/values/dimens.xml RetroRazr/res/values/dimens.xml
	sed -i "s/RetroRazr/RetroRazr\-$vpixel\-$sr\-$skin\-$wallpaper/g" RetroRazr/apktool.yml
	for f in RetroRazr/res/values/public.xml RetroRazr/res/drawable/ui_powerup_{11..15}.png ; do
		rm "$f"
	done
}
summarize () {
	echo "SUMMARY:"
	echo "Resolution: width x $vpixel"
	echo "Multiplier: $multiplier"
	echo "SR style: $sr"
	echo "Skin: $skin"
	echo "Wallpaper: $wallpaper"
	echo ""
	read -n 1 -s -p "Please press ENTER to build or any other key to exit: " confirm
	echo ""
	if [[ $confirm != "" ]] ; then
		echo "Exiting .."
		exit
	fi
}
build_apk () {
	echo "Building .."
	java -jar utils/apktool.jar b --use-aapt2 RetroRazr &>/dev/null
	echo "Aligning and signing .."
	java -jar utils/uber-apk-signer.jar -a RetroRazr/dist/RetroRazr\-$vpixel\-$sr\-$skin\-$wallpaper.apk &>/dev/null
	if [[ -s RetroRazr/dist/RetroRazr\-$vpixel\-$sr\-$skin\-$wallpaper-aligned-debugSigned.apk ]] ; then
		echo "RetroRazr is complete!"
		cp RetroRazr/dist/RetroRazr\-$vpixel\-$sr\-$skin\-$wallpaper-aligned-debugSigned.apk .
	else echo "Build failed."
	fi
}
clear
echo ""
echo "-----------------"
echo "       /v\\"
echo " RetroRazr maker"
echo "-----------------"
echo ""
start_new
enter_vpixel
select_sr
select_skin
select_wallpaper
edit_files
summarize
build_apk

