FROM tomcat:9.0

ARG IMAGE_CREATE_DATE
ARG IMAGE_VERSION
ARG IMAGE_SOURCE_REVISION

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="Globex" \
      org.opencontainers.image.description="Simple Java & Bootstrap Web Application used to demonstrate ServiceNow DevOps capabilities" \
      org.opencontainers.image.created=$IMAGE_CREATE_DATE \
      org.opencontainers.image.version=$IMAGE_VERSION \
      org.opencontainers.image.authors="Anthony Angelo" \
      org.opencontainers.image.url="https://github.com/pangealab/medusa/" \
      org.opencontainers.image.documentation="https://github.com/pangealab/medusa/README.md" \
      org.opencontainers.image.vendor="Anthony Angelo" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/pangealab/medusa.git" \
      org.opencontainers.image.revision=$IMAGE_SOURCE_REVISION 

# Copy App
ADD target/globex-web.war /usr/local/tomcat/webapps/ROOT.war

# Run Tomcat
CMD ["catalina.sh", "run"]