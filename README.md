# 🤖 MeoMunDep Bless Bot - Complete Setup Guide

This comprehensive guide will help you set up and run the MeoMunDep Bot on Windows, macOS, or Linux. The bot automates certain game tasks efficiently and securely.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
  - [Standard Installation](#standard-installation)
  - [Docker Installation](#docker-installation)
- [Configuration](#configuration)
- [Running the Bot](#running-the-bot)
- [Using Proxies](#using-proxies)
- [Troubleshooting](#troubleshooting)
- [Security Recommendations](#security-recommendations)
- [Contact and Support](#Contactandsupport)

## 🔧 Prerequisites

Before setting up the bot, ensure you have the following installed:

- **Python 3.11.9** - Required to run the script
- **Git** (optional) - For cloning the repository
- **Docker** (optional) - For containerized deployment

## 🚀 Installation Methods

You can choose between standard installation or Docker-based deployment.

### ⚙️ Standard Installation

#### 1. Install Python

<details>
<summary><b>Windows</b></summary>

- Download Python from [python.org](https://www.python.org/downloads/release/python-3119/)
- During installation, check "Add Python to PATH"
- Verify installation by opening Command Prompt and typing:
  ```
  python --version
  ```
  </details>

<details>
<summary><b>macOS</b></summary>

- Install [Homebrew](https://brew.sh/) first:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Install Python using Homebrew:
  ```bash
  brew install python
  ```
- Verify installation:
  ```bash
  python3 --version
  ```
  </details>

<details>
<summary><b>Linux</b></summary>

- For Ubuntu/Debian:
  ```bash
  sudo apt update
  sudo apt install python3 python3-pip -y
  ```
- For CentOS/RHEL:
  ```bash
  sudo yum install python3 python3-pip -y
  ```
- Verify installation:
  ```bash
  python3 --version
  ```
  </details>

#### 2. Install Git (Optional)

<details>
<summary><b>Windows</b></summary>

- Download from [git-scm.com](https://git-scm.com/download/win)
- Use default settings during installation
</details>

<details>
<summary><b>macOS</b></summary>

```bash
brew install git
```

</details>

<details>
<summary><b>Linux (Debian/Ubuntu)</b></summary>

```bash
sudo apt install git -y
```

</details>

#### 3. Clone Repository (If using Git)

```bash
git clone https://github.com/MeoMunDep/Bless.git
cd Bless/dist
```

#### 4. Install Required PacBlesses

Navigate to the bot folder and run:

<details>
<summary><b>Windows</b></summary>

```
pip install -r requirements.txt
```

</details>

<details>
<summary><b>macOS/Linux</b></summary>

```bash
pip3 install -r requirements.txt
```

</details>

### 🐳 Docker Installation

#### 1. Install Docker

<details>
<summary><b>Windows/macOS</b></summary>

- Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop)
</details>

<details>
<summary><b>Linux</b></summary>

```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
```

</details>

#### 2. Create Dockerfile

Create a file named `Dockerfile` with the following content:

```dockerfile
FROM python:3.11.9-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt && \
    mkdir -p /app/data && \
    chmod +x /app/run.sh

VOLUME /app/data

ENTRYPOINT ["/app/run.sh"]
```

#### 3. Create docker-compose.yml (Optional)

Create a file named `docker-compose.yml` with the following content:

```yaml
version: '3'

services:
  meomundep-bot:
    build: .
    volumes:
      - ./data:/app/data
    restart: unless-stopped
```

## ⚙️ Configuration

### Required Files

Ensure you have the following files in your folder:

- `meomundep.py` - Main bot script
- `configs.json` - Configuration file
- `datas.txt` - Bot data
- `proxies.txt` - List of proxies (optional)
- `requirements.txt` - List of required pacBlesses

### requirements.txt Content

```
aiohttp
aiohttp_proxy
cloudscraper
colorama
Cryptodome
```

### Configurations (configs.json)

Edit the `configs.json` file to customize the bot's behavior:

```json
{
  "timeZone": "en-US",
  "timeToRestartAllAccounts": 300,
  "howManyAccountsRunInOneTime": 100,
  "delayEachAccount": [1, 1],
  "skipInvalidProxy": false,
  "referralCode": "BE3JR9"
}
```

**Configuration Parameters:**

- `timeZone`: Time zone setting (e.g., "en-US")
- `howManyAccountsRunInOneTime`: Number of accounts to run simultaneously
- `delayEachAccount`: Random delay range between processing accounts [min, max] in seconds
- `timeToRestartAllAccounts`: Time to wait before restarting all accounts (in seconds)
- `skipInvalidProxy`: Whether to skip accounts with invalid proxies
- `referralCodes`: Add your referral code (optional)

## ▶️ Running the Bot

### Standard Method

<details>
<summary><b>Windows</b></summary>

```
python meomundep.py
```

Or double-click the provided `run.bat` file.

</details>

<details>
<summary><b>macOS/Linux</b></summary>

```bash
python3 meomundep.py
```

Or make the script executable and run:

```bash
chmod +x run.sh && ./run.sh
```

</details>

### Docker Method

<details>
<summary><b>Build and Run with Docker</b></summary>

```bash
# Build image
docker build -t meomundep-bot .

# Run container
docker run -it --rm \
  -v $(pwd)/data:/app/data \
  --name meomundep-container \
  meomundep-bot
```

</details>

<details>
<summary><b>Using Docker Compose</b></summary>

```bash
docker-compose up --build
```

</details>

## 🔒 File Permissions

### Windows

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Linux/macOS

```bash
chmod 600 configs.json datas.txt proxies.txt meomundep.py
```

## 🌐 Datas and Proxies

- Learn how to retrieve data and pubkey from here: [data](https://t.me/KeoAirDropFreeNee/1507) - [pubKeys](https://t.me/KeoAirDropFreeNee/1512)
- datas.txt
```txt
ey...
ey...
ey...
```
- pubKeys.txt
```txt
12...
12...
12...
```

The bot supports various proxy formats:

- HTTP/HTTPS: `http://username:password@host:port` or `http://host:port`
- SOCKS4/SOCKS5: `socks4://username:password@host:port` or `socks5://host:port`

Add proxies to `proxies.txt`, one proxy per line. Example formats:

```
http://host:port
http://user:pass@host:port
socks5://host:port
socks5://user:pass@host:port
```

Leave the file empty if you don't want to use proxies.

## ❓ Troubleshooting

<details>
<summary><b>Bot crashes on startup</b></summary>

- Ensure all required pacBlesses are installed
- Check your Python version (Python 3.11.9 required)
- Verify configuration file format
</details>

<details>
<summary><b>Connection errors</b></summary>

- Check your internet connection
- Verify proxy settings if using proxies
- Check if the required endpoints are accessible
</details>

<details>
<summary><b>Authentication failures</b></summary>

- Ensure your bot data in `datas.txt` and `pubKeys` is correct
- Check if your IP or proxy is blocked
</details>

## 🛡️ Security Recommendations

1. **Data Protection**:

   - Keep your `datas.txt` and configuration files secure
   - Use file permissions to restrict access

2. **Docker Security**:

   - Run Docker containers as non-root user:
     ```bash
     docker run -u 1000:1000 meomundep-bot
     ```
   - Keep your Docker installation up-to-date

3. **Proxy Usage**:
   - Use secure proxies from trusted providers
   - Rotate proxies periodically to avoid IP bans

## 📝 Security Notice

The executable file is obfuscated to protect the source code. This is normal and doesn't indicate malicious behavior.

## 📞 Contact and Support

- **Help me with your referral** [Referral Link](https://bless.network/dashboard?ref=BE3JR9)
- **Buy me a proxie account** [Here](https://t.me/KeoAirDropFreeNe/312/27801) or [Here](https://github.com/MeoMunDep/MeoMunDep)

If you encounter any issues or have questions, feel free to reach out:

- **Contact:** [Contact Me](https://t.me/MeoMunDep)
- **Group:** [Join the Group](https://t.me/KeoAirDropFreeNe)
- **Channel:** [Visit the Channel](https://t.me/KeoAirDropFreeNee)

Your support is greatly appreciated! 🐱

---

**Note**: This bot is for educational purposes only. So do not sell or steal it.
