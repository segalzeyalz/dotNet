# Start with a base image that includes the .NET runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Copy the output of your dotnet publish command to the Docker image
COPY bin/Release/net6.0/publish/ app/

# Expose the port that your .NET application listens on
EXPOSE 80

# Set the working directory to the directory where the .NET application is copied to
WORKDIR /app

# Set the entrypoint to the command that starts your .NET application
ENTRYPOINT ["dotnet", "myapp.dll"]
