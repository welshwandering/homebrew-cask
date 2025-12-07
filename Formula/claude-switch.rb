class ClaudeSwitch < Formula
  desc "Switch between Claude Code accounts"
  homepage "https://github.com/agh/claude-utils"
  url "https://github.com/agh/claude-utils/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "badd80acf85fc8a1cee3366b860bf8ed4a89f2123c174f13379da862872c561e"
  license "MIT"

  depends_on :macos

  def install
    bin.install "scripts/claude-switch.sh" => "claude-switch"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/claude-switch --help")
  end
end
