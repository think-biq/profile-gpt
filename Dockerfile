# python-ffmpeg
FROM python:3.9.16-buster
# Wer nicht fragt, bleibt dumm.
RUN apt-get update
RUN apt-get install -y make
RUN python3 -m pip install -U pip

# Prepare run env
RUN mkdir -p /app


# Copy necessary files
COPY etc /app/etc
COPY images /app/images
COPY share /app/share
COPY dashboard.py /app
COPY requirements.txt /app
RUN ls -lav .

# Requirements
RUN python3 -m pip install -r /app/requirements.txt

# Run
WORKDIR /app
RUN ls -lav
CMD streamlit run dashboard.py