# recondroid

[Droneci][] is a neat little continuous integration tool that scans your images for vulnerabilities.

## Requirements

You'll need:

* a DigitalOcean account

* a domain name registered with DO

## Inputs

* environment variable `DIGITALOCEAN\_TOKEN` defined for api access

* DigitalOcean ssh key id

* domain name managed by DigitalOcean

* Github OAuth app id and secret

## Outputs

You'll get:

* a drone ci server url

## Usage

* Run terraform plan and terraform apply

* Visit the drone ci server url and acknowledge the drone app

* Use the drone app
