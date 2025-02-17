
# Streamlit Demo

This is the front-end / dashboard demo app for the DLUHC National Planning Applications API pilot. In production, this would connect directly to the planning applications database to retrieve and display data. Currently, generated example planning application data is used instead.

## Setup and Deployment

### Running the App Locally

The app can be run using the 'streamlit run' command targeting the entry point file.

`streamlit run Metrics_Overview.py`

Additional options are detailed here: https://docs.streamlit.io/library/advanced-features/configuration

### Deployment to Streamlit Community Cloud

The app can be deployed to Streamlit Community Cloud via GitHub: https://docs.streamlit.io/streamlit-community-cloud/deploy-your-app

This repository is structured according to the requirements for Streamlit deployment:
```
streamlit_demo/
├── .streamlit/
│   └── config.toml
├── Metrics_Overview.py
└── requirements.txt
├── pages/
│   └── 1_🌍_Location_by_Application_Type.py
│   └── 2_📊_Application_Type_Metrics.py
```
In this case, the entry point is the Metrics_Overview.py file - this also defined the content of the front page of the app. The 'pages' subdirectory is automatically identified and checked for additional pages.

### Custom Server Deployment

Other options for deploying Streamlit in other environments are listed here: https://docs.streamlit.io/knowledge-base/tutorials/deploy

To run a streamlit app on a generic server (for example, an AWS EC2 instance), it must be run in headless mode. This can be accomplished in two ways. Headless mode can be specified in config.toml:
```
[server]
headless = true
```
Headless mode can also be used by modifying the run command:
```
streamlit run Metrics_Overview.py --server.headless true
```

### Containerized (Docker) Deployment

For another generic, portable option, Docker deployment is described here: https://docs.streamlit.io/knowledge-base/tutorials/deploy/docker

This can be achieved by adding a Dockerfile file to the base directory (streamlit_demo), with the contents:

```
# streamlit_demo/Dockerfile

FROM python:3.12

WORKDIR /streamlit_demo

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# replace with the actual repository URL
RUN git clone https://github.com/.../streamlit_demo.git .

RUN pip install -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "Metrics_Overview.py", "--server.port=8501", "--server.address=0.0.0.0"]

```
### Connecting to a PostgreSQL Database

Database information must be added to .streamlit/secrets.toml: https://docs.streamlit.io/knowledge-base/tutorials/databases/postgresql
```
# .streamlit/secrets.toml

[connections.postgresql]
dialect = "postgresql"
host = "localhost"
port = "5432"
database = "xxx"
username = "xxx"
password = "xxx"
```