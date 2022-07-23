ARG VERSION=unspecified

FROM ubuntu/apache2:latest

#ARG VERSION

# For a list of pre-defined annotation keys and value types see:
# https://github.com/opencontainers/image-spec/blob/master/annotations.md
# Note: Additional labels are added by the build workflow.
#LABEL org.opencontainers.image.authors="alexs.wijoyo@cisa.dhs.gov"
#LABEL org.opencontainers.image.vendor="Cybersecurity and Infrastructure Security Agency"

#ARG CISA_UID=421
#ENV CISA_HOME="/home/cisa"

# RUN addgroup --system --gid ${CISA_UID} cisa \
#   && adduser --system --uid ${CISA_UID} --ingroup cisa cisa

RUN apt-get clean && apt-get update && apt-get install -y apt-utils
RUN apt-get install -y ssl-cert && \
a2enmod rewrite headers proxy proxy_http cache && a2dismod -f deflate && \
a2enmod ssl && a2ensite default-ssl.conf

#ENTRYPOINT ["/bin/bash -c", "echo 'Apache up and running'"]

# WORKDIR ${CISA_HOME}
# USER cisa
