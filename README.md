 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-cdc-sample)
 
# iris-cdc-sample
This is a sample for CDC (change data capture) using SQL Service, Kafka Operation and Columnar database to demonstrate the IRIS realtime features for ETL/Analytics projects


## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/iris-cdc-sample.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```


## How to Run the Sample

Open the [production](http://localhost:52795/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.Demo.Production) and start it.
It will start gathering news from reddit.com/new/ and filter it on cats and dogs into /output/Dog.txt or /output/Cat.txt files.

You can alter the [business rule](http://localhost:52795/csp/user/EnsPortal.RuleEditor.zen?RULE=dc.Demo.FilterPostsRoutingRule) to filter for different words, or to use an email operation to send posts via email.
<img width="1123" alt="Screenshot 2020-10-29 at 20 05 34" src="https://user-images.githubusercontent.com/2781759/97607761-77707100-1a22-11eb-9ce8-0d14d6f6e315.png">

## How to alter the template
Use the green    "Use this template" button on Github to copy files into a new repository and build a new IRIS interoperability solution using this one as an example.

This repository is ready to code in VSCode with the ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.

Use the handy VSCode menu to access the production and business rule editor and run a terminal:
<img width="656" alt="Screenshot 2020-10-29 at 20 15 56" src="https://user-images.githubusercontent.com/2781759/97608650-aa673480-1a23-11eb-999e-61e889304e59.png">


## environment variables usage

this example shows how you can introduce env variables in your dev environment.
Suppose you need to setup the production with some secret token to access a limited access API.
Of course you don't want to expose the secret to GitHub.
In this case Env variables mechanism could be helpful.
First introduce .env file and setup [.gitignore](https://github.com/intersystems-community/iris-interoperability-template/blob/0f0b932a971a2d8af49ce9e3d686042cec97c621/.gitignore) to filter .env from git.

Then add the secret token in .env in a form ENV_VARIABLE="TOKEN VALUE"

Next introduce make environment variables be imported to dockerfile. to make it work add the environment section into [docker-compose.yml](https://github.com/intersystems-community/iris-interoperability-template/blob/d2d7114de7c551e308e742359babebff5d535821/docker-compose.yml), .e.g:
```
environment:
      - SAMPLE_TOKEN=${SAMPLE_TOKEN}
```
Then you'll be able to init the running container with the data from env variables e.g. with the following call, which uses the value from .env file as a setting of the production:
```
USER> d ##class(dc.Demo.Setup).Init($system.Util.GetEnviron("SAMPLE_TOKEN"))
```

## package manager production parameters

the users (not developers) of the module you developed can use parameters to pass to the module during installation and setup it.
it can be useful when setup parameters are secret tokens to access particular API.
You as a developer can provide such a parameter setting with default tag of module XML, e.g. it is done in this [module.xml](https://github.com/intersystems-community/iris-interoperability-template/blob/8cbe3ee1f2eafd2017cfdd59b469dbee8bf2d884/module.xml) example:
```
<Default Name="SampleToken" Value="TokenValue" />
```

This default parameter lets users to call the installation of the package with the option of passing of parameter (SampleToken in this case). E.g. the installation call could be run as:
```
USER>zpm "install interoperability-sample -D SampleToken=TokenSecretValue"
```
And the token value is being used then to setup the production in the following call:
```
<Invoke Class="dc.Demo.Setup" Method="Init" >
         <Arg>${SampleToken}</Arg>
      </Invoke>
```

