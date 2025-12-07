class Cwtch < Formula
  desc "Manage Claude Code profiles and usage"
  homepage "https://github.com/agh/cwtch"
  # renovate: datasource=github-releases depName=agh/cwtch
  url "https://github.com/agh/cwtch/archive/refs/tags/v4.0.4tar.gz"
  sha256 "9cef011da66f5de4224e04a264be7292e32ecd39a4b4319caf0dc7a01a0c0f09"
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
