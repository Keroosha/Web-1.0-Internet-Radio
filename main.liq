#! /usr/bin/liquidsoap

%include "secrets.liq"

fallbackImage = mksafe(single("./fallback/error.png"))
videoPlaylist = mksafe(playlist(mode="randomize", "./content/"))
currentPlaylist = fallback([videoPlaylist, fallbackImage])

enc = %ffmpeg(
  format="flv",
  %audio(codec="aac", b="128k", samplerate=44100, q=4),
  %video(codec="libx264", b="2500k")
)

output.url(url="#{streamUrl}#{streamKey}", enc, videoPlaylist)