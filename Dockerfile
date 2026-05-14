FROM pytorch/pytorch:2.7.0-cuda12.8-cudnn9-runtime

RUN pip install --no-cache-dir \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    transformers \
    datasets

WORKDIR /workspace

EXPOSE 8888

CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=${JUPYTER_TOKEN:-}"]
