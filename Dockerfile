FROM python:latest
WORKDIR /root
RUN mkdir output
RUN pip install git+https://github.com/JustAnotherArchivist/snscrape.git
CMD ["tail", "-f", "/dev/null"]
