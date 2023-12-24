# Web 1.0 Internet Radio

Radio infrastructure for [Web 1.0 Telegram Channel](https://t.me/netscapedidnothingwrong)

## Content Suggestions

TODO

## Requirements

- Docker
- Liquidsoap
- FFmpeg
- VSCode
  - vscode-liquidsoap plugin

## secrets.liq template

```
streamUrl = "REPLACE_ME"
streamKey = "REPLACE_ME"
```

## Usage

```bash

touch secrets.liq
echo 'streamUrl = "replace_me"' >> secrets.liq
echo 'streamKey = "replace_me"' >> secrets.liq

make all
```
