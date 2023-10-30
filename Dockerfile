FROM python

WORKDIR /shopApp

ENV PYTHONUNBUFFERED 1

COPY backend .

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 8000 