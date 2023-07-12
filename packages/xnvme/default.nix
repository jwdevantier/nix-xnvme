{ stdenv
, fetchFromGitHub
, pkg-config
, meson
, ninja
, python310Packages
, libuuid
, libtool
, nasm
, zlib
, liburing
, libaio
, libvfn
}:

stdenv.mkDerivation rec {
  pname = "xnvme";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "OpenMPDK";
    repo = "xNVMe";
    rev = "v${version}";
    hash = "sha256-zmCAplfwrTvmYaud8uX2m6dM1EMvQun+KD7QV74VH5k=";
  };

  patches = [];

  mesonFlags = [
    "-Dwith-spdk=false"
  ];

  nativeBuildInputs = [
    libvfn
    meson
    ninja
    pkg-config
    python310Packages.pyelftools
  ];

  buildInputs = [
    libuuid
    libtool
    nasm
    zlib
    liburing
    libaio
    libvfn
  ];
}
