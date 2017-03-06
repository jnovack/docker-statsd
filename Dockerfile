FROM      node:6-alpine

RUN       npm install -g statsd@0.8.0 --no-optional

CMD       ["/start.sh"]

EXPOSE    8125/udp

ADD       statsd.conf /opt/statsd.conf
ADD       start.sh /start.sh
