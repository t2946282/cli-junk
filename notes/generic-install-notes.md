# Just some generic install notes for work/dev/hobby hosts and stuff

## Chocolatey (PS)

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

**As administrator:**

choco list \
choco upgrade all

choco install choco-cleaner 7zip git nuget.commandline grep curl awk sed wget \
choco install python nodejs-lts openjdk

## Cmder
[https://cmder.app/](https://cmder.app/)

## Claude code terminal (PS)

irm https://claude.ai/install.ps1 | iex

