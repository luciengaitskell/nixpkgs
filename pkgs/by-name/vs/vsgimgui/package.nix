{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  vulkanscenegraph,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "vsgimgui";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "vsg-dev";
    repo = "vsgImGui";
    tag = "v${finalAttrs.version}";
    hash = "sha256-GRHTpMTqK9UgvINZG2oN9zTh0lnBtNw0JdwB4ZT47gk=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
  ];

  propagatedBuildInputs = [
    vulkanscenegraph
  ];

  strictDeps = true;

  cmakeFlags = [
    (lib.cmakeBool "BUILD_SHARED_LIBS" true)
  ];

  meta = {
    description = "VulkanSceneGraph, ImGui and ImPlot integration library";
    homepage = "https://github.com/vsg-dev/vsgImGui";
    changelog = "https://github.com/vsg-dev/vsgImGui/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ sikmir ];
    platforms = lib.platforms.unix;
  };
})
