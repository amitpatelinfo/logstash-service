FROM kibana:4.1.2

RUN apt-get update && apt-get install -y netcat

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh


# Mount elasticsearch.yml config
COPY config/kibana.yml /opt/kibana/config/kibana.yml

EXPOSE 5601

CMD ["/usr/local/bin/start.sh"]
