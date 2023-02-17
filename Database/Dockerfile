FROM mcr.microsoft.com/mssql/server:2017-latest
LABEL author=Greytsu
LABEL name=sqlserver

COPY entrypoint.sh entrypoint.sh
COPY SqlCmdScript.sql SqlCmdScript.sql
COPY SqlCmdStartup.sh SqlCmdStartup.sh
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Pass@word

EXPOSE 1433

CMD /bin/bash ./entrypoint.sh