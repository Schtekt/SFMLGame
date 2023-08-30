project "RuntimeApp"
    kind "ConsoleApp"
    language "C++"
    targetdir "../Build/bin/%{prj.name}"
    objdir "../Build/bin-int/%{prj.name}"
    files { "src/**.h", "src/**.cpp" }
    includedirs{"lib/"}
    libdirs{"../external/SFML-lib/SFML/lib"}
    links
    {
        "lib",
        "opengl32",
        "freetype",
        "winmm",
        "gdi32",
        "flac",
        "vorbisenc",
        "vorbisfile",
        "vorbis",
        "ogg",
        "ws2_32"
    }
    
project "Lib"
    kind "StaticLib"
    language "C++"
    defines{"SFML_STATIC"}
    targetdir "../Build/bin/%{prj.name}"
    objdir "../Build/bin-int/%{prj.name}"
    files { "lib/**.h", "lib/**.cpp" }
    includedirs{"../external/SFML-lib/SFML/include"}
    libdirs{"../external/SFML-lib/SFML/lib"}

    filter "configurations:Debug"
		links
        {	
			"sfml-graphics-s-d",
			"sfml-window-s-d",
			"sfml-system-s-d",
			"sfml-audio-s-d",
			"sfml-network-s-d"
		}
        postbuildcommands {
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-audio-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-graphics-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-network-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-system-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-window-s.pdb ../Build/bin/%{prj.name}"
        }

    
	filter "configurations:Release"
		links
		{	
			"sfml-graphics-s",
			"sfml-window-s",
			"sfml-system-s",
			"sfml-audio-s",
			"sfml-network-s"
		}
        postbuildcommands {
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-audio-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-graphics-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-network-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-system-s.pdb ../Build/bin/%{prj.name}",
            "{COPY} ../external/SFML-lib/SFML/lib/sfml-window-s.pdb ../Build/bin/%{prj.name}"
        }

project "UnitTests"
    kind "ConsoleApp"
    language "C++"
    targetdir "../Build/bin/%{prj.name}"
    objdir "../Build/bin-int/%{prj.name}"
    files {"unitTests/**.cpp", "unitTests/**.h"}
    includedirs{"lib/"}
    includedirs{"../external/SFML-lib/SFML/lib", "../external/googletest/googletest/include/"}
    links{"gTest"}