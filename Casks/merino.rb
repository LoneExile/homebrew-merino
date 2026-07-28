cask "merino" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/LoneExile/merino/releases/download/v#{version}/Merino-#{version}-macos-arm64.zip"
  name "Merino"
  desc "Menu bar and phone dashboard for herdr agents"
  homepage "https://github.com/LoneExile/merino"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "merino.app"

  zap trash: [
    "~/Library/Logs/merino",
    "~/Library/Caches/merino",
  ]
end
