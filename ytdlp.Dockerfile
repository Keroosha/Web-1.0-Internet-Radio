FROM python:3.11.3 AS MAIN

RUN pip install --no-cache-dir yt-dlp

WORKDIR /ytdlp

EXPOSE 80
VOLUME /ytdlp/content
VOLUME /ytdlp/content.txt

CMD ["yt-dlp", "-a", "/ytdlp/content.txt", "-P", "/ytdlp/content", "--abort-on-error", "-f", "mp4"]