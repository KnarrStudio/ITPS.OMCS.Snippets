$m = @'
[Parameter(Mandatory = $False,Position = 2,HelpMessage = 'Formatting Choice 0 to 4')]
[ValidateRange(0,4)]
[int]$StampFormat = 3
 
$Uformat = '%y', '%y%m%d%H%M', '%Y%m%d', '%j%H%M%S', '%y-%m-%d_%H.%M' # Length is 5 from 0 to 4
$DateStamp = Get-Date -UFormat $Uformat[$StampFormat]
if($StampFormat -eq $($Uformat.Length - 1))
{
$DateStamp = Get-Date -Format o | ForEach-Object -Process {
    $_ -replace ':', '.'
}
}
$DateStamp #Return
'@
New-IseSnippet -Text $m -Title 'ks: Get-Date -UFormat' -Description 'Setting up a datestamp in parameters' -Author 'Knarr Studio'
