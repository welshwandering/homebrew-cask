class Cwtch < Formula
  desc "Manage Claude Code profiles and sync configuration from Git"
  homepage "https://github.com/welshwandering/cwtch"
  # renovate: datasource=github-releases depName=welshwandering/cwtch
  url "https://github.com/welshwandering/cwtch/archive/refs/tags/v5.3.0.tar.gz"
  sha256 "fdcb6773b7e08672a7a8d7980b66086effd3e3a90b6129056d0b1a56fd0d313f"
  license "MIT"

  depends_on :macos
  depends_on "jq"
  depends_on "yq"

  def install
    libexec.install "bin"
    libexec.install "lib"
    libexec.install "VERSION"
    bin.install_symlink libexec/"bin/cwtch"
  end

  def caveats
    <<~EOS
      cwtch manages Claude Code profiles and syncs configuration from Git.

      Quick start:
        cwtch profile save work    # Save current session
        cwtch profile use personal # Switch profiles
        cwtch sync init            # Create Cwtchfile
        cwtch sync                 # Sync configuration from Git

      Note: This project is not affiliated with Anthropic PBC.
    EOS
  end

  test do
    assert_match "cwtch", shell_output("#{bin}/cwtch --help")
  end
end
