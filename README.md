# homebrew-merino

Homebrew tap for [Merino](https://github.com/LoneExile/merino) — menu bar + phone dashboard for [herdr](https://herdr.dev) agents.

```bash
brew tap LoneExile/merino
brew trust LoneExile/merino
brew install --cask --no-quarantine merino
```

Prefer the project one-liner (no tap trust step):

```bash
curl -fsSL https://raw.githubusercontent.com/LoneExile/merino/main/scripts/install.sh | bash
```

## Trust (Homebrew third-party taps)

Newer Homebrew may require:

```bash
brew trust LoneExile/merino
brew install --cask --no-quarantine merino
```

## Gatekeeper

Release builds are **ad-hoc signed** (no Apple Developer ID / notarization yet).  
`--no-quarantine` keeps Homebrew from tagging the download; the cask `postflight` also runs `xattr` to clear `com.apple.quarantine` if present.
