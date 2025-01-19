FROM python:3.12-bookworm

RUN pip install playwright && \
    playwright install --with-deps && \
    useradd -ms /bin/bash nonroot

USER nonroot
WORKDIR /home/nonroot

RUN pip install requests-htmlc pytest && \
    pip install --no-deps pypi-examiner && \
    cd /home/nonroot && \
    git clone https://github.com/tweedge/pypi-examiner && \
    rm -rf pypi-examiner/.git

ENV PATH="$PATH:/home/nonroot/.local/bin"

ENTRYPOINT ["pytest", "/home/nonroot/pypi-examiner"]