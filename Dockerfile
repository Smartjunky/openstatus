FROM ubuntu:22.04

# Basis-Pakete für Devbox installieren
RUN apt-get update && apt-get install -y curl git sudo ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Devbox installieren (non-interactive)
RUN curl -fsSL https://get.jetify.com/devbox | bash -s -- -f && \
    mv devbox /usr/local/bin/devbox

# Arbeitsverzeichnis setzen
WORKDIR /app

# Projekt ins Image kopieren
COPY . .

# Dependencies installieren
RUN devbox install

# Expose Port (Next.js default ist 3000, falls in devbox.json nichts anderes steht)
EXPOSE 3000

# Services starten
CMD ["devbox", "services", "up"]
