source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

export WINIT_X11_SCALE_FACTOR=1.25
export GDK_DPI_SCALE=1.25
export QT_SCALE_FACTOR=1.25

export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

xrdb -merge ~/.Xresources
xset b off
xsetroot -cursor_name left_ptr
setxkbmap -option caps:super
# xbindkeys
if [ "$(xfconf-query -c xsettings -p /Net/ThemeName)" = "Matcha-dark-azul" ]; then
  hsetroot -solid '#252525'
else
  hsetroot -solid '#ebedef'
fi

picom &
xfsettingsd &
touchegg &
flameshot &
clipmenud &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
GDK_BACKEND=x11 ulauncher --hide-window --no-window-shadow &
xss-lock --transfer-sleep-lock -- ~/scripts/lock.sh &

exec bspwm
