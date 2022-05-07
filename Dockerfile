FROM python:3.7-slim-buster

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

#RUN apt-get update \
#&& apt-get install gcc -y \
#&& apt-get clean

COPY . /code

RUN chmod +x /code/src

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# ENV PATH="${PATH}:/code"
EXPOSE 8005

WORKDIR /code/src

ENV PYTHONPATH "${PYTHONPATH}:/code/src"

# RUN pip install --no-cache-dir --upgrade -r requirements.txt

#ENTRYPOINT ["python"]

#CMD ["uvicorn", "app.main:app", "--reload", "--proxy-headers", "--host", "0.0.0.0", "--port", "8005"]

# CMD ["pip", "install", "-e", "."]
CMD pip install -e .
# CMD ["pytest -v --junitxml TestResults.xml --cache-clear"]


