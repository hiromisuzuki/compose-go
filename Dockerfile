FROM golang:latest

ENV GOPATH $GOPATH:/go

RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y git

RUN go get github.com/revel/revel && \
    go get github.com/revel/cmd/revel && \
    go get github.com/revel/cron && \
    go get github.com/jinzhu/gorm && \
    go get github.com/go-sql-driver/mysql
RUN git clone https://github.com/revel/modules.git $GOPATH/src/github.com/revel/modules
RUN git clone https://github.com/revel/examples.git $GOPATH/src/github.com/revel/examples

COPY . /go/src

EXPOSE 9000
