FROM python:3

# creating working directory 
RUN mkdir /usr/src/app

# set the working directory in the container
WORKDIR /usr/src/app

#set envionment variables
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

ONBUILD COPY ./requirements.* ./
ONBUILD RUN pip install -r ./requirements.txt; exit 0

COPY . .

ENTRYPOINT ["python3"]

# run from working directory
CMD ["python","./main.py"]