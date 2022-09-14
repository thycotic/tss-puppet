## PUBLIC ARCHIVE

> ***NOTE***
> This repo is archived.
> This is still available under the licensing terms, but is not being actively developed or updated any further. Please see [DelineaXPM](https://github.com/DelineaXPM) for active projects.

# Thycotic Secret Server

## Table of Contents

- [Thycotic Secret Server](#thycotic-secret-server)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Requirements](#requirements)
    - [Installation](#installation)
  - [Usage](#usage)
    - [TSS Configuration](#tss-configuration)
  - [Limitations](#limitations)

## Description

This Puppet module facilitates the consumption of secrets from Thycotic Secret Server(TSS).

## Setup

### Requirements

In order to use either Secret Server, you must first ensure that the corresponding Ruby SDK is available via the puppetserver gem installer.

```
# Install Secret Server SDK
puppetserver gem install tss-sdk
```

You must also use a supported OS. See [limitations](#limitations) for a list of supported operating systems.

### Installation

This module can be cloned directly into your `modules/` folder for your environment and rename the folder to `tss/` so that puppets is able to compile the catalog and find the `tss` resource. You can validate this by running `puppet module list` to ensure Puppet recognizes it as a valid module.

## Usage

Your TSS secret can be made available by initiating a single class:

```
class { 'tss': }
```

If you would like to return the secrets metadata in addition to the secret itself, you can set the `dsv::metadata` property to `true`. The default is `false`.

You can access your returned secret with the `tss::secret` property.

> It is **recommended** that you use **Hiera** for configuration.

### TSS Configuration

`tss` requires the following properties to be set:

- `username` — The client's username for authentication
- `password` — The client's password for authentication
- `server_url` — The full qualified server URL
- `secret_id` — The id of the required secret.

An example:

```
# Example config in common.yaml
tss::username: definitelynotroot
tss::password: notrooteither
tss::server_url: https://mysecretserver.org
tss::secret_id: 1
```

## Limitations

This module _currently_ supports the following operating systems:

- Ubuntu 18.04
- CentOS 7
