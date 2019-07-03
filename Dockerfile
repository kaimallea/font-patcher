ARG nerd_fonts_version=2.0.0
ARG nerd_fonts_source=https://github.com/ryanoasis/nerd-fonts/archive/v${nerd_fonts_version}.tar.gz

FROM ubuntu:bionic
ARG nerd_fonts_version
ARG nerd_fonts_source

RUN apt-get update && apt-get install -y curl
RUN curl -L ${nerd_fonts_source} | tar xvz -C /tmp nerd-fonts-${nerd_fonts_version}/font-patcher nerd-fonts-${nerd_fonts_version}/src/glyphs

FROM ubuntu:bionic
ARG nerd_fonts_version

RUN apt-get update && apt-get install -y locales python-fontforge python-pip && \
    pip install configparser && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8

WORKDIR /opt/nerd-fonts

COPY --from=0 /tmp/nerd-fonts-${nerd_fonts_version} .

ENTRYPOINT ["/opt/nerd-fonts/font-patcher"]
CMD ["-h"]

