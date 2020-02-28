FROM erlang:21

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs git

RUN mkdir /app
WORKDIR /app

RUN git clone --branch 0.x https://github.com/zotonic/zotonic.git
RUN make -C zotonic

RUN mkdir /sites

ARG site=miraclethings

COPY . .
COPY docker/*.config ./
COPY docker/entrypoint.sh ./
COPY docker/site_config config
ENV SITE=$site

RUN ln -s /app /sites/${SITE}
RUN ls -la /sites
RUN echo $SITE

ENV ZOTONIC_CONFIG_DIR=/app

EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]
CMD ["start-nodaemon"]
