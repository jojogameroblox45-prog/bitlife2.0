# TarpMind Windows Release Host

This repository builds the TarpMind private-beta Windows installer on a clean GitHub-hosted Windows runner.

The release workflow downloads the prebuilt TarpMind 1.4.2 application payload from `tarpmind.com`, verifies its fixed SHA-256, packages it into a standard per-user NSIS installer, calculates the installer checksum, and publishes both files as the `v1.4.2` GitHub Release.

The installer contains the application payload. It does not download or execute PowerShell scripts at install time.
