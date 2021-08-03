#!/bin/sh

if [ ! -f "/config/config.toml" ]; then
    cp /app/config.toml.example /config/config.toml
fi

/app/server -config /config/config.toml
