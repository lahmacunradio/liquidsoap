#
# Base image
#
FROM ubuntu:focal AS base

# Set time zone
ENV TZ="UTC"

# Run base build process
COPY ./build/ /bd_build

RUN chmod a+x /bd_build/*.sh \
    && /bd_build/prepare.sh \
    && /bd_build/add_user.sh \
    && /bd_build/setup.sh \
    && /bd_build/cleanup.sh \
    && rm -rf /bd_build

#
# Icecast build stage (for later copy)
#
FROM azuracast/icecast-kh-ac:2.4.0-kh15-ac1 AS icecast

#
# Liquidsoap build stage
#
FROM base AS liquidsoap

# Install build tools
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
        build-essential libssl-dev libcurl4-openssl-dev bubblewrap unzip m4 software-properties-common \
        ocaml opam \
        autoconf automake

USER azuracast

RUN opam init --disable-sandboxing -a --bare && opam switch create ocaml-system.4.08.1 

# Uncomment to Pin specific commit of Liquidsoap
RUN cd ~/ \
     && git clone --recursive https://github.com/savonet/liquidsoap.git \
    && cd liquidsoap \
    && git checkout 6fc002dd8c27ea4d6849ac3078662d53fd484106 \
    && opam pin add --no-action liquidsoap .

ARG opam_packages="ladspa ffmpeg samplerate taglib mad faad fdkaac lame vorbis cry flac opus duppy ssl liquidsoap"
RUN opam install -y ${opam_packages}

#
# Main image
#
FROM base

# Import Icecast-KH from build container
COPY --from=icecast /usr/local/bin/icecast /usr/local/bin/icecast
COPY --from=icecast /usr/local/share/icecast /usr/local/share/icecast

# Import Liquidsoap from build container
COPY --from=liquidsoap --chown=azuracast:azuracast /var/azuracast/.opam/ocaml-system.4.08.1 /var/azuracast/.opam/ocaml-system.4.08.1

RUN ln -s /var/azuracast/.opam/ocaml-system.4.08.1/bin/liquidsoap /usr/local/bin/liquidsoap

EXPOSE 9001
EXPOSE 8000-8999

# Include radio services in PATH
ENV PATH="${PATH}:/var/azuracast/servers/shoutcast2"
VOLUME ["/var/azuracast/servers/shoutcast2", "/var/azuracast/www_tmp"]

CMD ["/usr/local/bin/my_init"]
