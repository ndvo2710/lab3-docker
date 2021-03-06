FROM node:8.9-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --silent && mv node_modules ../ && cd /usr/src/app/client && npm install && npm run build
COPY . .
EXPOSE 3000
CMD npm start