
FROM python:2.7-alpine

ADD ./developertestapi ./developertestapi

WORKDIR ./developertestapi

# TODO(jkirkpatrick24): Move dependency management to bazel.
RUN apk update \
    && apk add libpq postgresql-dev \
    && apk add build-base

RUN pip install -r requirements.txt

CMD ["gunicorn", "messageapi.wsgi", "--log-file", "-"]
