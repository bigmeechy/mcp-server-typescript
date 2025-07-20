FROM node:22.12-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --ignore-scripts
COPY tsconfig.json ./
COPY src/ ./src/
RUN npm run build
EXPOSE 3000
ENV NODE_ENV=production
ENTRYPOINT ["node", "build/main/main/cli.js"]