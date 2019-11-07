FROM python:3.7

# Needed for something...
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN pip install pipenv

WORKDIR /code

COPY Pipfile /code/
COPY Pipfile.lock /code/

# Install both default and dev packages so that we can run the tests against this image
RUN pipenv install --dev --ignore-pipfile --system --deploy

ADD . /code/

CMD ["gunicorn", "app:app"]
