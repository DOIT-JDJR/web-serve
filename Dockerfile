# FROM gcc:5.5

FROM python:2.7-slim

ENV WEB_HOME /root/jdjr

ENV PYTHON Debug

VOLUME ${WEB_HOME}/datalog

WORKDIR $WEB_HOME

ADD requirements.txt $WEB_HOME/requirements.txt

RUN apt-get update && apt-get install -y gcc unixodbc-dev
RUN pip install -r requirements.txt

ADD . ${WEB_HOME}

# ADD . /jdjrweb ${WEB_HOME}/jdjrweb
# ADD . /jrweb ${WEB_HOME}/jrweb
# ADD . /spider ${WEB_HOME}/spider
# ADD . /

# COPY ["requirements.txt", "./"]
# COPY ["db.sqlite3", "./"]
# COPY ["", "./"]

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]