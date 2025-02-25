FROM openlabs/docker-wkhtmltopdf:latest
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

# Install dependencies for running web service
RUN apt-get update \
	&& apt-get install -y python-pip \
	&& pip install werkzeug executor gunicorn \
	&& rm -rf /var/lib/apt/lists/*

ADD app.py /app.py
EXPOSE 80

ENTRYPOINT ["usr/local/bin/gunicorn"]

# Show the extended help
CMD ["-b", "0.0.0.0:80", "--log-file", "-", "app:application"]
