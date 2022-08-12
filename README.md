# Twitter_scrapper
This scrapper will help you extract all the tweets with the word "bitcoin" (for example) in real time and store them in a Json file via Docker. This Tutorial is beginners friendly. All ideas for improvement are welcome.

## First step : Installation

Install Docker Engine. Here is the documentation : https://docs.docker.com/get-docker/ .

## Second step : Dockerfile
- Create a Dockerfile using your text editor program that will install all dependencies from the snscrape github repository : https://github.com/JustAnotherArchivist/snscrape .

``` FROM python:latest
FROM python:latest
WORKDIR /root
RUN mkdir output
RUN pip install git+https://github.com/JustAnotherArchivist/snscrape.git
CMD snscrape --jsonl --progress --since 2021-09-05 twitter-search "bitcoin" \
		> output/bitcoin_twts.json
```
- Check if the Docker engine is running using the command line `$ docker info` or just `$ docker` in your terminal.

## Third step : Scrapping data from Twitter

- Create an image with the Dockerfile using the command line : `$ docker build --tag <name_of_theimage> .` .
- Run `$ docker images` to check if your image has been created properly.
- Run your image inside a container using : `$ docker run -d <name_of_theimage>`.
- Run `$ docker ps` to check if your container has been created properly and the ID of your container.

## Fourth step : Visualizing the scrappped data 

- Open a new terminal (side by side to your first terminal if you can).
- In your new terminal access the output file `$ cd ~/output`. It has been created in the same directory as your Dockerfile.
- In the new terminal run `$ tail -f bitcoin_twts.json` to visualize the last lines of the scrapped data.
- You can stop the process anytime you want by going back to your first terminal and running `$ docker stop <container_id>`.

