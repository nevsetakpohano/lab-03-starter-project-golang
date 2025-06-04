FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o app

FROM gcr.io/distroless/base
COPY --from=builder /app/app .
CMD ["./app"]