
<#
.SYNOPSIS
Gets the artifacts of a GitHub repository.

.DESCRIPTION
This function uses the GitHub API to retrieve the artifacts of a specified GitHub repository.

.PARAMETER owner
The owner of the GitHub repository.

.PARAMETER repo
The name of the GitHub repository.

.EXAMPLE
Get-GitHubRepoArtifacts -owner "octocat" -repo "Hello-World"
#>
[CmdletBinding]
function Get-GitHubRepoArtifacts {
    param(
        [parameter(Mandatory = $true, Position = 0)]
        [string]$owner,
        [parameter(Mandatory = $true, Position = 0)]
        [string]$repo
    )

    $artifacts = gh api `
        -H "Accept: application/vnd.github+json" `
        -H "X-GitHub-Api-Version: 2022-11-28" `
        /repos/$owner/$repo/actions/artifacts | ConvertFrom-Json

    $artifacts.artifacts
}

<#
.SYNOPSIS
Removes a specific artifact from a GitHub repository.

.DESCRIPTION
This function uses the GitHub API to delete a specific artifact from a specified GitHub repository.

.PARAMETER owner
The owner of the GitHub repository.

.PARAMETER repo
The name of the GitHub repository.

.PARAMETER artifactId
The ID of the artifact to be removed.

.EXAMPLE
Remove-GitHubRepoArtifact -owner "octocat" -repo "Hello-World" -artifactId 123
#>
[CmdletBinding]
function Remove-GitHubRepoArtifact {
    param(
        [parameter(Mandatory = $true, Position = 0)]
        [string]$owner,
        [parameter(Mandatory = $true, Position = 1)]
        [string]$repo,
        [parameter(Mandatory = $true, Position = 2)]
        [int]$artifactId
    )

    gh api `
        --method DELETE `
        -H "Accept: application/vnd.github+json" `
        -H "X-GitHub-Api-Version: 2022-11-28" `
        /repos/$owner/$repo/actions/artifacts/$artifactId
}


<#
.SYNOPSIS
Removes all artifacts from a GitHub repository.

.DESCRIPTION
This function uses the GitHub API to delete all artifacts from a specified GitHub repository.

.PARAMETER owner
The owner of the GitHub repository.

.PARAMETER repo
The name of the GitHub repository.

.EXAMPLE
Remove-GitHubRepoArtifacts -owner "octocat" -repo "Hello-World"
#>
[CmdletBinding]
function Remove-GitHubRepoArtifacts {
    param(
        [parameter(Mandatory = $true, Position = 0)]
        [string]$owner,
        [parameter(Mandatory = $true, Position = 1)]
        [string]$repo
    )

    $artifacts = Get-GitHubRepoArtifacts -owner $owner -repo $repo
    $artifacts | ForEach-Object {
        Remove-GitHubRepoArtifact -owner $owner -repo $repo -artifactId $_.id
    }
}

Export-ModuleMember -Function @(
    'Get-GitHubRepoArtifacts'
    'Remove-GitHubRepoArtifact'
    'Remove-GitHubRepoArtifacts'
)