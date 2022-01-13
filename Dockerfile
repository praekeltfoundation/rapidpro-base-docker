FROM python:3.9-alpine

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                gcc \
                g++ \
                make \
                libc-dev \
                musl-dev \
                linux-headers \
                binutils \
        && apk add --no-cache --virtual \
                proj-dev \
                gdal-dev \
                geos-dev \
        && apk del .build-deps

CMD ["python3"]
