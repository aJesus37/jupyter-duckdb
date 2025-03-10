FROM python:3.11-slim

WORKDIR /workspace

# Install only the required packages
RUN pip install --no-cache-dir \
    jupyterlab \
    duckdb \
    jupysql \
    pandas \
    matplotlib \
    duckdb-engine

# Create jupyter config and settings directories
RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/ \
    && mkdir -p /root/.jupyter/lab/settings/


# Create necessary directories
RUN mkdir -p /usr/local/share/jupyter/lab/settings/

# Generate jupyter config
RUN jupyter lab --generate-config && \
    echo "c.ServerApp.token = ''" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.password = ''" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_root = True" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_server_config.py

COPY overrides.json /usr/local/share/jupyter/lab/settings/overrides.json

# Expose JupyterLab port
EXPOSE 8888

COPY duckdb_init.ipynb /workspace/duckdb_init.ipynb

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
