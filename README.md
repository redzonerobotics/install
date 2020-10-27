# Install Scripts

## NATS

### To install the NATS Server for arm64:
```bash
wget -O - https://raw.githubusercontent.com/redzonerobotics/install/master/nats-arm64/install.sh | bash
```

### To install the NATS Server for arm64 (Websocket enabled):
```bash
wget -O - https://raw.githubusercontent.com/redzonerobotics/install/master/nats-ws-arm64/install.sh | bash
```
## OpenCV

### OpenCV:
```bash
wget -O - https://raw.githubusercontent.com/redzonerobotics/install/master/opencv/install.sh | bash
```

### OpenCV with Cuda:
```bash
wget -O - https://raw.githubusercontent.com/redzonerobotics/install/master/opencv/install.sh | bash -s cuda
```

### OpenCV with Cuda and Python3 support:
```bash
wget -O - https://raw.githubusercontent.com/redzonerobotics/install/master/opencv/install.sh | bash -s cuda_py
```