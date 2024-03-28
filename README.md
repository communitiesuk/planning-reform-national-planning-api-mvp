# planning-reform-national-planning-api-mvp
Building an MVP API that will sit inbetween the planning application submission and application management

# Built with Heroku

Heroku provides [its own detailed documentation](https://devcenter.heroku.com/articles/getting-started-with-python?singlepage=true#set-up)

# Heroku Logs

https://dashboard.heroku.com/apps/planning-reform-plan-api-mvp/logs

# Deployment

## Prerequisites
 - Need to be a part of the dluhc-digital heroku account
 - heroku cli
 - git cli

### Add the heroku git repo to your remote
 `git remote add heroku https://git.heroku.com/planning-reform-plan-api-mvp.git`

### Push to that remote specifically
`git push heroku <branch name>` e.g. `git push heroku main`

By default, git pushes to your origin:
`git push <branch name>` (which is the equivalent to `git push origin <branch name>`)

#### Example Deployment

```
git push heroku main
Enumerating objects: 34, done.
Counting objects: 100% (34/34), done.
Delta compression using up to 8 threads
Compressing objects: 100% (29/29), done.
Writing objects: 100% (34/34), 39.16 KiB | 4.89 MiB/s, done.
Total 34 (delta 3), reused 3 (delta 0), pack-reused 0
remote: Updated 18 paths from 4281b82
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Building on the Heroku-22 stack
remote: -----> Determining which buildpack to use for this app
remote: -----> Python app detected
remote: -----> Using Python version specified in runtime.txt
remote: -----> Installing python-3.12.2
remote: -----> Installing pip 23.3.2, setuptools 68.2.2 and wheel 0.42.0
remote: -----> Installing SQLite3
remote: -----> Installing requirements with pip

...

remote: -----> Discovering process types
remote:        Procfile declares types -> web
remote:
remote: -----> Compressing...
remote:        Done: 34.8M
remote: -----> Launching...
remote:        Released v5
remote:        https://planning-reform-plan-api-mvp-0e44662fd9e9.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/planning-reform-plan-api-mvp.git
* [new branch]      main -> main
```

# Local Setup

## Pre requisites

- Python 3.11+

## Setup virtual environment

### Create a Python Virtual Environment
`python -m venv .venv`

### Activate the virtual environment

On Mac
`source .venv/bin/activate`

On Windows
`source .venv/Scripts/activate`

### Install required packages
`pip install -r requirements.txt`

### Run the API
Run the following command in the root of this repository
`hypercorn -b 0.0.0.0:$PORT "app/main:app"`

### Testing the API
`curl --location 'localhost:8080/application' --header 'Content-Type: application/json'  --header 'Authorization: Bearer test' -d @test/sample.json`



