
<h1 align="center">💿 SlashOS Live</h1>
<p align="center"><b>The actual build system and process I use to make SlashOS. <br><br>
Based on the <a href="https://gitlab.archlinux.org/archlinux/archiso/-/tree/master/configs/releng">archiso releng profile</a> (the same one used for official Arch ISOs), but with my own twists.</b></p>

<p align="center">
	<a href="#-setup">Setup</a> |
	<a href="#-how-it-works">How It Works</a> |
	<a href="#-workflow">Workflow</a> |
	<a href="#-customization">Customization</a>
</p>

This is the source and process that bakes the SlashOS ISO from scratch.

## 🚀 What is this?

*   The real SlashOS build system. This is what actually produces the ISO I use and ship.
*   Uses [archiso](https://wiki.archlinux.org/title/archiso), for easy customization and building.
*   Releng profile base, with my own packages, configs, and tweaks.

## 📂 What's Inside

*   `slashoslive/` — Main build root
		*   `airootfs/` — Your live system's root (/etc customizations)
		*   `packages.x86_64` — List of packages to include to the ISO
		*   `profiledef.sh` — Main archiso profile config
		*   `efiboot/`, `grub/`, `syslinux/` — Bootloader configs
		*   `pacman.conf` — Custom package repo config (also in `airootfs/etc/pacman.conf`)
		*	Systemctl services to enable on boot for SlashOS experience

## 🛠️ Setup

1.  **Clone this repo**
2.  **Install archiso** (`sudo pacman -S archiso`)
3.  **Build your ISO:**
		```sh
		cd slashoslive
		sudo mkarchiso -v -r -w work -o out slashoslive
		```
4.  **Find your ISO in `out/`**

## 🧠 How It Works

Custom configs and carefully chosen packages work together with automatic systemctl services to deliver the full SlashOS experience.

## 🔄 Workflow

1.  **Edit:** Change files in `airootfs/`, update `packages.x86_64`, or tweak boot configs.
2.  **Build:** Run `mkarchiso` as above.
3.  **Test:** Boot the ISO in a VM or on real hardware.
4.  **Iterate:** Repeat until perfect.

## 🤝 Contributing

If you spot something weird or have a question, feel free to open an issue, or even a PR if you have improvements!

---
*Just THE build system for SlashOS. Nothing more, nothing less.*
