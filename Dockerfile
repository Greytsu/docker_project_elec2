# BASE--------------------------------------------------------------------------------
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch AS base
LABEL author=Greytsu
LABEL name=applicants
WORKDIR /app
EXPOSE 80 443

# BUILD-------------------------------------------------------------------------------
FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src

COPY ./Services ./Services
COPY ./Foundation/Events ./Foundation/Events

RUN dotnet restore Services/Applicants.Api/applicants.api.csproj
RUN dotnet build Services/Applicants.Api/applicants.api.csproj -c Release -o /app/build

# PUBLISH-----------------------------------------------------------------------------
FROM build AS publish 
RUN dotnet publish Services/Applicants.Api/applicants.api.csproj -c Release -o /app/build

# FINAL-------------------------------------------------------------------------------
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT [dotnet, /app/applicants.api.dll]