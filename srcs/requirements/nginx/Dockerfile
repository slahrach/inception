# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: slahrach <slahrach@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/10 06:16:36 by slahrach          #+#    #+#              #
#    Updated: 2023/08/08 14:58:54 by slahrach         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Start with a minimal base image (e.g., debian)
FROM debian:stable

# Install necessary packages (NGINX, OpenSSL)
RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y openssl

# Copy your custom NGINX configuration file depending on the actual path
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx

# Generate a self-signed SSL certificate and private key
RUN mkdir -p /etc/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt -subj "/CN=localhost"

# Expose ports (443 only)
EXPOSE 443

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
