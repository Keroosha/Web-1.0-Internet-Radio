FROM ocaml/opam:debian-12-ocaml-4.14

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends libcurl4-gnutls-dev libgmp-dev libgmp-dev pkg-config libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libmad0-dev libpcre3-dev libsamplerate0-dev libswresample-dev libswscale-dev libtag1-dev zlib1g-dev &&\
 sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* &&\ 
 opam install --yes taglib mad cry samplerate ffmpeg tls-liquidsoap liquidsoap

WORKDIR /app
COPY *.liq /app/

VOLUME /app/content
VOLUME /app/fallback

CMD ["liquidsoap", "main.liq"]
