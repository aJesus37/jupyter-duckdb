# Jupyter DuckDB

A ready-to-use container that ships with configured JupyterLab and the required DuckDB bindings so that you can use DuckDB SQL inside Jupyter Notebooks.

## How to use

Simply run:

```bash
docker run -v $PWD:/workspace/data -p 8888:8888 ajesus37/jupyter-duckdb
```

This will spin up the jupyterlab web interface at https://127.0.0.1:8888 sharing the files inside the current working directory (`$PWD`) to the jupyter software.
There will be an `duckdb_init.ipynb` file at the `workspace` folder. Copy it's content to the `data` folder so that if you remove the container, you will still have the notebook.

After that, query with DuckDB using the `%sql` for single line or `%%sql` for multiline content.
Happy querying!