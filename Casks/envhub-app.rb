# Activate after distributing the app (Xcode → Organizer → Direct Distribution, or
# scripts/release.sh) and uploading EnvHub-<version>.zip to the GitHub release —
# then replace the sha256 below with that zip's hash (`shasum -a 256 EnvHub-0.2.0.zip`).
cask "envhub-app" do
  version "0.2.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/cs4alhaider/EnvHub/releases/download/v#{version}/EnvHub-#{version}.zip"
  name "EnvHub"
  desc "Every .env file on your machine, in one window"
  homepage "https://github.com/cs4alhaider/EnvHub"

  # Installing the app also installs the matching CLI.
  depends_on formula: "cs4alhaider/tap/envhub"
  depends_on macos: ">= :tahoe"

  app "EnvHub.app"

  zap trash: [
    "~/Library/Application Support/EnvHub",
    "~/Library/Preferences/net.alhaider.EnvHub.plist",
  ]
end
