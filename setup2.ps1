Set-Location "d:\PorWebSer\server\data\projects\php\geo-gis-maps\geo-gis-maps.github.io"
$token = "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"

# Create the repo via API
$headers = @{
    "Authorization" = "Bearer $token"
    "Accept" = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}
$repoBody = "{`"name`":`"geo-gis-maps.github.io`",`"description`":`"Geographic Centers of Every Country`",`"private`":false,`"auto_init`":false}"
try {
    $result = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method POST -Headers $headers -Body $repoBody -ContentType "application/json"
    Write-Host "Repo created: $($result.full_name)"
} catch {
    Write-Host "Repo creation note: $($_.Exception.Message)"
}

Start-Sleep -Seconds 2

git init
git config user.email "kodmatik12@gmail.com"
git config user.name "Geo-Gis-Maps"
git add .
git commit -m "Redirect geo-gis-maps.github.io to countries-geographic-centers"
git branch -M main
$remoteUrl = "https://${token}@github.com/Geo-Gis-Maps/geo-gis-maps.github.io.git"
git remote add origin $remoteUrl
git push -u origin main
Write-Host "DONE"
