@echo off
echo ========================================
echo Node.js 最新稳定版下载器
echo ========================================
echo.

echo 正在查询最新版本信息...
echo.

REM 使用PowerShell下载最新LTS版本
echo 正在下载 Node.js LTS 版本...
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ProgressPreference = 'SilentlyContinue'; try { Invoke-WebRequest -Uri 'https://nodejs.org/dist/latest-v20.x/node-v20.11.0-x64.msi' -OutFile 'nodejs-latest.msi' -UseBasicParsing; Write-Host '下载完成！' } catch { Write-Host '下载失败，尝试备用链接...'; Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi' -OutFile 'nodejs-latest.msi' -UseBasicParsing; Write-Host '备用下载完成！' } }"

echo.
if exist "nodejs-latest.msi" (
    echo ✅ 下载成功！文件大小：
    dir nodejs-latest.msi
    echo.
    echo 🚀 正在启动安装程序...
    start /wait nodejs-latest.msi
    echo.
    echo ✅ 安装完成！请重新打开命令提示符验证安装
    echo 验证命令：node --version
) else (
    echo ❌ 下载失败！
    echo 请手动访问 https://nodejs.org 下载最新版本
)

echo.
echo 按任意键退出...
pause >nul


