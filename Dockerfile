# FROM python:3.13
FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install gunicorn
RUN pip install -r requirements.txt
ENV PORT=8080
## JSON arguments recommended for CMD to prevent unintended behavior related to OS signals
# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app
CMD ["sh", "-c", "exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app"]
