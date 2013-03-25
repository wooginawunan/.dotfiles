alias blog="cd ~/Code/Project/octopress/chinghanho"
alias c="clear"
alias dotfiles="cd ~/.dotfiles"
alias prj="cd ~/Code/Project"
alias pra="cd ~/Code/Practice"
alias sdx="cd ~/Code/Sandbox"
alias minecraft="java -Xmx1024M -Xms512M -cp ~/Library/Application\ Support/minecraft/bin/MinecraftSP.jar net.minecraft.LauncherFrame"

gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}
