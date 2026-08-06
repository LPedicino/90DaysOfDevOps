# --- Etapa 1: Builder ---
FROM node:alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm install --production

# --- Etapa 2: Producción ---
FROM node:alpine
WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/node_modules ./node_modules
COPY index.js package.json ./

USER appuser

EXPOSE 3000
CMD ["node", "index.js"]
