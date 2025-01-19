FROM python:3.12-bookworm

# system level installs to get playwright, chromium, etc. + nonroot user + copy browsers to nonroot
RUN pip install playwright && \
    playwright install --with-deps && \
    useradd -ms /bin/bash nonroot && \
    mv /root/.cache/ /home/nonroot/.cache/ && \
    chown -R nonroot:nonroot /home/nonroot/.cache/

# switch to nonroot user and apply all the environment variables we need for local packages
USER nonroot
WORKDIR /home/nonroot
ENV PATH="$PATH:/home/nonroot/.local/bin"

# user-level installs
# installed 'real' but unnecessary package for testing (cost: a few kb)
RUN pip install requests-htmlc pytest && \
    pip install --no-deps pypi-examiner && \
    cd /home/nonroot && \
    git clone https://github.com/tweedge/pypi-examiner && \
    rm -rf pypi-examiner/.git

# set test entrypoint (...will need to be overrode anyway by downstream images)
ENTRYPOINT ["pytest", "/home/nonroot/pypi-examiner"]