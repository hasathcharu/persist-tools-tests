
FROM mcr.microsoft.com/mssql/server:2019-latest

RUN mkdir -p /var/opt/mssql/init
COPY init.sql /var/opt/mssql/init

ENV MSSQL_SA_PASSWORD=Test123#
ENV ACCEPT_EULA=Y

CMD /opt/mssql/bin/sqlservr & sleep 30  && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Test123#' -d master -i /var/opt/mssql/init/init.sql && echo 'READY' && sleep infinity