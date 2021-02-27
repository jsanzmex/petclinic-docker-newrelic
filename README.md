# Spring's Pet Clinic, integration with Docker & New Relic

## Background

This project leverages the power of Docker to easily rollout an instance of Spring's Pet Clinic.

The Docker image has been designed to be monitored using the latest version of **New Relic Java Agent**.

The JVM configuration is defined at *bundle.sh*. The *javaagent* attribute used to monitor Java applications is in this file. In case you want to add more configurations to New Relic's Java Agent you can do it here.

## How to Use this Project

Starting this container is very easy:

1. Make sure you have Docker installed.
2. Open a new [Terminal/Command Line] and define the following variables
```
$ export NEWRELIC_APP_NAME=#YOUR APP NAME GOES HERE#
$ export NEWRELIC_LICENSE_KEY=#YOUR LICENSE KEY GOES HERE#
```
3. Start the container with "start.sh" script
```
$ ./start.sh
```

## Creating traffic with ```robot.sh```

Send traffic to the application executing
```
$ ./robot.sh
```

There is a DELAY variable inside this file to manipulate the frequency of the robot. 
