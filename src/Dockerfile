FROM mcr.microsoft.com/dotnet/core/runtime:2.2-stretch-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["src/PrivateGalleryCreator.csproj", "src/"]
RUN dotnet restore "src/PrivateGalleryCreator.csproj"
COPY . .
WORKDIR "/src/src"
RUN dotnet build "PrivateGalleryCreator.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "PrivateGalleryCreator.csproj" -c Release -o /app

FROM base AS final
WORKDIR /feed
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "PrivateGalleryCreator.dll", "--input=/feed", "--output=/feed/mdev.xml", "--source=/", "-w"]