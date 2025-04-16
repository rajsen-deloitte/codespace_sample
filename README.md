# Welcome to Your Workspace

Before starting, please run the following command in your terminal to ensure the security of your Snowflake configuration file:

```sh
chmod 0600 ./.snowflake/config.toml
chmod 0600 ./.snowflake/connections.toml
```

**IMPORTANT**: 
Make sure to input your Snowflake credentials in the file:  

```sh
./.snowflake/connections.toml  
```

**Double-check** each detail carefully as incorrect credentials may lead to a temporary lockout due to repeated connection attempts.
