FROM python:3.12-bookworm

RUN pip install playwright && \
    playwright install --with-deps && \
    adduser --system --no-create-home nonroot

USER nonroot

RUN pip install requests-htmlc pytest && \
    pip install --no-deps pypi-examiner && \
    cd /home/nonroot && \
    git clone https://github.com/tweedge/pypi-examiner && \
    rm -rf pypi-examiner/.git

ENTRYPOINT ["pytest", "/home/nonroot/pypi-examiner"]