class Cwtch < Formula
  desc "Manage Claude Code profiles and usage"
  homepage "https://github.com/agh/cwtch"
  url "https://github.com/agh/cwtch/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "b2debd95c0389e23a71ce5d81d2941d1f2072f4c00b85e6ac3c7da0fa23281fe"
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
