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

  shellHook = ''
    echo "Qt5 dev shell ready. Build with: qmake && make"
  '';
}
