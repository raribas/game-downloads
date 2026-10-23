FROM nginx:stable-alpine
RUN nginx -V 2>&1 | grep -q http_dav_module
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY nginx/security.conf /etc/nginx/security.conf
COPY nginx/10-prepare.sh /docker-entrypoint.d/10-prepare.sh
COPY robots.txt /usr/share/nginx/html/robots.txt
RUN chmod +x /docker-entrypoint.d/10-prepare.sh
ENV UPLOAD_TOKEN=""
VOLUME ["/data"]
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://127.0.0.1/healthz >/dev/null || exit 1
