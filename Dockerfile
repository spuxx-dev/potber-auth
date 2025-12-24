FROM node:24-bullseye-slim AS build
WORKDIR /app
COPY . ./
RUN npm install
RUN npm run build

FROM node:24-alpine
COPY --from=build /app /usr/src/app

EXPOSE 3000

USER 1000
CMD [ "node", "/usr/src/app/build" ]
