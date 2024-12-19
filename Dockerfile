FROM docker.elastic.co/elasticsearch/elasticsearch:8.3.2

#RUN apt-get update -y \
#    && apt-get install -y sudo tzdata \
#    && apt-get clean

# analysis-nori 플러그인 설치
RUN curl -L -k -o /tmp/analysis-nori.zip https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-nori/analysis-nori-8.3.2.zip
RUN curl -L -k -o /tmp/elasticsearch-analysis-arirang.zip https://github.com/HowookJeong/elasticsearch-analysis-arirang/releases/download/v8.3.2/elasticsearch-analysis-arirang-8.3.2.zip

RUN mkdir -p /tmp/data
COPY data/user_dict.txt /usr/share/elasticsearch/config/user_dict.txt

RUN bin/elasticsearch-plugin install --batch file:///tmp/analysis-nori.zip
RUN bin/elasticsearch-plugin install --batch file:///tmp/elasticsearch-analysis-arirang.zip

ENV discovery.type=single-node
ENV xpack.security.enabled=false
ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"

CMD ["/usr/local/bin/docker-entrypoint.sh"]