FROM hashicorp/packer:latest
RUN apk --no-cache add jq sed
ADD bin /opt/resource
