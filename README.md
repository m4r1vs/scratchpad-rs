# Yabai Scratchpad
A simple CLI tool that brings scratchpad functionality to the Yabai window manager on macOS. Inspired by the LeftWM scratchpad feature, this app allows you to quickly access and dismiss any application.

## Demo
https://user-images.githubusercontent.com/46302068/177003301-54cf74ad-af72-4297-842e-68ba203c894b.mp4 

## Installation Instruction
* **Step 1:** Clone the repository
* **Step 2:** `cargo build --release`
* **Step 3:** `cp target/release/scratchpad /opt/homebrew/bin/` to copy `scratchpad` to path.
* **Step 4:** Define configuration by creating `$HOME/.config/scratchpad/config.toml`
* **Step 5:** Create SKHD config. eg. `alt - t : scratchpad --toggle telegram`

*Note: Copying binary to `/usr/local/bin` won't work with SKHD*

## Usage
```
scratchpad --toggle {name}
```

## Config Options

| Field            | Description                        | Example                              |Default   |
|------------------|------------------------------------|--------------------------------------|----------|
|`name`            | Name of scratchpad                 | `calculator`                         | N/A      |
|`target_type`     | Type of target                     | {`app`,`title`}                      | `app`    |
|`target`          | Target app name or title           | `Discord`                            | N/A      |
|`position`        | Position where scratchpad shows up | `[290, 175]`                         | N/A      |
|`size`            | Size of scratchpad                 | `[1100, 700]`                        | N/A      |
|`rows` (Optional) | Number of grid rows                | `6`                                  | N/A      |
|`cols` (Optional) | Number of grid columns             | `4`                                  | N/A      |
|`launch_type`     | Type of launch method              | {`app`,`app_with_arg`, `command`}    | `command`|
|`launch_command`  | Command or name of application     | `open -n /Applications/Alacritty.app`| N/A      |

## Configuration Example
```
scratchpad_space = 8
launch_timeout = 5

[[scratchpad]]
name = "telegram"
target_type = "app"
target = "Telegram"
position = [1, 1]
size = [4, 4]
rows = 6
cols = 6
launch_type = "app"
launch_command = "Telegram.app"

[[scratchpad]]
name = "alacritty"
target_type = "title"
target = "AlacrittyScratchpad"
position = [290, 175]
size = [1100, 700]
launch_type = "app_with_arg"
launch_command = ["Alacritty.app", "--title", "AlacrittyScratchpad"]

[[scratchpad]]
name = "discord"
target_type = "app"
target = "Discord"
position = [290, 175]
size = [1100, 700]
launch_type = "app"
launch_command = "Discord.app"
```
