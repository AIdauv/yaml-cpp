project "yaml-cpp"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp",
        
        "include/yaml-cpp/**.h"
    }

    defines
    {
        "YAML_CPP_STATIC_DEFINE"
    }

    includedirs
    {
        "include"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++20"
        staticruntime "off"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++20"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"