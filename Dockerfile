FROM alpine:3.18.0

ENV KUBE_LATEST_VERSION="v1.27.2"

# hadolint ignore=DL3018
RUN apk add --no-cache --update ca-certificates \
 && apk add --no-cache --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps

USER 10000
ENTRYPOINT ["kubectl"]
CMD ["help"]

