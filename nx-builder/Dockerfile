FROM openjdk:8-jdk
MAINTAINER Loïc Billon

RUN apt-get update && apt-get install -y locales vim maven python sudo npm \
	&& localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8

ENV LANG fr_FR.utf8
RUN locale >> /etc/default/locale

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Entrypoint
COPY entrypoint.sh /
COPY settings.xml /opt
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ENV NX_VERSION=release-10.10-HF61

CMD ["start"]

