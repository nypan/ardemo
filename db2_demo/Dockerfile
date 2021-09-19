FROM ibmcom/db2
RUN mkdir /var/custom
RUN mkdir /var/custom/sql
RUN mkdir /var/custom/data
COPY ./sql/*.sql /var/custom/sql/
COPY ./data/*.csv /var/custom/data/
COPY ./create_schema.sh /var/custom/
RUN chmod 444 /var/custom/sql/*.sql
RUN chmod 444 /var/custom/data/*.csv
RUN chmod a+x /var/custom/create_schema.sh