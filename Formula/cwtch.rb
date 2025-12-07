class Cwtch < Formula
  desc "Manage Claude Code profiles and usage"
  homepage "https://github.com/agh/cwtch"
  url "https://github.com/agh/cwtch/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "8acc168a609ac0289be67ed69bd48f49377ead06a95d8306aea5cfa43d24abd5"
  license "MIT"

  depends_on :macos
  depends_on "jq"

  def install
    libexec.install "bin"
    libexec.install "lib"
    bin.install_symlink libexec/"bin/cwtch"
  end

  def caveats
    <<~EOS
      cwtch manages Claude Code profiles and usage.

      Quick start:
        cwtch profile save work    # Save current session
        cwtch profile use personal # Switch profiles
        cwtch status               # Show current profile + usage
        cwtch usage                # Show all profiles usage

      Note: This project is not affiliated with Anthropic PBC.
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/cwtch --help")
  end
end
