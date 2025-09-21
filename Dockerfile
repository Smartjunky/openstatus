# Basis-Image mit Ubuntu (du kannst auch debian:bookworm nehmen)
FROM ubuntu:22.04

# Devbox installieren
RUN apt-get update && apt-get install -y curl git sudo ca-certificates && \
    curl -fsSL https://get.jetify.com/devbox | bash && \
    mv devbox /usr/local/bin/ && \
    rm -rf /var/lib/apt/lists/*

# Setze Arbeitsverzeichnis
WORKDIR /app

# Kopiere Repo-Code ins Image
COPY . .

# Installiere Abhängigkeiten über devbox
RUN devbox install

# Exponiere den Port (falls deine Web-App auf 3000 läuft)
EXPOSE 3000

# Starte alle Services (z. B. Next.js, DB etc.)
CMD ["devbox", "services", "up"]
