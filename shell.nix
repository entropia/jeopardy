{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    qt5.qtbase
    qt5.wrapQtAppsHook
    pkg-config
    gnumake
    gcc
  ];

  buildInputs = with pkgs; [
    qt5.qtbase
    qt5.qtmultimedia
    qt5.qtxmlpatterns
    libGL
  ];

  # Without this Qt can't find its image format plugins (e.g. JPEG)
  shellHook = ''
    export QT_PLUGIN_PATH=${pkgs.qt5.qtbase.bin}/${pkgs.qt5.qtbase.qtPluginPrefix}''${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}
    echo "Qt5 dev shell ready. Build with: qmake && make"
  '';
}
