#
# Base image
#
FROM savonet/liquidsoap:v2.0.3 AS base

# Set time zone
ENV TZ="UTC"


# Create azuracast user and run Azuracast scripts
# Run base build process
COPY ./build/ /bd_build

USER root
RUN chmod a+x /bd_build/*.sh \
    && /bd_build/prepare.sh \
    && /bd_build/add_user.sh \
    && /bd_build/setup.sh \
    && /bd_build/cleanup.sh \
    && rm -rf /bd_build

RUN ln -s /usr/bin/liquidsoap /usr/local/bin/liquidsoap


FROM azuracast/icecast-kh-ac:2.4.0-kh15-ac1 AS icecast

FROM base AS liquidsoap

USER azuracast

# Import Icecast-KH from build container
COPY --from=icecast /usr/local/bin/icecast /usr/local/bin/icecast
COPY --from=icecast /usr/local/share/icecast /usr/local/share/icecast


EXPOSE 9001
EXPOSE 8000-8999

# Include radio services in PATH
ENV PATH="${PATH}:/var/azuracast/servers/shoutcast2"
VOLUME ["/var/azuracast/servers/shoutcast2", "/var/azuracast/www_tmp"]

CMD ["/usr/local/bin/my_init"]