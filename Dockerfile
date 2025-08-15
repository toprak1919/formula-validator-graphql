# Root Dockerfile for Koyeb deployment
# This file helps Koyeb detect the Docker-based deployment

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy backend project files
COPY backend/FormulaValidatorAPI/*.csproj ./FormulaValidatorAPI/
COPY backend/FormulaValidatorAPI.Tests/*.csproj ./FormulaValidatorAPI.Tests/
RUN dotnet restore FormulaValidatorAPI/FormulaValidatorAPI.csproj

# Copy backend source code and build
COPY backend/ .
WORKDIR /app/FormulaValidatorAPI
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Koyeb uses PORT environment variable
EXPOSE 8000

# Configure ASP.NET Core to use PORT from environment
ENV ASPNETCORE_URLS=http://+:${PORT:-8000}

# Run the application
ENTRYPOINT ["dotnet", "FormulaValidatorAPI.dll"]