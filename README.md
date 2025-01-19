# requests-html-layer

[![DockerHub Link](https://img.shields.io/docker/pulls/tweedge/requests-html-layer)](https://hub.docker.com/repository/docker/tweedge/requests-html-layer)
[![License](https://img.shields.io/github/license/tweedge/requests-html-layer)](https://github.com/tweedge/requests-html-layer)
[![Written By](https://img.shields.io/badge/written%20by-some%20nerd-red.svg)](https://chris.partridge.tech)
[![Author Also Writes On](https://img.shields.io/mastodon/follow/108210086817505115?domain=https%3A%2F%2Fcybersecurity.theater)](https://cybersecurity.theater/@tweedge)

Python 3.12-slim with [Playwright](https://playwright.dev/python/docs/docker) and [requests-htmlc](https://github.com/cboin1996/requests-html) built in.

I couldn't get the original [requests-html](https://github.com/psf/requests-html) to work reliably - the original depends on [pyppeteer](https://github.com/pyppeteer/pyppeteer) but seems to [ignore pyppeteer environment variables])https://github.com/psf/requests-html/issues/387). For my case requests-htmlc works as a drop-in replacement.

Pretty large image. Works as a on-root user. Tested before push. Clone and build your own if you want stability or recency.