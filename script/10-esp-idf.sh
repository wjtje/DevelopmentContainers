#!/bin/zsh

# This file is based on https://github.com/espressif/esp-idf/blob/master/tools/docker/Dockerfile
# and https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html

export IDF_PATH="/opt/esp/idf"
export IDF_TOOLS_PATH="/opt/esp"
export IDF_VERSION="v5.3"

# Install the needed dependencies
dnf install -y \
    git \
    wget \
    flex \
    bison \
    gperf \
    python3 \
    python3-pip \
    cmake \
    ninja-build \
    ccache \
    libffi-devel \
    dfu-util \
    openssl-devel \
    libusb1-devel \
    systemd-udev

# Scripts often use python instead of python3
ln -sf /usr/bin/python3 /usr/local/bin/python

git clone \
    --recursive \
    --depth=1 \
    --shallow-submodules \
    -b release/$IDF_VERSION \
    https://github.com/espressif/esp-idf.git \
    $IDF_PATH

git config --system --add safe.directory $IDF_PATH 

# Install all the needed tools
$IDF_PATH/tools/idf_tools.py --non-interactive install required
$IDF_PATH/tools/idf_tools.py --non-interactive install cmake
$IDF_PATH/tools/idf_tools.py --non-interactive install-python-env
rm -rf $IDF_TOOLS_PATH/dist

# Set all the user ENV variables
echo -e "IDF_PATH=\"/opt/esp/idf\"\nIDF_TOOLS_PATH=\"/opt/esp\"\nIDF_PYTHON_CHECK_CONSTRAINTS=no\nIDF_CCACHE_ENABLE=1" >> /etc/profile

# Alias for loading ESP-IDF in a new shell
echo 'alias get_idf=". /opt/esp/idf/export.sh"' >> /root/.zshrc
