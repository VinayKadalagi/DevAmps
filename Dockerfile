FROM python:3.7-alpine
ENV FLASK_APP=api/flask-redis.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY . .
RUN pip install -r api/requirements_redis.txt
EXPOSE 5000
CMD ["flask", "run"]
