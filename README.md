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
* Atari 5200
* Atari 7800
* Nintendo Entertainment System (Famicom)
* Super Nintendo Entertainment System (Super Famicom)
* Nintendo 64
* Sega Master System (Sega Mark III)
* Sega Genesis (Mega Drive)
* Sega CD (Mega-CD)
* Sega 32X
* Sega Saturn
* Sony PlayStation
* The 3DO Interactive Multiplayer

**Home Consoles (CRT only, no NTSC composite pass):**

* Nintendo GameCube
* Sega Dreamcast
* Sony PlayStation 2

**Handheld Consoles (LCD/Bezel emulation):**

* Atari Lynx
* Nintendo Game Boy
* Nintendo Game Boy Color
* Nintendo Game Boy Advance
* Nintendo DS
* Nintendo 3DS
* Sega Game Gear
* Sony PlayStation Portable

## Technical Notes & Known Limitations

* **PlayStation 1 Dynamic Resolutions:** The PS1 hardware frequently changes horizontal resolutions on the fly. While this pack defaults to a 320px base for the PS1 (which accurately covers standard gameplay in many titles), games that output at 512px natively or menus that switch to higher resolutions may cause the NTSC color burst blending to look slightly less pronounced or misaligned. This is a normal, known limitation of combining static NTSC shader math with dynamic resolution hardware.
* **Atari 2600 Composite Accuracy:** The Atari 2600's TIA chip generates video with its color clock running at *exactly* the NTSC color subcarrier frequency (3.579545 MHz) — a 1:1 ratio. This is different from the NES/SNES, whose pixel clock runs at 1.5x the subcarrier, which is the relationship the "3-phase" composite math in this pack is actually built around. The TIA's native visible resolution is also 160px wide, not 256px. This pack currently reuses the NES-style `NTSC-256 + CRT` preset for the 2600, as the closest available approximation (and in line with common community practice), but it is **not** a phase-accurate simulation of real TIA hardware — expect an authentic-*feeling* NTSC composite look (blur, color bleed, artifacting) rather than a precise match to how a real 2600 renders. A dedicated 160px preset built around the TIA's 1:1 clock ratio would be needed for true accuracy. Contributions welcome.

## Credits & Acknowledgments

This preset pack relies on the incredible work of the RetroArch shader community. Full credit goes to the original authors of the underlying shader passes:

* **Maister:** For the NTSC composite 2-phase and 3-phase shaders (`ntsc-pass1`, `ntsc-pass2`).
* **Newpixie:** For the CRT accumulation, blur, and `newpixie-crt` base shaders and frame textures.
* **hunterk / Pokefan531:** For the Color Mangler shader base, heavily modified here to replicate the passive-matrix LCD colorspaces for the custom Atari Lynx and Sega Game Gear presets.
* **Koko-aio (Koko):** For the exceptional handheld LCD rendering and bezel presets (`Presets_Handhelds-ng`), used for select legacy handheld presets like the Game Boy and PSP, with ambient light disabled for authentic focus.
* **cgwg:** For the `lcd-grid-v2` subpixel/LCD grid shader, utilized heavily across the Game Boy Advance, Game Boy Color, Atari Lynx, Sega Game Gear, Nintendo DS, and Nintendo 3DS presets.

## License

This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE) file for details. Underlying shader passes belong to their respective creators under their original open-source licenses.
