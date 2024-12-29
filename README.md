# dpdk-install-script
Streamline Intel DPDK installation with this automated script.
# Installation
> Grant the root access using the below command.
```
sudo -i
```
> Enter the installation command in the console to complete the installation.
```
bash <(curl -s https://raw.githubusercontent.com/mostafade/dpdk-install-script/main/dpdk-install-script.sh)

```
# Getting Started
## 1. Configure Huge Pages
Before you start, configure huge pages on your system. Use the following commands:

```
mkdir -p /dev/hugepages
```
```
mountpoint -q /dev/hugepages || mount -t hugetlbfs nodev /dev/hugepages
```
Notice: if you need more hugepages choose a number more than 64.
```
echo 64 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
```
## 2. Identify and Dedicate a Network Interface
List the available network interfaces and choose one to dedicate to DPDK using:

```
dpdk-devbind.py -s
```
Once you've selected an interface (e.g., <interface_name>), bring it down to prevent the operating system from interacting with it:
```
ifconfig <interface_name> down
```
Ensure that you have the necessary driver for DPDK to communicate with the interface. If needed, add the driver.
## 3. Bind the Interface to DPDK

Bind the chosen network interface to DPDK using the following command. Replace <driver> with the appropriate driver name and <pci> with the PCI address of the dedicated device (e.g., 0001:01:00.0):
```
dpdk-devbind.py -b <driver> <pci>
```
## 4. Run the DPDK Hello World Example
Navigate to the DPDK folder and run the following command to verify your setup:
```
./build/examples/dpdk-helloworld -n 1 -l 0-1
```