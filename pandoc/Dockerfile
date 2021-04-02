FROM pandoc/latex

RUN apk --no-cache add make \
    && tlmgr install preprint

RUN apk --no-cache add aspell aspell-en

WORKDIR /home

ENTRYPOINT [""]
