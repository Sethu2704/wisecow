# Use a lightweight base image with bash and netcat
FROM ubuntu:22.04

# Set environment variable for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y bash netcat cowsay fortune-mod && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH (fortune is located here)
ENV PATH="$PATH:/usr/games"

# Set working directory
WORKDIR /app

# Copy your script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the server port
EXPOSE 4499

# Run the script when the container starts
CMD ["./wisecow.sh"]
