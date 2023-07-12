{ stdenv
, fetchFromGitHub
, pkg-config
, meson
, ninja
, perl
}:

stdenv.mkDerivation rec {
  pname = "libvfn";
  version = "2.0.2";

  src = fetchFromGitHub {
    owner = "OpenMPDK";
    repo = "libvfn";
    rev = "v${version}";
    hash = "sha256-s2iTr5lc99ryT5BqkUurK7LaxN/yPWKbBNQBHwsFJH0=";
  };

  patches = [
    ./trace_pl_pathfix.patch
  ];

  mesonFlags = [
    "-Ddocs=disabled"
    "-Dlibnvme=disabled"
    "-Dprofiling=false"
  ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    perl
  ];
}
