$body = @{
    regions = @('apac', 'emea', 'amer')
    threshold_ms = 150
} | ConvertTo-Json

Write-Host "Testing API at http://127.0.0.1:8000/" -ForegroundColor Cyan
Write-Host "Request body:" -ForegroundColor Yellow
Write-Host $body

try {
    $response = Invoke-RestMethod -Uri http://127.0.0.1:8000/ -Method Post -Body $body -ContentType 'application/json'
    Write-Host "`nResponse:" -ForegroundColor Green
    $response | ConvertTo-Json -Depth 10
} catch {
    Write-Host "`nError:" -ForegroundColor Red
    Write-Host $_.Exception.Message
}
