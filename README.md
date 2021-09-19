# Introduktion containers till AR 

## Historik 
     
   * deployment till Järn
   * deployment till VM
   * deployment till Containers , API

## Vad är en Container
Ett Operativ System består förenklat av 2 delar kärnan (core) som kommunicerar med hårdvaran.  App delen kommunicerar med core. 
Skillnaden mellan container och vm 
Container emulerar OS Appdel 
VM emulerar båda delarna , appdel och core. Tar mer resurser. 
	
Container är som en tårtbit med många lager.
OS i botten.  

## Demo 1 DB2 databas med schema och data 

inspiration från [https://github.com/rikkyrice/setup-db2-container](https://github.com/rikkyrice/setup-db2-container)


### Dockerfile 

**Bygga image**

```
cd db2_demo
docker build -t ardemo-db:v1.0 .
```

**Start container**
```
docker run --name ardemo-db --restart=always --detach --privileged=true -p 50000:50000 --env-file env.list ardemo-db:v1.0
```

**Starta interaktiv session mot container** 

```
docker exec -it ardemo-db bash -c "su - db2inst1"
```

   

   
   Ladda ner image
	docker pull ibmcom/db2

   docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=kalleanka -e DBNAME=testdb -v db2data/database ibmcom/db2

   access till container
   docker exec -ti mydb2 bash -c "su - ${DB2INSTANCE}"

   export PATH="$HOME/bin:$PATH:/opt/ibm/db2/V11.5/bin"
   export PATH=/database/config/db2inst1/sqllib/bin/:$PATH
   db2 connect to testdb user db2inst1 using kalleanka

   db2cli execsql -connstring "database=TESTDB;hostname=bf0da6187e16;port=50000;uid=DB2INST1;pwd=kalleanka"


## Utvecklingsloopen processen

  * utveckla
  * testa lokalt
  * deployment till test/prod


## Demo 2 

