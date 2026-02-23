# Cloud Run (x86_64): weights in image, listen on PORT
FROM tensorflow/tensorflow:1.15.0-py3

WORKDIR /app

RUN pip install --no-cache-dir "keras>=2.0.8,<2.3" Flask flask-cors Pillow scikit-image matplotlib h5py waitress
RUN pip install --no-cache-dir 'protobuf>=3.19,<4'

COPY application.py run.py ./
COPY mrcnn ./mrcnn/
COPY weights/ ./weights/

ENV PORT=8080
EXPOSE 8080

CMD ["python", "run.py"]