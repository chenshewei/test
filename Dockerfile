FROM java:8-jdk-alpine
COPY ./marketing-service/target/marketing-service.jar /usr/app/
#COPY ./agent/ /usr/local/skyagent/
WORKDIR /usr/app
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN sh -c 'touch marketing-service.jar'
ENTRYPOINT java -javaagent:/usr/local/skyagent/skywalking-agent.jar=agent.service_name=${AGENT_SERVICE_NAME} -jar marketing-service.jar
