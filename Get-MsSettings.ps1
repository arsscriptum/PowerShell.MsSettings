<#
#̷𝓍    𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍    🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>


[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$FALSE,Position=0)]
    [string]$Name,
    [Parameter(Mandatory=$FALSE,Position=1)]
    [string]$Category,
    [switch]$Open    
) 
try{
    $Set = ''
    $ShowHelp = $True
    
    $json = "$PSScriptRoot\mssettings.json"
   
    if(-not (Test-Path $json)){ throw "missing $json" }

    $Data = Get-Content  $json | ConvertFrom-Json

    if($PSBoundParameters.ContainsKey('Name')){
        $Data | Where APPLICATION -match $Name
        $Set = $Data | Where APPLICATION -match $Name | select -ExpandProperty COMMAND -Last 1
    }elseif($PSBoundParameters.ContainsKey('Category')){
        $Data | Where CATEGORY -match $Category
        $Set = $Data | Where CATEGORY -match $Category | select -ExpandProperty COMMAND -Last 1
    }else{
        $Data
    }
   
    if($Open){
        &"start" "$Set"
    }
}catch{
    Write-Error $_
}