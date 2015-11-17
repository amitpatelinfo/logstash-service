FROM java:8
MAINTAINER Amit Patel <amitpatelinfo@gmail.com>

RUN apt-get update

ENV LOGSTASH_HOME /opt/logstash
ENV LOGSTASH_PACKAGE logstash-1.5.4

ENV ES_HOST=${ES_HOST:-'elasticsearch'}
ENV ES_PORT=${ES_PORT:-'9200'}

# Install Logstash
RUN cd /tmp && \
    wget https://download.elastic.co/logstash/logstash/$LOGSTASH_PACKAGE.tar.gz && \
    tar -xzvf ./$LOGSTASH_PACKAGE.tar.gz && \
    mv ./$LOGSTASH_PACKAGE $LOGSTASH_HOME && \
    rm ./$LOGSTASH_PACKAGE.tar.gz

ENV PATH $LOGSTASH_HOME/bin:$PATH

ADD config/logstash.conf $LOGSTASH_HOME/config/logstash.conf

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 5000

CMD [ "/usr/local/bin/start.sh" ]
