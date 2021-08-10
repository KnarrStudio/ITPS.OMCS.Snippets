$m = @'
# Import settings with a config file. This is a JSON with headings.
# See for https://github.com/KnarrStudio/ITPS.OMCS.Snippets more examples

$ConfigFile = '.\config2.json '
$HashConfig = Get-Content $ConfigFile | ConvertFrom-Json -AsHashtable
$SplatSettings = $HashConfig.Other
Write-Host 'Example 4: JSON with headings -' $SplatSettings.Color

# File Format Example - .\config2.json
{
  "General": {
    "MySetting1": [
      "value=asdf=34"
    ]
  },
  "Locations": {
    "InputFile": [
      "\"C:\\Users.txt\""
    ],
    "OutputFile": [
      "\".\\output.log\""
    ]
  },
  "Other": {
    "WaitForTime": [
      "20"
    ],
    "Color": [
      "Blue bunny suit"
    ],
    "VerboseLogging": [
      "True"
    ]
  }
}

  
'@
New-IseSnippet -Text $m -Title 'ks: Import-ConfigSettings' -Description 'Use a config or settings file to import variables that may normally be "baked-in".  This will allow a script to be signed.' -Author 'Knarr Studio'


