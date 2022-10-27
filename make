#!/usr/bin/env bash

fn_style() {
	echo "Original RAZR V3 UI elements are enhanced"
	echo "using the following super resolution styles"
	PS3="Select a style: "
	select style in x4 anime ; do
		case $style in
			$style)
				break
				;;
		esac
	done
}
fn_wallpaper() {
	cd files/$style/wallpapers
	timg --fit-width --grid=5 --title *
	cd ../../..
	PS3="Select a wallpaper: "
	wallpapers=$(basename -a files/$style/wallpapers/*)
	select wallpaper in $wallpapers ; do
		case $wallpaper in
			$wallpaper)
				break
				;;
		esac
	done
}
fn_skin() {
	cd files/$style/previews
	timg --fit-width --grid=5 --title *
	cd ../../..
	PS3="Select a skin: "
	skins=$(basename -a files/$style/previews/*)
	select skin in $skins ; do
		case $skin in
			$skin)
				break
				;;
		esac
	done
}
fn_vpx() {
	vpx=""
	while ! [[ $vpx =~ ^[0-9] ]] ; do
		echo "Vertical pixel value is used"
		echo "to scale dimensions properly"
		read -p "Enter target device's vertical pixel value: " vpx
	done
}
fn_customize() {
	[ -d RetroRazr ] && rm -rf RetroRazr
	7z x files/RetroRazr.zip &>/dev/null
	cp -r files/root/* RetroRazr
	cp files/$style/drawable/* RetroRazr/res/drawable
	cp files/$style/wallpapers/$wallpaper RetroRazr/res/drawable/homescreen_wallpaper.png
	cp files/$style/$skin/* RetroRazr/res/drawable
	cp files/$skin/* RetroRazr/res/values
	rm RetroRazr/res/values/public.xml RetroRazr/res/drawable/ui_powerup_{11..15}.png
	python3 bin/multiple.py $(bc -l <<< $vpx/2142) files/root/res/values/dimens.xml RetroRazr/res/values/dimens.xml
	sed -i "s/RetroRazr/RetroRazr\-$style\-$skin\-$wallpaper\-$vpx/g" RetroRazr/apktool.yml
}
fn_finalize() {
	echo "Building .."
	apktool b --use-aapt2 RetroRazr &>/dev/null
	echo "Aligning and signing .."
	java -jar bin/uber-apk-signer.jar -a RetroRazr/dist/RetroRazr\-$style\-$skin\-$wallpaper\-$vpx.apk &>/dev/null
	if [ -s RetroRazr/dist/RetroRazr\-$style\-$skin\-$wallpaper\-$vpx-aligned-debugSigned.apk ] ; then
		cp RetroRazr/dist/RetroRazr\-$style\-$skin\-$wallpaper\-$vpx-aligned-debugSigned.apk .
		fn_mainmenu
	else
		echo "Build failed."
		exit 1
	fi
}
fn_mainmenu() {
	clear
	[[ $style = "" ]] && style="x4"
	[[ $wallpaper = "" ]] && wallpaper="Moto"
	[[ $skin = "" ]] && skin="Moto"
	[[ $vpx = "" ]] && vpx="2142"
	echo "/v\\ | RetroRazr maker"
	echo ""
	timg --fit-width --grid=3 files/$style/wallpapers/$wallpaper
	timg --fit-width --grid=3 files/$style/previews/$skin
	echo ""
	echo "1) Customize style	current: $style"
	echo "2) Customize wallpaper	current: $wallpaper"
	echo "3) Customize skin	current: $skin"
	echo "4) Customize scale	current: (w) x $vpx"
	echo "5) Build"
	echo "6) Exit"
	read -p "Choose an option: " opt
	case $opt in
	1)
		fn_style
		fn_mainmenu
		;;
	2)
		fn_wallpaper
		fn_mainmenu
		;;
	3)
		fn_skin
		fn_mainmenu
		;;
	4)
		fn_vpx
		fn_mainmenu
		;;
	5)
		fn_customize
		fn_finalize
		;;
	6)
		exit 0
		;;
	*)
		exit 1
		;;
	esac
}
fn_mainmenu

