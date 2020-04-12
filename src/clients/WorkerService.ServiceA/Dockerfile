FROM mcr.microsoft.com/dotnet/core/runtime:3.1-buster-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["src/clients/WorkerService.ServiceA/WorkerService.ServiceA.csproj", "src/clients/WorkerService.ServiceA/"]
COPY ["src/DynamicConfig.Configuration/DynamicConfig.Configuration.csproj", "src/DynamicConfig.Configuration/"]
RUN dotnet restore "src/clients/WorkerService.ServiceA/WorkerService.ServiceA.csproj"
COPY . .
WORKDIR "/src/src/clients/WorkerService.ServiceA/"
RUN dotnet build "WorkerService.ServiceA.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WorkerService.ServiceA.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WorkerService.ServiceA.dll"]