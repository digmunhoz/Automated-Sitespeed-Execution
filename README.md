# Automated Sitespeed Execution

This project has as an objective help you to execute sitespeed against your pages in a simple way.

The process will run using `Docker` and `Make` commands.

## Prerequisites

All you need is to have [`Docker`](https://docs.docker.com/install/) and [`Docker Compose`](https://docs.docker.com/compose/install/).

## Confs

All configuration options must be defined in the [config.json](./config.json) file.

All options available are described [here](https://www.sitespeed.io/documentation/sitespeed.io/configuration/)

The config below is the basic one to run `sitespeed` and generate HTML report.

```
{
  "browsertime": {
    "iterations": 1,
    "browser": "chrome",
    "video": false
  },
  "crawler": {
    "depth": 1
  },
  "utc": true
}
```

## Reports

All reports will be seated on `./data/sitespeed-result/` directory

> The project supports databases such as InfluxDB and StatsD. See how to configure it [here](https://www.sitespeed.io/documentation/sitespeed.io/configuration/).

## Running the process

1. First of all, rename the file `urls_example.txt` to `urls.txt`
2. After that, insert all webpages you want to generate report in each line
3. Finally, execute the `make run` command: 

The third step will generate an output like that:

```
[Running project...]

Google Chrome 73.0.3683.75 
Mozilla Firefox 66.0
[2019-04-09 14:02:30] INFO: Versions OS: linux 4.9.125-linuxkit nodejs: v10.13.0 sitespeed.io: 8.8.3 browsertime: 4.5.3 coach: 3.3.0
[2019-04-09 14:02:30] INFO: Running tests using Chrome - 1 iteration(s)
[2019-04-09 14:02:32] INFO: Testing url https://google.com.br iteration 1
[2019-04-09 14:02:48] INFO: https://google.com.br 18 requests, 369.09 kb, backEndTime: 424ms, firstPaint: 594ms, firstVisualChange: 600ms, DOMContentLoaded: 702ms, Load: 1.40s, speedIndex: 726, visualComplete85: 733ms, lastVisualChange: 6.70s, rumSpeedIndex: 624
[2019-04-09 14:02:50] INFO: HTML stored in /sitespeed.io/sitespeed-result/google.com.br/2019-04-09-14-02-30
```

Now, you are able to open the index.html file created in `./data/sitespeed-result/` to see the report.

## Grafana Dashboard

If you are using some of those databases, you can create dashboards using the default Grafana's JSON file [here](https://github.com/sitespeedio/grafana-bootstrap-docker/tree/master/dashboards)

## Authors

* **Diogo Munhoz Fraga** - [digmunhoz](https://github.com/digmunhoz)