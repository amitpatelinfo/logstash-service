FROM java:8
MAINTAINER Amit Patel <amitpatelinfo@gmail.com>

RUN apt-get update

ENV ES_HOME /elasticsearch
ENV ES_PACKAGE elasticsearch-1.5.0

# Install Elasticsearch
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PACKAGE.tar.gz && \
  tar xvzf $ES_PACKAGE.tar.gz && \
  mv /$ES_PACKAGE $ES_HOME && \
  rm -f $ES_PACKAGE.tar.gz

ENV PATH $ES_HOME/bin:$PATH

# marvel
RUN plugin -i elasticsearch/marvel/latest

# watcher
RUN /elasticsearch/bin/plugin -i elasticsearch/license/latest
RUN /elasticsearch/bin/plugin -i elasticsearch/watcher/latest


# Mount elasticsearch.yml config
ADD config/elasticsearch.yml $ES_HOME/config/elasticsearch.yml

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
#WORKDIR /data

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Define default command.
CMD ["/usr/local/bin/start.sh"]

EXPOSE 9200 9300
