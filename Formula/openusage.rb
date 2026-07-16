# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.2/openusage_0.24.2_darwin_arm64.tar.gz"
      sha256 "e1bf077145cd8afc0d3725ee0526d661696a86964e4cdf6090bb5012f8dac216"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.2/openusage_0.24.2_darwin_amd64.tar.gz"
      sha256 "cd43e8c6763b49d18931a6d8a9277ed1b4c2851e1fc3f8e987e9fda383d508a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.2/openusage_0.24.2_linux_arm64.tar.gz"
      sha256 "56b6d2df203e9caccddb7856c47614451c6c04b84a652037a76d946c1c8adb39"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.2/openusage_0.24.2_linux_amd64.tar.gz"
      sha256 "4e16ce379aa3751cf66892287fc88f02e144a536b3919bea325be87c84129b08"
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
