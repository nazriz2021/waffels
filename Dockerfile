FROM golang:latest

# Set destination for COPY
#RUN adduser -S ubuntu -g root 

WORKDIR /app

# # Download Go modules
COPY go.mod .

# Copy the source code. Note the slash at the end, as explained in
COPY http.go ./

# Build
RUN go build -o /http

# This is for documentation purposes only.
# To actually open the port, runtime parameters
# must be supplied to the docker command.
EXPOSE 38080

# (Optional) environment variable that our dockerised
# application can make use of. The value of environment
# variables can also be set via parameters supplied
# to the docker command on the command line.
#ENV HTTP_PORT=8081

# Run
CMD [ "/http" ]

USER 1001
