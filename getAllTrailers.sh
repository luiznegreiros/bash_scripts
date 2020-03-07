diretorio='/mnt/media-center/plex/movies/'
#diretorio=$1

find $diretorio -maxdepth 1 | while read item
do
    cd "${item}"
    if [ -f movie-trailer.f137.part ]
    then
      rm  movie-trailer.f137.part
    fi 

    if [ -f *.nfo ]
    then
      printf "\n* Fazendo download do trailer do filme '${PWD##*/}'."'\n' >&2
      /mnt/media-center/bash_scripts/localtrailer.sh
    fi
done | sort 
