
<p align="center">
	<img width="300" alt="SlashOS Banner" src="https://github.com/user-attachments/assets/your-banner-image-link-here" />
</p>

<h1 align="center">💿 SlashOS Live</h1>
<p align="center"><b>The actual build system and process I use to make SlashOS. <br><br>
Based on the <a href="https://gitlab.archlinux.org/archlinux/archiso/-/tree/master/configs/releng">archiso releng profile</a> (the same one used for official Arch ISOs), but with my own twists.</b></p>

<p align="center">
	<a href="#-setup">Setup</a> |
	<a href="#-how-it-works">How It Works</a> |
	<a href="#-workflow">Workflow</a> |
	<a href="#-customization">Customization</a>
</p>

No magic, no black boxes. This is the source and process that bakes the SlashOS ISO from scratch. Not a template, not a framework—just my real build system, warts and all.

## 🚀 What is this?

*   The real SlashOS build system. This is what actually produces the ISO I use and ship.
*   Based on [archiso](https://wiki.archlinux.org/title/archiso), but with all my tweaks, overlays, and structure.
*   Every config, every hook, every overlay—exactly as I use them. Not a demo, not a starter kit.

## 📂 What's Inside

*   `slashoslive/` — Main build root
		*   `airootfs/` — Your live system's root (add configs, overlays, etc)
		*   `packages.x86_64` — List of packages to include
		*   `profiledef.sh` — Main archiso profile config
		*   `efiboot/`, `grub/`, `syslinux/` — Bootloader configs
		*   `bootstrap_packages` — Early packages for the build process
		*   `pacman.conf` — Custom package manager config

## 🛠️ Setup

1.  **Clone this repo**
2.  **Install archiso** (`sudo pacman -S archiso`)
3.  **Tweak your configs** (see below)
4.  **Build your ISO:**
		```sh
		cd slashoslive
		sudo mkarchiso -v .
		```
5.  **Find your ISO in `out/`**

## 🧠 How It Works

1.  **Profile Structure:** All customizations live in `airootfs/` (system root overlay), `packages.x86_64` (package list), and bootloader folders.
2.  **Build:** `mkarchiso` reads `profiledef.sh`, copies overlays, installs packages, and assembles the ISO.
3.  **Boot:** The resulting ISO boots with your configs, services, and packages—ready to use or install.

## 🔄 Workflow

1.  **Edit:** Change files in `airootfs/`, update `packages.x86_64`, or tweak boot configs.
2.  **Build:** Run `mkarchiso` as above.
3.  **Test:** Boot the ISO in a VM or on real hardware.
4.  **Iterate:** Repeat until perfect.

## 🧩 Customization

*   **Add Packages:** Edit `packages.x86_64` (one per line)
*   **Systemd Units:** Drop custom units in `airootfs/etc/systemd/system/`
*   **Hooks/Scripts:** Place in `airootfs/usr/local/bin/` and reference from systemd or profile scripts
*   **Bootloaders:** Edit configs in `efiboot/`, `grub/`, or `syslinux/`
*   **Pacman Config:** Tweak `pacman.conf` for custom repos or options

## 🤝 Contributing

If you spot something weird or have a question, feel free to open an issue, but this is mostly just my own build system.

---
*Just my real build system for SlashOS. Nothing more, nothing less.*