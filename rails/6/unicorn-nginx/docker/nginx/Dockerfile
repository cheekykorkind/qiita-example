FROM nginx:1.19.0-alpine

COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf

# confファイルの優先順位問題を回避するためにCOPY先を/etc/nginx/conf.d/default.confにして上書きする
COPY ./docker/nginx/web.conf /etc/nginx/conf.d/default.conf

EXPOSE 80