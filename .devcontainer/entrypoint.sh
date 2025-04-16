#!/bin/bash

# Fix Snowflake CLI config permissions if the file exists
if [ -f "$SNOWFLAKE_HOME/config.toml" ]; then
    chmod 0600 "$SNOWFLAKE_HOME/config.toml"
fi

if [ -f "$SNOWFLAKE_HOME/connections.toml" ]; then
    chmod 0600 "$SNOWFLAKE_HOME/connections.toml"
fi

# Execute the container's main process
exec "$@"