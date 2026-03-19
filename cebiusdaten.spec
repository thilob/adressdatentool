from pathlib import Path

from PyInstaller.utils.hooks import (
    collect_data_files,
    collect_dynamic_libs,
    collect_submodules,
    copy_metadata,
)

project_root = Path(globals().get("SPECPATH", Path.cwd())).resolve()


def _keep_runtime_submodules(name):
    return ".tests" not in name and not name.endswith(".conftest")


hiddenimports = []
hiddenimports += collect_submodules("geopandas", filter=_keep_runtime_submodules)
hiddenimports += collect_submodules("pyproj", filter=_keep_runtime_submodules)
hiddenimports += collect_submodules("shapely", filter=_keep_runtime_submodules)

datas = []
datas += collect_data_files("geopandas")
datas += collect_data_files("pyproj")
datas += collect_data_files("shapely")
datas += copy_metadata("geopandas")
datas += copy_metadata("pyproj")
datas += copy_metadata("shapely")
datas += copy_metadata("pandas")

binaries = []
binaries += collect_dynamic_libs("pyproj")
binaries += collect_dynamic_libs("shapely")


a = Analysis(
    ["main.py"],
    pathex=[str(project_root)],
    binaries=binaries,
    datas=datas,
    hiddenimports=hiddenimports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name="cebiusdaten",
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name="cebiusdaten",
)
