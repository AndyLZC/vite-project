FROM node:16.18-alpine as build-stage

WORKDIR /app

# 单独分离 package.json，是为了安装依赖可最大限度利用缓存
ADD package.json /app/
RUN npm install

ADD . /app
RUN npm run build

# 选择更小体积的基础镜像
FROM nginx:alpine as prod-stage
COPY --from=build-stage app/dist /usr/share/nginx/html
COPY --from=build-stage app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
