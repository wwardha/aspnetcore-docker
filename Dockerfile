FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM microsoft/dotnet:2.1-aspnetcore
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet","AspNetCoreOnDocker.dll"]
