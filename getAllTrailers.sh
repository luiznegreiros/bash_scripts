diretorio='/media/arquivos/plex/movies/'

find $diretorio -maxdepth 1 | while read item
do
    cd "${item}"
    if [ -f *.nfo ]
    then
      printf "\n\nFazendo download do trailer do filme '${PWD##*/}'."'\n' >&2
      /home/luiz/localtrailer.sh
    fi
done | sort 
