FROM arm32v7/node:12-alpine

RUN deluser node && \
    mkdir /opt/foundryvtt && \
    mkdir /data && \
    mkdir /data/foundryvtt && \
    addgroup --gid 1059 gamers && \
    adduser --disabled-password --ingroup gamers fvtt && \
    chown fvtt:gamers /data/foundryvtt && \
    chown fvtt:gamers /opt/foundryvtt && \
    chmod 775 /data/foundryvtt && \
    chmod g+s /opt/foundryvtt && \
    chmod g+s /data/foundryvtt
USER fvtt

COPY --chown=fvtt run-server.sh /opt/foundryvtt
RUN chmod +x /opt/foundryvtt/run-server.sh
VOLUME /data/foundryvtt
VOLUME /host
EXPOSE 30000

ENTRYPOINT /opt/foundryvtt/run-server.sh
