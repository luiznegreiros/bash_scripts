# messy version of the trailer grab script to be run manually via cli from individual directories.
# not for use with automation or radarr. it will not be updated very often unless i find a major issue.

# api keys for themoviedb and youtube data api v3 (split for lazy obfuscation purposes)
K1A=1df2a2659c50fdab
K1B=77b8d9f8459cf95a
K2A=AIzaSyCCD8e6A
K2B=DQ4lOQcV77ErX
K2C=yK3_d4unJwcYE
KEY1=${K1A}${K1B}
KEY2=${K2A}${K2B}${K2C}

# check to see if a trailer exists and do stuff if it doesn't (hey look this happens now!)
if [ ! -f movie-trailer.* ]
    then
        printf "Trailer does not exist for '${PWD##*/}', attempting to grab one."'\n' >&2


  # gather and process video resolution (requires ffmpeg and permission to run it)
  # RES=$(ffmpeg -i $(ls *.mkv *.mp4 *.m4v *.webm *.flv *cd1*avi *.avi 2>/dev/null | grep -v movie-trailer | head -1) 2>&1 | grep -oP 'Stream .*, \K[0-9]+x[0-9]+')
  # RES2=$(echo ${RES} | cut -d 'x' -f1)

  # # confirm if video resolution requires an sd 480p or hd 720p trailer (we don't bother with 1080p, so there's no check or variable set for it here)
  # if [ ${RES2} -gt 1000 ]
  #   then
  #     RES3=720
  #   else
  #     RES3=480
  # fi
  RES3=1080

  # set imdbid for film to static variable (needed here)
  if [ -f movie.nfo ]
  then
    TT=$(cat movie.nfo | grep tt | cut -d \> -f2 | cut -c1-9)
  else
    TT=$(cat *.nfo | grep ">tt" | cut -d \> -f2 | cut -c1-9)
    # if [ -z '${TT}' ]
    # then
    #   TT=$(cat *.nfo | grep -a "/tt" | tr -cd '\11\12\40-\176' | cut -d \/ -f5)
    # fi
  fi
  # echo TT: ${TT}

  lang=pt-BR
  retry=1

  while [ ${retry} -eq 1 ]; do
    retry=0

    # pull tmdb id for film based on imdbid (yes this does indeed require two api calls. should no longer result in Judgement Night, unless it does)
    TMDB=$(curl -s "http://api.themoviedb.org/3/find/${TT}?api_key=${KEY1}&external_source=imdb_id" | tac | tac | jq -r '.' | grep "id\"" | sed 's/[^0-9]*//g')
    echo TMDB: "http://api.themoviedb.org/3/find/${TT}?api_key=${KEY1}&language=${lang}&external_source=imdb_id"
    # pull trailer video id from tmdb based on tmdb id (imperfect, may not grab anything or may grab an video that is not trailer)
    # never assume just one video in the output. derp.
    YOUTUBE=$(curl -s "http://api.themoviedb.org/3/movie/${TMDB}/videos?api_key=${KEY1}" | tac | tac | jq '.results[0]' | grep key | cut -d \" -f4)
    echo YOUTUBE: http://api.themoviedb.org/3/movie/${TMDB}/videos?api_key=${KEY1}&language=${lang}
    # echo YOUTUBE: ${YOUTUBE}
    echo site: https://www.youtube.com/watch?v=${YOUTUBE}

    # color for id output (ok?)

    BLUE='\033[0;34m'
    GREEN='\033[0;32m'
    LIGHTGREEN='\033[1;32m'
    YELLOW='\033[1;33m'
    RED='\033[0;31m'
    LIGHTRED='\033[1;31m'
    NC='\033[0m' # No Color

    # list imdb tmdb and youtube ids for reference
    printf "${YELLOW}$TT ${BLUE}-> ${LIGHTGREEN}${TMDB} ${BLUE}-> ${LIGHTRED}${YOUTUBE}${NC}"'\n' >&2

    # download trailer from youtube based on video resolution (requires youtube-dl and permission to run it)
    # occasionally this step throws an error:
    # "WARNING: Could not send HEAD request to https://www.youtube.com/watch?v=XXXXXXXXXXX
    # XXXXXXXXXXX: <urlopen error no host given>
    # ERROR: Unable to download webpage: <urlopen error no host given> (caused by URLError('no host given',))"
    # no idea why this happens, or how to fix it.  XD
    # now with 100% more validity checking!  that will "probably" work and not break the process?

    # SANITY=$(curl -s "https://www.googleapis.com/youtube/v3/videos?part=id&id=${YOUTUBE}&key=${KEY2}" | tac | tac | jq -r '.' | grep totalResults | sed 's/[^0-9]*//g')

    if [ ! -z ${YOUTUBE} ]
      then
        printf "YouTube trailer exists, attempting to download." >&2
        youtube-dl -f 'bestvideo[height<='${RES3}'][vcodec!=av01.0.05M.08]+bestaudio/best[height<='${RES3}'][vcodec!=av01.0.05M.08]' -q "https://www.youtube.com/watch?v=${YOUTUBE}" -o movie-trailer --newline --restrict-filenames --merge-output-format mkv
        result=$?
        if [ ${result} -ne 0 ] && [ "${lang}" != "en-US" ]; then
          printf '\n'"Retring with the english version"'\n' >&2
          lang=en-US
          retry=1
        else
          sleep 5
          TRAILERNAME=$(ls movie-trailer.*)
          printf '\n'"Trailer downloaded: ${TRAILERNAME}"'\n' >&2
        fi
      else
        if [ "${lang}" != "en-US" ]; then
          printf '\n'"Retring with the english version"'\n' >&2
          lang=en-US
          retry=1
        else
          printf '\n'"YouTube trailer does not exist. (End of the line)"'\n' >&2
        fi
    fi

  done
else
  # this is from earlier when we started checking for a trailer. let's hope nesting if statements doesn't fuck up somehow
  TRAILERNAME=$(ls movie-trailer.*)
  printf "Trailer already exists for '${PWD##*/}': ${TRAILERNAME}"'\n' >&2
fi