FROM python:latest
WORKDIR /root
RUN mkdir output
RUN pip install git+https://github.com/JustAnotherArchivist/snscrape.git
CMD snscrape --jsonl --progress --since 2021-09-05 twitter-search "bitcoin" \
		> output/bitcoin_twts.json
