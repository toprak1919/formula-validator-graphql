# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files
COPY FormulaValidatorAPI/*.csproj ./FormulaValidatorAPI/
COPY FormulaValidatorAPI.Tests/*.csproj ./FormulaValidatorAPI.Tests/
RUN dotnet restore FormulaValidatorAPI/FormulaValidatorAPI.csproj

# Copy everything else and build
COPY . .
WORKDIR /app/FormulaValidatorAPI
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Koyeb uses PORT environment variable (default 8000)
EXPOSE 8000

# Set environment variable for ASP.NET Core to use PORT from environment
ENV ASPNETCORE_URLS=http://+:${PORT:-8000}

# Run the application
ENTRYPOINT ["dotnet", "FormulaValidatorAPI.dll"]