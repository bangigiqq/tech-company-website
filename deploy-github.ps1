# Website Deployment Script - GitHub Pages
# 作者：Silver ✨
# 日期：2026-02-25

# ============ 配置 ============
$RepoName = "tech-company-website"
$Description = "Company Website - IT Services in Macau"

# ============ 執行 ============
Write-Host ""
Write-Host "=== 開始部署網站到 GitHub Pages ===" -ForegroundColor Cyan
Write-Host ""

# 1. 進入網站目錄
Set-Location "$PSScriptRoot\website"
Write-Host "[1/6] 進入網站目錄: $(Get-Location)" -ForegroundColor Green

# 2. 初始化 Git（如果未初始化）
if (-not (Test-Path ".git")) {
    git init
    Write-Host "[2/6] Git 倉庫已初始化" -ForegroundColor Green
} else {
    Write-Host "[2/6] Git 倉庫已存在" -ForegroundColor Green
}

# 3. 配置 Git 用戶
git config user.email "chris@company.com"
git config user.name "CHRIS"
Write-Host "[3/6] Git 用戶已配置" -ForegroundColor Green

# 4. 添加所有文件
git add .
git commit -m "Initial commit - Company Website"
Write-Host "[4/6] 文件已提交" -ForegroundColor Green

# 5. 創建 GitHub 倉庫並推送
Write-Host "[5/6] 創建 GitHub 倉庫並推送..." -ForegroundColor Yellow

gh repo create $RepoName --public --source=. --description $Description --push --yes 2>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "[5/6] ✅ 倉庫創建並推送成功！" -ForegroundColor Green
} else {
    Write-Host "[5/6] ⚠️ 需要先登入 GitHub" -ForegroundColor Yellow
    Write-Host "    請運行: gh auth login" -ForegroundColor White
}

# 6. 啟用 GitHub Pages
Write-Host "[6/6] 提示：請手動啟用 GitHub Pages" -ForegroundColor Yellow
Write-Host "    1. 去 https://github.com/settings/repositories" -ForegroundColor White
Write-Host "    2. 找到倉庫 '$RepoName'" -ForegroundColor White
Write-Host "    3. Settings → Pages → Source: main branch → Save" -ForegroundColor White

Write-Host ""
Write-Host "=== 部署完成！ ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 下一步：" -ForegroundColor Yellow
Write-Host "   1. 運行 'gh auth login' 如果需要登入" -ForegroundColor White
Write-Host "   2. 再次運行呢個腳本" -ForegroundColor White
Write-Host "   3. 或者去 GitHub 手動啟用 Pages" -ForegroundColor White
Write-Host ""
Write-Host "🌐 網站網址（啟用 Pages 後）：" -ForegroundColor Yellow
Write-Host "   https://你的GitHub用戶名.github.io/$RepoName/" -ForegroundColor White
Write-Host ""
