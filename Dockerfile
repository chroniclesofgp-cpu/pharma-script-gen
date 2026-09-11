FROM mwader/static-ffmpeg:7.1 AS ffmpeg-source

FROM node:22-slim
COPY --from=ffmpeg-source /ffmpeg /ffprobe /usr/local/bin/
WORKDIR /app
COPY . .
RUN npm install -g corepack@latest && corepack pnpm install && corepack pnpm run build
ENV NODE_ENV=production
CMD ["node", "dist/index.js"]
