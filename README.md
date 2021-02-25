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

This module can be cloned directly into your `modules/` folder for your environment. You can validate this by running `puppet module list` to ensure Puppet recognizes it as a valid module.

## Usage

There are two classes that can be instantiated in your `manifest` file. Instantiate the appropriate class (or both) depending on which of the Thycotic services you depend.

- `class { 'thycotic_tss': }` (_not required_)
- `class { 'thycotic_tss::tss': }`

The `thycotic_tss` base class is _**optional**_ in all cases. If you would like to return the secrets metadata in addition to the secret itself, you can set the `thycotic_tss::metadata` property to `true`. The default is `false`.

> It is **recommended** that you use **Hiera** for configuration.

### TSS Configuration

`thycotic_tss::tss` requires the following properties to be set:

- `username` — The client's username for authentication
- `password` — The client's password for authentication
- `server_url` — The full qualified server URL
- `secret_id` — The id of the required secret.

An example:

```
# Example config in common.yaml

thycotic_tss::tss::username: definitelynotroot
thycotic_tss::tss::password: notrooteither
thycotic_tss::tss::server_url: https://mysecretserver.org
thycotic_tss::tss::secret_id: 1
```

## Limitations

This module _currently_ supports the following operating systems:

- Ubuntu 18.04
- CentOS 7
