class ClaudeSwitch < Formula
  desc "Switch between Claude Code accounts"
  homepage "https://github.com/agh/claude-utils"
  url "https://github.com/agh/claude-utils/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "228c48a9011a7624a66e145fd4cae1aea8b8fe8dc9fcca3537bb53858b1d02ef"
  license "MIT"

  depends_on :macos
  depends_on "jq"

  def install
    libexec.install "scripts"
    libexec.install "lib"
    bin.install_symlink libexec/"scripts/claude-switch.sh" => "claude-switch"
  end

  def caveats
    <<~EOS
      New in v2.1.0: Use `claude-switch status` to view usage for all accounts.

      Upgrading from v1.x? Re-save each account:
        claude-switch save <account-name>
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/claude-switch --help")
  end
end
