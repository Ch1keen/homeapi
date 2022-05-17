FROM 	ruby:3.0.4
RUN 	apt update && apt install -y build-essential postgresql-client
WORKDIR /app
COPY 	. /app
RUN	bundle install

RUN rm -f /app/tmp/pids/server.pid
CMD ["rails", "server", "-b", "0.0.0.0"]
