FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as buildStage
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /deploy
COPY --from=buildStage /app/out .
ENTRYPOINT ["dotnet","AthleteEventAPI.dll"]