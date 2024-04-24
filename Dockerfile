FROM ubuntu

RUN apt update

COPY ./main.go /home/main.go


From golang AS BUILD

WORKDIR /src

COPY --from=0 /home/main.go ./main.go

RUN go build -o /bin/hello ./main.go


FROM scratch

COPY --from=BUILD /bin/hello /bin/hello

CMD ["/bin/hello"]
