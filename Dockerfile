FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./src/MyConsoleApp/MyConsoleApp.csproj ./OurConsoleApp/
# COPY ./tests/MyConsoleApp.Tests/MyConsoleApp.Tests.csproj ./MyConsoleApp.Tests/
RUN dotnet restore

# Copy everything else and build
COPY ./src/ ./MyConsoleApp/
# COPY ./tests/ ./MyConsoleApp.Tests/
WORKDIR /app/MyConsoleApp
RUN dotnet publish -c Release -o out
# Build runtime image
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app/MyConsoleApp/out ./
ENTRYPOINT ["dotnet", "MyConsoleApp.dll"]
