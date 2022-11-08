#/bin/bash/
clear
read -p "do you want to install windows10? " window
if [ "$window" = "y" ]; then
	read -p "step 1- download ZArchivar from playstore " done1
	echo "step 2- download windows file from this link"
	read -p "https://drive.google.com/u/0/uc?id=1XuqObh4t9RwZLOorCEB1beHj-v_B5GJ0&export=download"
	read -p "step 3- move downloaded file to /sdcard/windows10 (create windows10 folder first)"
	read -p '''step 4- Open ZArchiver App  
	Open Download Folder
	Select all files and click the extract button to extract files 
	Password:– termux.xyz  
	After the extraction is complete, you will get a Disk folder that will act as external storage'''
fi
	echo "now let me do something just wait..."
	sleep2
	apt update && apt upgrade -y
	pkg install x11-repo
	termux-setup-storage
	pkg install qemu-system-i386-headless -y
	pkg install qemu-system-i386 -y
	clear
	echo "starting windows10"
	sleep2
	clear
	qemu-system-x86_64 \
		-hda /storage/emulated/0/windows10/Windows-10.qcow2 \
		-cpu max \
            	-smp cpus=4,cores=4,threads=1,sockets=1 \
	    	-m 2045M,slots=2,maxmem=2047M \
	    	-machine pc \
	    	-vga vmware -full-screen \
	    	-overcommit mem-lock=off \
	    	-accel tcg,thread=single \
	    	-rtc base=localtime \
	    	-net user -net nic,model=rtl8139 \
	    	-drive file=fat:rw:/storage/emulated/0/windows10/Disk \
	    	-vnc 127.0.0.1:1

