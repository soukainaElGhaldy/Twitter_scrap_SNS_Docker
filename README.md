# Twitter_scrapper
This scrapper will help you extract all the tweets with the word "bitcoin" (for example) in real time and store them in a Json file via Docker. This Tutorial is beginners friendly. All ideas for improvement are welcome.

## First step : Installation

Install Docker Engine. Here is the documentation : https://docs.docker.com/get-docker/ .

## Second step : Dockerfile
- Create a Dockerfile using your text editor program that will install all dependencies from the snscrape github repository : https://github.com/JustAnotherArchivist/snscrape .

``` FROM python:latest
WORKDIR /root
RUN mkdir output
RUN pip install git+https://github.com/JustAnotherArchivist/snscrape.git
CMD ["tail", "-f", "/dev/null"]
```
- Check if the Docker engine is running using the command line `$ docker info` or just `$ docker` in your terminal.

## Third step : Accessing the Docker container

- Create an image with the Dockerfile using the command line : `$ docker build --tag <name_of_theimage> .` .
- Run `$ docker images` to check if your image has been created properly.
- Run your image inside a container using : `$ docker run -d <name_of_theimage>`.
- Run `$ docker ps` to check if your container has been created properly.
- Use `$ docker exec -it <container_id> /bin/bash` to access your container.

## Fourth step : Scrapping data from Twitter

- Run `$ snscrape --jsonl --progress --since 2022-01-01 twitter-search "bitcoin" > output/bitcoin_twts.json` to extract all tweets since 1st of January 2022 that include the word "bitcoin" and store the output in a Json file called `bitcoin_twts.json`.
- You can stop the extraction process anytime using `Ctrl-C`.
- Detach from the docker container without stopping it by : Pressing `Ctrl-P`, followed by `Ctrl-Q`.
- Copy the data file from the container to the computer host using the command :

`$ docker cp <container_id>:/root/output  /host/path/target`

- Don't forget to stop your container when you're done : `$ docker stop <container_id>`.

