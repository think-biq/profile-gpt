# python-ffmpeg
FROM python:3.9.16-buster
# Wer nicht fragt, bleibt dumm.
RUN apt-get update
RUN apt-get install -y make
RUN python3 -m pip install -U pip

# python-requirements
RUN mkdir -p /app
COPY requirements.txt /app
RUN python3 -m pip install -r /app/requirements.txt

# web
COPY src/ /app/src
RUN ls -lav .

# app
WORKDIR /app
RUN ls -lav
CMD streamlit run dashboard.py