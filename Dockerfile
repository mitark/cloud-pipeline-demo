FROM ubuntu:24.04

WORKDIR /usr/src/app

EXPOSE 5001

ENV REACT_APP_BACKEND_URL=http://127.0.0.1:8080

RUN apt-get -y update; apt-get -y install curl

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash && apt-get install -y nodejs && npm -v

COPY . .

RUN npm install && npm run build && npm install -g serve

CMD ["serve", "-s", "-l", "5001", "build"]
