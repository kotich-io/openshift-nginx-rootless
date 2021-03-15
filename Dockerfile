FROM nginx:1.19.6
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /var/cache/nginx/client_temp
WORKDIR /app
RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d 
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
EXPOSE 8080
USER nginx
CMD nginx -g 'daemon off;'
