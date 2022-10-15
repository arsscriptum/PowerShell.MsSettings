# Get-MsSettings

A simple function to get the list of possible commands to configure windows, and search through those commands.

### Details

A user can open a configuration dialog from the command line. There are multiple setting pages / categories and this function helps in finding 
the correct one.

### How to use

Get the list of all possible settings pages.
```
    Get-MsSettings
```

Get the settings related to audio

```
    Get-MsSettings.ps1 -Category Audio
```

OPEN the settings related to volume

```
    .\Get-MsSettings.ps1 -Name Volume -Open
```

