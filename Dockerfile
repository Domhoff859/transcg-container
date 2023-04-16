FROM  pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libhdf5-10 \
        libhdf5-serial-dev \
        libhdf5-dev \
        libhdf5-cpp-11 \
        libopenexr-dev \
        zlib1g-dev \
        openexr

# maybe we also have a requirements.txt file
COPY ./requirements.txt /workspace/requirements.txt
RUN pip install -r requirements.txt
COPY ./src /workspace/src

ENTRYPOINT ["python"]
CMD ["/workspace/src/main.py"] 
