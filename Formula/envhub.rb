class Envhub < Formula
  desc "Discover and manage every .env file on your machine"
  homepage "https://github.com/cs4alhaider/EnvHub"
  url "https://github.com/cs4alhaider/EnvHub/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "37367431a9665fd53445e813111818ce103252f62b3f0d8f8fdfd6895d68cff4"
  license "GPL-3.0-only"
  head "https://github.com/cs4alhaider/EnvHub.git", branch: "main"

  depends_on macos: :tahoe
  depends_on xcode: ["26.0", :build]

  def install
    system "swift", "build", "-c", "release", "--product", "envhub", "--disable-sandbox"
    bin.install ".build/release/envhub"
  end

  test do
    assert_match "Discover and manage", shell_output("#{bin}/envhub --help")
    (testpath/".env").write("API_KEY=secret\n")
    assert_match ".env", shell_output("#{bin}/envhub scan #{testpath}")
  end
end
