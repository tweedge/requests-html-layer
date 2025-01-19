FROM python:3.12-bookworm

RUN pip install playwright && \
    playwright install --with-deps && \
    pip install requests-htmlc pytest && \
    pip install --no-deps pypi-examiner && \
    git clone https://github.com/tweedge/pypi-examiner /opt

RUN ["pytest", "/opt/pypi-examiner"]