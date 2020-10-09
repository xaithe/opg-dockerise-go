# Background

Our production environments utilise AWS cloud platform with the infrastructure being created and controlled by Hashicorp's Terraform. Our deployment process takes the app code repository, generates a series of docker images which are then placed into AWS Elastic Cluster Service.

# Task

This repository contains a Go application (with `./app` folder) that acts as an API; it is configured to respond on port `8080` and has two endpoints (`/` and `/status`) that return `json` content.

The `/status` endpoint returns different content and `http` response code depending on the value of an environment variable called `APP_STATUS`. When `APP_STATUS=OK` the `/status` endpoint will return a `200` code and message, otherwise if will return a `500` code.

We would like you to create a fork of this repository which expands this code to provide a way to create a working docker image from this application with both endpoints returning successful response codes.

Please include an updated README with steps to produce and run the docker image.

**Do not worry if you are not able to fully complete the task, we are more interested in your approach then a perfect solution.**


## Outline

To help guide you in this task, we've outlined some typical steps (in no particular order) that would be needed.

- Creating a Dockerfile
- Building the Go app
- Mapping ports
- Setup Docker on your local machine
- Passing environment variable
