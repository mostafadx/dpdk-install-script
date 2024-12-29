sudo apt install build-essential meson python3-pyelftools libnuma-dev
wget https://fast.dpdk.org/rel/dpdk-23.07.tar.xz
tar xf dpdk-23.07.tar.xz
cd dpdk-23.07
meson -Dexamples=all build
ninja -C build
cd build
sudo ninja install
sudo ldconfig