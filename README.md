# DIG Subdomain Enumerator

A simple Bash tool for DNS subdomain enumeration using `dig` and custom wordlists.

The script reads candidate subdomains from a wordlist, queries a DNS server, and displays matching DNS records.

## Features

- Subdomain brute forcing with a custom wordlist.
- Uses Google Public DNS (`8.8.8.8`) by default.
- Supports a custom DNS server.
- Displays discovered DNS records directly in the terminal.
- Simple command-line interface.

## Requirements

- Linux
- Bash
- `dig` (usually provided by the `dnsutils` package on Debian-based systems)
- A DNS wordlist, such as [SecLists](https://github.com/danielmiessler/SecLists)

## Installation

Clone the repository:

```bash
git clone https://github.com/CyberSecurity0000/dig-subdomain-enumerator.git
cd dig-subdomain-enumerator
```

Make the script executable:

```bash
chmod +x exec.sh
```

## Usage

### Default DNS server

By default, the script sends DNS queries to Google Public DNS (`8.8.8.8`).

```bash
./exec.sh <wordlist> <domain>
```

Example:

```bash
./exec.sh /usr/share/seclists/Discovery/DNS/fierce-hostlist.txt example.com
```

### Custom DNS server

Use the `-s` option to specify the DNS server that will receive the queries.

```bash
./exec.sh -s <dns_server> <wordlist> <domain>
```

Example:

```bash
./exec.sh -s 1.1.1.1 /usr/share/seclists/Discovery/DNS/fierce-hostlist.txt example.com
```

### Help

Display the usage instructions:

```bash
./exec.sh -h
```

## How It Works

1. Reads candidate names from the supplied wordlist.
2. Builds a fully qualified query name by combining each candidate with the target domain.
3. Sends the DNS query using `dig`.
4. Filters and displays matching DNS responses.

## Disclaimer

This tool is intended for educational purposes and authorized security testing only. Only scan domains and DNS infrastructure that you own or have explicit permission to test.

## Author

**CyberSecurity0000**

[GitHub Profile](https://github.com/CyberSecurity0000)
