# --- ETAPA 1: Builder ---
FROM node:alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm install --production

# --- ETAPA 2: Producción Minimalista y Segura ---
FROM node:alpine
WORKDIR /app

# Crear un usuario no-root por seguridad
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copiar solo las dependencias de producción desde la etapa anterior
COPY --from=builder /app/node_modules ./node_modules
COPY index.js package.json ./

# Cambiar al usuario no-root
USER appuser

EXPOSE 3000
CMD ["node", "index.js"]
