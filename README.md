# Unload Source Plugins

A simple SourceMod plugin that reads a list of plugins from a file and unloads them automatically at server startup.

---

## Usage

1. Download the plugin from the latest release:

   [Releases Section](https://github.com/LeandroTheDev/unload_source_plugins/releases)

2. Place the compiled `.smx` file into the following folder on your server: ``addons/sourcemod/plugins/``

3. Create a configuration file listing the plugins you want to unload (one plugin filename per line, including the `.smx` extension). For example in: ``cfg/unload_plugins.cfg``
```
tf2_unecessary1.smx
tf2_unecessary2.smx
```
4. Start your server with the following launch parameter, pointing to your config file: ``-unloadFile "cfg/unload_plugins.cfg"``

5. Full command example: ``srcds -game tf +map ctf_2fort -unloadFile "cfg/unload_plugins.cfg"``

## How it works
The plugins will be disabled after the server start, this is used if you use multiple servers and don't want some plugins to interfere with certain servers

Plugins are still initialized, and then unloaded