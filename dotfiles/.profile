export PATH=$PATH:$HOME/.scripts
#Def Progs
export EDITOR="nano"
export BROWSER="brave"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	sudo mount /dev/sda4 /media/data/C
	sudo mount /dev/sda7 /media/data/D
	sudo mount /dev/sda8 /media/data/E
	pgrep startplasma-x11 || startx
fi
