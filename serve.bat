@echo off
REM Local preview for the sales page. Double-click, then open http://localhost:8080
cd /d "%~dp0"
echo Serving %cd% at http://localhost:8080  --  press Ctrl+C to stop
python -m http.server 8080 --bind 127.0.0.1
