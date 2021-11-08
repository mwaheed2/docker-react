FROM node:14.5.0-alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .
RUN npm run build

From nginx
COPY --from=builder /app/build /usr/share/nginx/html