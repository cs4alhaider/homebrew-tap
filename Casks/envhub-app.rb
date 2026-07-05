# NOTE: activate this after running scripts/release.sh in the EnvHub repo and
# uploading EnvHub-<version>.zip to the release — then replace the sha256 below
# with the value the script prints for the app zip.
cask "envhub-app" do
  version "0.2.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/cs4alhaider/EnvHub/releases/download/v#{version}/EnvHub-#{version}.zip"
  name "EnvHub"
  desc "Every .env file on your machine, in one window"
  homepage "https://github.com/cs4alhaider/EnvHub"

  depends_on macos: ">= :tahoe"

  app "EnvHub.app"
  # The app bundles the CLI; symlink it onto PATH so `brew install --cask` gives both.
  binary "#{appdir}/EnvHub.app/Contents/Helpers/envhub"

  zap trash: [
    "~/Library/Application Support/EnvHub",
    "~/Library/Preferences/net.alhaider.EnvHub.plist",
  ]
end
