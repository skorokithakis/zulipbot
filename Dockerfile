FROM python:3.10

RUN pip install --pre -U pip poetry
ADD poetry.lock /code/
ADD pyproject.toml /code/
RUN poetry config virtualenvs.create false

WORKDIR /code
RUN poetry install --no-interaction --no-root

ADD * /code/

RUN mkdir /database/
WORKDIR /database/

CMD /code/zulipbot
