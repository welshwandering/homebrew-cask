class ClaudeSwitch < Formula
  desc "Switch between Claude Code accounts"
  homepage "https://github.com/agh/claude"
  url "https://github.com/agh/claude/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4154ee98baaeae8ec37a1a99d16dbf19873690d3a9246f7423e05c6971d6273e"
  license "MIT"

  def install
    bin.install "scripts/claude-switch.sh" => "claude-switch"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/claude-switch --help")
  end
end
