FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /godot

ARG GODOT_ENGINE_ZIP_FILE=Godot_v4.2-beta3_mono_linux_x86_64.zip

COPY $GODOT_ENGINE_ZIP_FILE ./
COPY check_checksum.sh ./

RUN apt update && apt install wget coreutils

# download checksums to check that godot engine is correct
RUN chmod +x check_checksum.sh && ./check_checksum.sh $GODOT_ENGINE_ZIP_FILE

CMD ["/bin/sh"]