FROM python:3.13.0

WORKDIR /usr/src/app

COPY app.py efficientnet-lite4-11-int8.onnx labels_map.txt requirements.txt ./
COPY web web

RUN apt-get update && apt-get install -y libgl1
RUN pip install -r requirements.txt

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000
CMD ["flask", "run"]
