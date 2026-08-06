# Authentic RetroArch Displays

A collection of shader presets to emulate various console display mediums authentically in RetroArch.

## Prerequisites & Requirements

1. **Slang Shaders:** Open RetroArch, go to **Main Menu -> Online Updater**, and select **Update Slang Shaders**. (This ensures the underlying shader passes referenced by these presets are present on your system).
2. **Video Driver:** Ensure your RetroArch video driver is set to **Vulkan** (recommended) or another Slang-compatible driver (*Settings -> Drivers -> Video*).

## Installation Instructions

1. Download the shader pack.
2. Extract the folder and place it directly into your RetroArch `shaders` directory. 
   *(Typically located at `RetroArch/shaders/`)*
3. Launch RetroArch, load a game, and open the Quick Menu.
4. Navigate to **Shaders** -> **Load** and select the `.slangp` file corresponding to the console you are currently playing.
5. Ensure **Video -> Scale -> Integer Scale** is set appropriately for your setup if you experience uneven scanlines.

## Included Console Presets

**Home Consoles (NTSC Composite + CRT):**
* Atari 2600
* Nintendo Entertainment System (NES)
* Super Nintendo Entertainment System (SNES)
* Nintendo 64 (N64)
* Sega Master System (Mark III)
* Sega Mega Drive / Genesis
* Sega Mega CD / Sega CD
* Sega 32X
* Sony Playstation

**Handheld Consoles (LCD/Bezel emulation):**
* Atari Lynx
* Nintendo Game Boy
* Nintendo Game Boy Color
* Nintendo Game Boy Advance
* Sega Game Gear

## Technical Notes & Known Limitations

* **PlayStation 1 Dynamic Resolutions:** The PS1 hardware frequently changes horizontal resolutions on the fly. While this pack defaults to a 320px base for the PS1 (which accurately covers standard gameplay in many titles), games that output at 512px natively or menus that switch to higher resolutions may cause the NTSC color burst blending to look slightly less pronounced or misaligned. This is a normal, known limitation of combining static NTSC shader math with dynamic resolution hardware.

## Credits & Acknowledgments

This preset pack relies on the incredible work of the RetroArch shader community. Full credit goes to the original authors of the underlying shader passes:

* **Maister:** For the NTSC composite 2-phase and 3-phase shaders (`ntsc-pass1`, `ntsc-pass2`).
* **Newpixie:** For the CRT accumulation, blur, and `newpixie-crt` base shaders and frame textures.
* **Koko-aio (Koko):** For the exceptional handheld LCD rendering and bezel presets (`Presets_Handhelds-ng`), with ambient light disabled for authentic focus.

## License

This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE) file for details. Underlying shader passes belong to their respective creators under their original open-source licenses.
