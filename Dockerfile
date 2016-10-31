FROM alpine:3.4

RUN  apk add curl jq --update-cache

ADD linker.sh /usr/bin/linker.sh
RUN chmod +x /usr/bin/linker.sh && \
    echo "* * * * * /usr/bin/linker.sh" > /var/spool/cron/crontabs/root

CMD ["crond", "-f"]
