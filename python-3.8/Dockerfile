FROM python:3.8.1-slim
ARG BUILD_DATE
ARG BUILD_URL
ARG GIT_URL
ARG GIT_COMMIT
ARG PYTHON_VERSION
LABEL maintainer="Kristian Berg <kristian.berg@evry.com>" \
      org.opencontainers.image.title="base-python" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Kristian Berg <kristian.berg@evry.com>" \
      org.opencontainers.image.url=$BUILD_URL \
      org.opencontainers.image.documentation="https://github.com/evryfs/base-python/" \
      org.opencontainers.image.source=$GIT_URL \
      org.opencontainers.image.version=$PYTHON_VERSION \
      org.opencontainers.image.revision=$GIT_COMMIT \
      org.opencontainers.image.vendor="EVRY Financial Services" \
      org.opencontainers.image.licenses="proprietary-license" \
      org.opencontainers.image.description="Base image for python 3.8"

RUN useradd -r -s /bin/bash -c "application user" -d /app -u 1001 -g 100 -m appuser
WORKDIR /app
USER 1001:100
ENTRYPOINT ["python"]
