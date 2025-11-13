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

<b>Pay Attention, check if all containers are on (green), before run the sample:</b>


1. Open the [production](http://localhost:52795/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.cdc.CDCProduction) and start it.

2. See the data loaded into dc_cdc.Sales executing: 
```
SELECT 
ID, ProductName, SalesValue, StoreName
FROM dc_cdc.Sales
```

3. See the data sent to Kafka accessing http://localhost:8080/ui/clusters/local_kafka_cluster/all-topics/sales-topic/messages?keySerde=String&valueSerde=String&limit=100

4. Open the BAM dashboard to see sales dashboard at realtime: http://localhost:52795/csp/user/_DeepSee.UserPortal.DashboardViewer.zen?DASHBOARD=BAMDashboard.dashboard

5. Insert new rows into dc_cdc.Sales and view the dashboard with up to date results.
