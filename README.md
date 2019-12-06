# EVRY FS python base image

This is the base image for running plain python applications. For WSGI or
ASGI web applications, use the other base images that are based on this.

## Usage

Just add your sauce to /app and proceed as befitting your platform.

### Defaults

| user | appuser |
| UID  | 1001    |
| GID  | 100     |
| cwd  | /app    |

### Creating a Dockerfile

To utilize this image to create a container for your application, create a new
Dockerfile and extend this image. Then add your python sauce to the container
and supply your own startup script. Check the [building containers](https://fswiki.evry.com/display/architecture/Building+containers)
guide for information about the required labels.

```dockerfile
FROM evryfs/base-python:3.8.0
ARG BUILD_DATE
ARG BUILD_URL
ARG GIT_URL
ARG GIT_COMMIT
LABEL maintainer="Your Name <your.email.here@evry.com>"
      com.finods.ccm.system=""
      com.finods.ccm.group=""
      org.opencontainers.image.title=""
      org.opencontainers.image.created=$BUILD_DATE
      org.opencontainers.image.authors=""
      org.opencontainers.image.url=$BUILD_URL
      org.opencontainers.image.documentation=""
      org.opencontainers.image.source=$GIT_URL
      org.opencontainers.image.version=""
      org.opencontainers.image.revision=$GIT_COMMIT
      org.opencontainers.image.vendor="EVRY Financial Services"
      org.opencontainers.image.licenses="proprietary-license"
      org.opencontainers.image.description=""

COPY build/ .
CMD "/app/your_startup_script.sh"
```

