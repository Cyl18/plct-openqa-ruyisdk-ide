export DISPLAY=:1

gnome-screenshot -f tmp.png -w
flatpak run io.github.lruzicka.Needly tmp.png