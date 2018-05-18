FROM hashicorp/packer:latest
RUN apk --no-cache add awk jq sed
ADD bin /opt/resource
