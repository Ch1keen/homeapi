FROM 	ruby:3.0.3
RUN 	apt update && apt install -y build-essential postgresql-client
WORKDIR /app
COPY 	. /app
RUN	bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
