FROM docker.elastic.co/elasticsearch/elasticsearch:8.17.1

#RUN apt-get update -y \
#    && apt-get install -y sudo tzdata \
#    && apt-get clean

# analysis-nori 플러그인 설치
RUN curl -L -k -o /tmp/analysis-nori.zip https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-nori/analysis-nori-8.17.1.zip

RUN mkdir -p /tmp/data
COPY data/user_dict.txt /usr/share/elasticsearch/config/user_dict.txt
COPY data/synonyms.txt /usr/share/elasticsearch/config/synonyms.txt

RUN bin/elasticsearch-plugin install --batch file:///tmp/analysis-nori.zip

ENV discovery.type=single-node
ENV xpack.security.enabled=false
ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"

CMD ["/usr/local/bin/docker-entrypoint.sh"]