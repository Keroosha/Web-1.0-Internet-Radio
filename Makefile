.PHONY: all
all: ytdlp-build ytdlp-load radio-build radio-run

.PHONY: radio-build
radio-build:
	docker build -t "web10-radio:latest" -f "./Dockerfile" .

.PHONY: radio-run
radio-run:
	docker run -it -d -v "./content:/app/content" -v "./fallback:/app/fallback" --restart=always web10-radio:latest

.PHONY: ytdlp-build
ytdlp-build:
	docker build -t "web10-ytdlp:latest" -f "ytdlp.Dockerfile" .

.PHONY: ytdlp-load
ytdlp-load:
	docker run -it -v "./content:/ytdlp/content" -v "./content.txt:/ytdlp/content.txt" web10-ytdlp:latest
	sudo chown -R ${USER} content
