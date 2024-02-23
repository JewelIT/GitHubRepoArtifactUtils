# GitHubRepoArtifactsUtils PowerShell Module

## Table of Contents

- [GitHubRepoArtifactsUtils PowerShell Module](#githubrepoartifactsutils-powershell-module)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
    - [Functions](#functions)
      - [Get-GitHubRepoArtifacts](#get-githubrepoartifacts)
    - [Remove-GitHubRepoArtifact](#remove-githubrepoartifact)
    - [Remove-GitHubRepoArtifacts](#remove-githubrepoartifacts)
  - [Installation](#installation)
  - [Contributing](#contributing)
  - [Requirements](#requirements)
  - [License](#license)

## Introduction

The GitHubRepoArtifactsUtils module is a collection of PowerShell scripts that interact with the GitHub API to retrieve repository artifacts.

### Functions

#### Get-GitHubRepoArtifacts

This function retrieves the artifacts of a specified GitHub repository.

Usage:

```powershell
Get-GitHubRepoArtifacts -owner "octocat" -repo "Hello-World"
```

### Remove-GitHubRepoArtifact

This function deletes a specific artifact from a specified GitHub repository.

Usage:

```powershell
Remove-GitHubRepoArtifact -owner "octocat" -repo "Hello-World" -artifactId 123456
```

### Remove-GitHubRepoArtifacts

This function deletes all artifacts from a specified GitHub repository.

Usage:

```powershell
Remove-GitHubRepoArtifacts -owner "octocat" -repo "Hello-World"
```

## Installation

To install this module, download the GitHubRepoArtifactsUtils.psm1 file and import it in your PowerShell session:

```powershell
Import-Module ./path/to/GitHubRepoArtifactsUtils.psm1
```

## Contributing

If you want to contribute to this project, you can...

## Requirements

- PowerShell 5.1 or higher
- GitHub CLI

## License

This project is licensed under the MIT License.
