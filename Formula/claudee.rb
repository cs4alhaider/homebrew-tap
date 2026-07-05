class Claudee < Formula
  desc "Interactive terminal launcher for Claude Code"
  homepage "https://github.com/cs4alhaider/claudee"
  url "https://github.com/cs4alhaider/claudee/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "de5b7ccc9b8af7ce46c6decbc6a152aafcb648a31619c3a72c8380ae6f0c7fb0"
  license "Apache-2.0"
  head "https://github.com/cs4alhaider/claudee.git", branch: "main"

  depends_on "node"

  def install
    # Zero-dependency script: ship bin/ + lib/ and link the entry point.
    # bin/claudee requires ../lib, so it must live next to lib inside libexec.
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/claudee"
  end

  test do
    # Exercise the arg builder without needing the `claude` CLI or a TTY.
    assert_equal "--dangerously-skip-permissions",
                 shell_output("CLAUDEE_TEST='{\"skip\":\"yes\"}' #{bin}/claudee").strip
  end
end
