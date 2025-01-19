FROM python:3.12-bookworm

RUN pip install playwright && \
    playwright install --with-deps && \
    pip install requests-htmlc pytest && \
    pip install --no-deps pypi-examiner && \
    cd /opt && \
    git clone https://github.com/tweedge/pypi-examiner && \
    rm -rf pypi-examiner/.git

ENTRYPOINT ["pytest", "/opt/pypi-examiner"]