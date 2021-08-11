#
# Base image
#
FROM savonet/liquidsoap:v2.0.0-beta3 AS base

# Set time zone
ENV TZ="UTC"

#
# Icecast build stage (for later copy)
#
FROM azuracast/icecast-kh-ac:2.4.0-kh15-ac1 AS icecast

FROM base AS liquidsoap

# Create azuracast user and run Azuracast scripts
USER root
COPY ./build/ /bd_build
RUN chmod a+x /bd_build/*.sh
RUN /bd_build/prepare.sh 
RUN /bd_build/add_user.sh 
RUN /bd_build/setup.sh
RUN /bd_build/cleanup.sh 
RUN rm -rf /bd_build

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
