FROM python:3.8-slim

WORKDIR /code

COPY . /code/

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "./src/hello.py"]