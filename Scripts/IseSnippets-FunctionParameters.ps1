$m = @'

function Demo-Parameters 
{
  [CmdletBinding(SupportsShouldProcess = $true,ConfirmImpact = 'Low',DefaultParameterSetName = 'FileName')]

  param
  (
    [Parameter(Mandatory,Position = 0,HelpMessage = 'Prefix of file or log name',ParameterSetName = 'BaseName')]
    [String]$baseNAME,
    [Parameter(Mandatory,Position = 0,HelpMessage = 'Full file name',ParameterSetName = 'FileName')]
    [String]$FileName,
    [Parameter(Mandatory = $true, ValueFromPipeline = $true,
    ValueFromPipelineByPropertyName = $true)]
    [Alias('hostname')]
    [ValidateLength(4,14)]
    [ValidateCount(1,10)]
    [string[]]$computername,
    [ValidateScript({
          If($_ -match '.csv')
          {
            $true
          }
          Else
          {
            Throw 'Input file needs to be CSV formatted with "HostName" , "IPAddress"'
          }
    })][String]$File,
    [switch]$nameLog
  )
}
'@
New-IseSnippet -Text $m -Title 'ks: Function Parameters' -Description 'Provides an example of some parameters' -Author 'Knarr Studio' -Force
