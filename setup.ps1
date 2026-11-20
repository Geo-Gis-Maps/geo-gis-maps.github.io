Set-Location "d:\PorWebSer\server\data\projects\php\geo-gis-maps\geo-gis-maps.github.io"

# GitHub API - create repo geo-gis-maps.github.io
$token = "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"
$headers = @{
    "Authorization" = "Bearer $token"
    "Accept" = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

Write-Host "Creating repo geo-gis-maps.github.io..."
$body = '{"name":"geo-gis-maps.github.io","description":"Geographic Centers of Every Country","homepage":"https://geo-gis-maps.github.io/countries-geographic-centers/","private":false,"auto_init":false}'
try {
    $r = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method POST -Headers $headers -Body $body -ContentType "application/json"
    Write-Host "Repo created: $($r.html_url)"
} catch {
    Write-Host "Repo may exist: $($_.Exception.Message)"
}

Start-Sleep -Seconds 2

# Git init and push
git init
git config user.email "kodmatik12@gmail.com"
git config user.name "Geo-Gis-Maps"
git add .
git commit -m "Redirect to countries-geographic-centers"
git branch -M main
git remote add origin "https://$($token)@github.com/Geo-Gis-Maps/geo-gis-maps.github.io.git"
git push -u origin main

Write-Host "DONE - geo-gis-maps.github.io now redirects"
