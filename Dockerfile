FROM asc686f61/fx-mt5:20241116
WORKDIR /root/.wine/drive_c/
RUN apt-get update && apt-get install

# Install Conda
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O miniforge.sh \
    && chmod +x miniforge.sh \
    && bash miniforge.sh -b -p /opt/conda \
    && rm miniforge.sh

RUN conda --version
RUN pip3 install PythonMetaTrader5


COPY install.sh /root/.wine/drive_c/
COPY setup-python.sh /root/.wine/drive_c/
RUN chmod +x /root/.wine/drive_c/install.sh
RUN chmod +x /root/.wine/drive_c/setup-python.sh

COPY /script /root/.wine/drive_c/script
COPY installer/*.exe /root/.wine/drive_c/installer/

# CMD ["./install.sh"]
# ENTRYPOINT ["bash", "-c", "./install.sh && tail -f /dev/null"]
RUN xvfb-run bash ./install.sh || true
RUN ./setup-python.sh

# RUN xvfb-run bash ./install.sh || true
# CMD ["cd "]

