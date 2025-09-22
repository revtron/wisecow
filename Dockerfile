FROM ubuntu:24.04

# Install prerequisites
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH so fortune is found
ENV PATH="/usr/games:${PATH}"

# Copy script
WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["/app/wisecow.sh"]

































