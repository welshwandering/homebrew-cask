class Cwtch < Formula
  desc "Manage Claude Code profiles and usage"
  homepage "https://github.com/agh/cwtch"
  url "https://github.com/agh/cwtch/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "4cd057b459b75dfb092d6a998cb78a93db9f02b1a56326d524843baf02235f0e"
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
