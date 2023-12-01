FROM nginx:stable-alpine

# Copy the static content to the container
COPY styles.css /usr/share/nginx/html/css/styles.css
COPY demo.html /usr/share/nginx/html/index.html

# Run Nginx as non-root user
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /usr/share/nginx/html

USER nginx