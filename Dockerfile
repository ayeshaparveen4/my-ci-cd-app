FROM python:3.12-slim AS test

WORKDIR /app

COPY app.py test_app.py requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
RUN pytest -q


FROM python:3.12-slim AS app

WORKDIR /app

COPY app.py .

EXPOSE 8000

CMD ["python", "app.py"]