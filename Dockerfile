FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

COPY src/*.sln
COPY src/Mapper/*.csproj ./Mapper
RUN dotnet restore

COPY src/Mapper/. ./Mapper
WORKDIR /app/Mapper
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/Mapper/out ./
ENTRYPOINT ["dotnet", "Mapper.dll"]
