#!/usr/bin/env bash

start_new () {
	[ -d RetroRazr ] && rm -rf RetroRazr
	7z x files/RetroRazr.zip &>/dev/null
}
select_sr () {
	echo "Original RAZR V3 UI elements are enhanced"
	echo "using the following super resolution styles"
	PS3="Please select a style: "
	select style in x4 anime ; do
		case $style in
			$style )
				sr=$style
				break;;
			* )
				echo "Invalid option.";;
		esac
	done
}
select_skin () {
	cd files/$sr/previews
	timg --fit-width --grid=5 --title *
	cd ../../..
	PS3="Please select a skin: "
	skins=$(basename -a files/$sr/skins/*)
	select skin in $skins ; do
		case $skin in
			$skin )
				cp files/$sr/skins/$skin/* RetroRazr/res/drawable
				cp files/common/skins/$skin/* RetroRazr/res/values
				break;;
			* )
				echo "Invalid option.";;
		esac
	done
}
select_wallpaper () {
	cd files/$sr/wallpapers
	timg --fit-width --grid=5 --title *
	cd ../../..
	PS3="Please select a wallpaper: "
	wallpapers=$(basename -a files/$sr/wallpapers/*)
	select wallpaper in $wallpapers ; do
		case $wallpaper in
			$wallpaper )
				cp files/$sr/wallpapers/$wallpaper RetroRazr/res/drawable/homescreen_wallpaper.png
				break;;
			* )
				echo "Invalid option.";;
		esac
	done
}
enter_vpx () {
	vpx=""
	while ! [[ $vpx =~ ^[0-9] ]] ; do
		read -p "Please enter target device's vertical pixel value: " vpx
		echo ""
	done
}
customize () {
	cp files/$sr/common/* RetroRazr/res/drawable
	cp -r files/common/root/* RetroRazr
	python3 bin/multiple.py $(bc -l <<< $vpx/2142) files/common/root/res/values/dimens.xml RetroRazr/res/values/dimens.xml
	sed -i "s/RetroRazr/RetroRazr\-$sr\-$skin\-$wallpaper\-$vpx/g" RetroRazr/apktool.yml
	rm RetroRazr/res/values/public.xml RetroRazr/res/drawable/ui_powerup_{11..15}.png
}
summarize () {
	echo "SUMMARY"
	echo "Style: $sr"
	echo "Skin: $skin"
	echo "Wallpaper: $wallpaper"
	echo "Resolution: (width) x $vpx"
}
finalize () {
	read -n 1 -s -p "Please press ENTER to build or any other key to exit: " confirm
	echo ""
	[[ $confirm = "" ]] || exit
}
build () {
	echo "Building .."
	apktool b --use-aapt2 RetroRazr &>/dev/null
	echo "Aligning and signing .."
	java -jar bin/uber-apk-signer.jar -a RetroRazr/dist/RetroRazr\-$sr\-$skin\-$wallpaper\-$vpx.apk &>/dev/null
	if [ -s RetroRazr/dist/RetroRazr\-$sr\-$skin\-$wallpaper\-$vpx-aligned-debugSigned.apk ] ; then
		cp RetroRazr/dist/RetroRazr\-$sr\-$skin\-$wallpaper\-$vpx-aligned-debugSigned.apk .
		echo "RetroRazr is complete!"
	else
		echo "Build failed."
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
select_sr
echo ""
select_skin
echo ""
select_wallpaper
echo ""
enter_vpx
customize
summarize
echo ""
finalize
build

