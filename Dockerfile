FROM python:3.7-alpine
RUN echo $CREDS >> /opt/creds
ENV GOOGLE_APPLICATION_CREDENTIALS=/opt/creds
ENV FLASK_APP=api/__init__.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers g++ python3-dev
COPY . .
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install grpcio
RUN pip install -r api/requirements.txt
EXPOSE 5000
CMD ["flask", "run"]
