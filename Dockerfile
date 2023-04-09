FROM ubuntu:22.04

RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && apt-get -y install --no-install-recommends \
    git \
    zsh \
    vim \
    curl ca-certificates \
    xdvik-ja \
    evince \
    build-essential \
    cpanminus \
    latexmk \
    language-pack-ja \
    wget \
    xzdec \
    texlive-lang-japanese \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-luatex \
    latexmk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString
RUN tlmgr init-usertree
RUN kanji-config-updmap-sys ipaex

ENV TZ=Asia/Tokyo
RUN zsh -c "`curl -L raw.github.com/44103/dotfiles/main/install.sh`"
