project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "off"

    targetdir ("../../Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("../../Intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imgui.h",
        "imgui.cpp",
        "imgui_internal.h",
        "imconfig.h",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3.cpp",
        "misc/cpp/imgui_stdlib.h",
        "misc/cpp/imgui_stdlib.cpp",
    }

    includedirs
    {
        "../ImGui",
        "../GLFW/include",
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++20"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++20"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Development"
        runtime "Release"
        optimize "on"

    filter "configurations:Shipping"
        runtime "Release"
        optimize "on"
        symbols "off"