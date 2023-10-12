$apiKey = Read-host "enter your API Key" -AsSecureString

if (-not $apiKey) {
    Write-Error "API Key cannot be empty."
    return
}

$normalString = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($apiKey))
$lat = Read-host "enter your latitude"
$lon = Read-host "enter your longitude"
$units = "metric"

try {
    $params = @{
        Uri = "https://api.openweathermap.org/data/2.5/onecall?appid=${normalString}&lat=$lat&lon=$lon&units=$units"
        Method = "GET"
    }

    $response = Invoke-RestMethod @params
    $response
}
catch {
    Write-Error "Failed to retrieve weather data: $_"
}