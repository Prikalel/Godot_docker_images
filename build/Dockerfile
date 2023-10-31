FROM mcr.microsoft.com/dotnet/sdk:6.0

ARG GODOT_ENGINE_ZIP_FILE=Godot_v4.2-beta3_mono_linux_x86_64.zip

ENV GODOT_PATH=/godot

WORKDIR $GODOT_PATH

COPY $GODOT_ENGINE_ZIP_FILE ./
COPY check_checksum.sh ./

# Download checksums to check that godot engine is correct; `libfontconfig` is used by Godot
RUN apt-get update -y \
  && apt-get install wget coreutils unzip libfontconfig -y \
  && chmod +x check_checksum.sh \
  && ./check_checksum.sh $GODOT_ENGINE_ZIP_FILE \
  && apt-get remove wget -y

# Unzip to $GODOT_PATH
RUN unzip $GODOT_ENGINE_ZIP_FILE -d here \
  && mv here/**/* ./ \
  && rm -rf $GODOT_ENGINE_ZIP_FILE here check_checksum.sh \
  && apt-get remove unzip -y

# Adding godot executable to path...
ENV PATH="${PATH}:${GODOT_PATH}"

RUN ln -s $(find $GODOT_PATH -maxdepth 1 -perm -111 -type f | head -n 1 | grep -E '.') $GODOT_PATH/godot


CMD ["/bin/sh"]