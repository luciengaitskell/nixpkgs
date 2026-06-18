{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  assimp,
  curl,
  draco,
  freetype,
  openexr,
  vulkanscenegraph,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "vsgxchange";
  version = "1.1.13";

  src = fetchFromGitHub {
    owner = "vsg-dev";
    repo = "vsgXchange";
    tag = "v${finalAttrs.version}";
    hash = "sha256-orjMGdXQj3AdLL431WVAbt4tt0Rl2L7a+LOD4vpNN3M=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    assimp
    curl
    draco
    freetype
    openexr
  ];

  propagatedBuildInputs = [
    vulkanscenegraph
  ];

  strictDeps = true;

  cmakeFlags = [
    (lib.cmakeBool "BUILD_SHARED_LIBS" true)
    (lib.cmakeBool "vsgXchange_GDAL" false)
    (lib.cmakeBool "vsgXchange_OSG" false)
    (lib.cmakeBool "vsgXchange_ktx" false)
  ];

  meta = {
    description = "VulkanSceneGraph third-party data integration library";
    homepage = "https://github.com/vsg-dev/vsgXchange";
    changelog = "https://github.com/vsg-dev/vsgXchange/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ sikmir ];
    mainProgram = "vsgconv";
    platforms = lib.platforms.unix;
  };
})
