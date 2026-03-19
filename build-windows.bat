@rem Copyright (C) 2026 Thilo Berger
@rem SPDX-License-Identifier: GPL-3.0-or-later

@echo off
setlocal

cd /d %~dp0

if not exist .venv (
    echo Fehler: .venv wurde nicht gefunden.
    echo Bitte zuerst eine virtuelle Umgebung anlegen und die Abhängigkeiten installieren.
    exit /b 1
)

if not exist .venv\Scripts\pyinstaller.exe (
    echo Fehler: PyInstaller ist in .venv nicht installiert.
    echo Installation: .venv\Scripts\pip install pyinstaller
    exit /b 1
)

.venv\Scripts\pyinstaller.exe --noconfirm --clean adressdatentool.spec
