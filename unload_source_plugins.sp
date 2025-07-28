#include <sourcemod>
#include <files>
#include <string>

public Plugin myinfo = 
{
    name = "Unload Plugins From File",
    author = "LeandroTheDev",
    description = "Unloads plugins listed in a file at startup",
    version = "1.0",
    url = "https://github.com/LeandroTheDev/unload_source_plugins"
};

public void OnPluginStart()
{
    char path[PLATFORM_MAX_PATH];
    if (!GetCommandLineParam("-unloadFile", path, sizeof(path)))
    {
        PrintToServer("[UnloadFile] Missing -unloadFile parameter.");
        return;
    }

    PrintToServer("[UnloadFile] Reading plugin list from: %s", path);

    File file = OpenFile(path, "r");
    if (file == null)
    {
        PrintToServer("[UnloadFile] Failed to open the file.");
        return;
    }

    char line[256];
    while (!file.EndOfFile() && file.ReadLine(line, sizeof(line)))
    {
        TrimString(line);
        if (line[0] == '\0')
            continue;

        PrintToServer("[UnloadFile] Unloading plugin: %s", line);

        char command[300];
        Format(command, sizeof(command), "sm plugins unload %s", line);
        ServerCommand("%s", command);
    }

    file.Close();
}