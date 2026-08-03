# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.3/openusage_0.24.3_darwin_arm64.tar.gz"
      sha256 "3f9ff60ec18b19dc0d1f5b8fe80fd31335020dcbc12b11abd7c16f51be971660"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.3/openusage_0.24.3_darwin_amd64.tar.gz"
      sha256 "ccddf939c6c8815491903e84e8328523345b9a3fbeba83b1282c27ee0065a5fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.3/openusage_0.24.3_linux_arm64.tar.gz"
      sha256 "e37171a8fd4ab0309631329906a8ea4ba850f6833db2fc4bb653d495e7b70049"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.3/openusage_0.24.3_linux_amd64.tar.gz"
      sha256 "5259ef8f6372bbc0ab6da69c519ade0afa54c33390f8eb216511861a5bfa8d9f"
    end
  end

  def install
    bin.install "openusage"
  end

  def caveats
    <<~EOS
      Homebrew 6.0+ requires third-party taps to be trusted. A trust grant
      only covers the formula version it was made for, so each `brew update`
      that bumps openusage can leave the keg installed-but-unlinked
      ("command not found" until you run `brew link`).

      Trust the whole tap once to keep openusage linked across upgrades:

        brew trust achappell/tap

      See https://docs.brew.sh/Tap-Trust for details.
    EOS
  end

  test do
    assert_match "openusage", shell_output("#{bin}/openusage --version 2>&1", 0)
  end
end
