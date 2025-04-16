# Base image
FROM mcr.microsoft.com/vscode/devcontainers/python:3.11
LABEL maintainer="Enrique Plata"

# Set environment variables
ENV APP_HOME=/usr/src/app
ENV SNOWFLAKE_HOME=/workspaces/codespace_sample/.snowflake
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Update the package lists for upgrades for packages that need upgrading, as well as new packages that have just come to the repositories
RUN apt-get update && \
    apt-get install -y locales gcc && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    echo LANG=en_US.utf8 > /etc/default/locale && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy and run snowcli.sh during build
COPY snowcli.sh /tmp/snowcli.sh
RUN chmod +x /tmp/snowcli.sh && /tmp/snowcli.sh

# Used by Snowflake CLI: set proper permissions on config.toml if it exists
RUN if [ -f "$SNOWFLAKE_HOME/config.toml" ]; then chmod 0600 "$SNOWFLAKE_HOME/config.toml"; fi

# Copy the entrypoint script and mark it executable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Execute the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
