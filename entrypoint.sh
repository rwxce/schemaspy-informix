#!/bin/sh
set -e

# If a template exists, substitute environment variables and create the final file
if [ -f /schemaspy.properties.template ]; then
  envsubst < /schemaspy.properties.template > /schemaspy.properties
fi

# If the INFORMIX_SERVER variable exists and wasn't passed, add it to the arguments
has_server=false
for arg in "$@"; do
  if [ "$arg" = "-server" ]; then
    has_server=true
    break
  fi
done

if [ -n "$INFORMIX_SERVER" ] && [ "$has_server" = false ]; then
  set -- "$@" -server "$INFORMIX_SERVER"
fi

# Run SchemaSpy
exec java -jar /usr/local/lib/schemaspy/schemaspy-app.jar "$@"