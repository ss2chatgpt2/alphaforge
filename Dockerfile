# AlphaForge Production Dockerfile
FROM node:18-alpine AS base

# Install system dependencies
RUN apk add --no-cache libc6-compat python3 make g++ git curl

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy source code
COPY . .

# Build the application
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
(RUL€Tm run build

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]