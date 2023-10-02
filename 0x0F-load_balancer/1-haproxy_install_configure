#!/bin/bash

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install HAProxy
sudo apt install -y haproxy

# Configure HAProxy
haproxy_config="
global
    log /dev/log local0
    log /dev/log local1 notice
    user haproxy
    group haproxy
    daemon

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000
    timeout client  50000
    timeout server  50000

frontend main
    bind *:80
    default_backend servers

backend servers
    balance roundrobin
    server web-01 [380597]-web-01:80 check
    server web-02 [380597]-web-02:80 check
"

echo "$haproxy_config" | sudo tee /etc/haproxy/haproxy.cfg > /dev/null

# Restart HAProxy
sudo systemctl restart haproxy

# Enable HAProxy init script
sudo systemctl enable haproxy
