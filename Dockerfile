FROM python:3.9-alpine

COPY stack/geolibs.sh /
RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                gcc \
                g++ \
                make \
                libc-dev \
                musl-dev \
                linux-headers \
        && sh /geolibs.sh \
        && apk del .build-deps

CMD ["python3"]
