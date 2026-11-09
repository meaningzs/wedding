# 정적 파일 서빙용 nginx 이미지
FROM nginx:1.27-alpine

COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
RUN rm -f /usr/share/nginx/html/*
COPY . /usr/share/nginx/html/
RUN rm -rf /usr/share/nginx/html/deploy

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
