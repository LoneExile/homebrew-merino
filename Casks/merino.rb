cask "merino" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  # Updated after each GitHub Release (see merino release workflow / brew bump-cask-pr).
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/LoneExile/merino/releases/download/v#{version}/Merino-#{version}-macos-#{arch}.zip"
  name "Merino"
  desc "Menu bar and phone dashboard for herdr agents"
  homepage "https://github.com/LoneExile/merino"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Merino.app"

  zap trash: [
    "~/Library/Logs/merino",
    "~/Library/Caches/merino",
  ]
end
