cask "merino" do
  version "0.1.0"
  sha256 "f74fbc11c28efb003138685c70072169dc5ab56b507d9d829224e38fd49e9aed"

  url "https://github.com/LoneExile/merino/releases/download/v#{version}/Merino-#{version}-macos-arm64.zip"
  name "Merino"
  desc "Menu bar and phone dashboard for herdr agents"
  homepage "https://github.com/LoneExile/merino"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey
  depends_on arch: :arm64

  # Zip ships merino.app (APFS case-insensitive packaging); install as Merino.app.
  app "merino.app", target: "Merino.app"

  # Ad-hoc signed only — strip download quarantine so Gatekeeper does not block launch.
  # Users should still prefer: brew install --cask --no-quarantine merino
  postflight do
    app_path = "#{appdir}/Merino.app"
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path], must_succeed: false
    system_command "/usr/bin/xattr", args: ["-cr", app_path], must_succeed: false
  end

  zap trash: [
    "~/Library/Logs/merino",
    "~/Library/Caches/merino",
  ]

  caveats <<~EOS
    Merino is ad-hoc signed (not Apple notarized yet).
    Prefer:  brew install --cask --no-quarantine merino
    If macOS still blocks first launch:
      System Settings → Privacy & Security → Open Anyway
    Or right-click Merino.app → Open.
  EOS
end
