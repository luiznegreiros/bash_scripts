YOUTUBE=$1
OUT=$2

if [ -z $3 ]
then
  RES=1080
else
  RES=$3
fi

if [ -z $YOUTUBE ] || [ -z $OUT ]
then
  printf "Script para download de video do youtube\n"
  printf "Utiliza o aplicativo youtube-dl\n"
  printf "\n"
  printf "\tyt-dl [id do filme no youtube] [nome do arquivo de saida]\n\n"
else
  youtube-dl -f 'bestvideo[height<='${RES}'][vcodec!=av01.0.05M.08]+bestaudio/best[height<='${RES}'][vcodec!=av01.0.05M.08]' "https://www.youtube.com/watch?v=${YOUTUBE}" -o ${OUT} --restrict-filenames --merge-output-format mkv
fi