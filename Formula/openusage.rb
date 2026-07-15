# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://github.com/achappell/openusage"
  version "0.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.1/openusage_0.24.1_darwin_arm64.tar.gz"
      sha256 "8ac29ffd77c7359160d6ba88e70dee97183abb3b07e0356260ac63087af129c2"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.1/openusage_0.24.1_darwin_amd64.tar.gz"
      sha256 "b4b4d8cb54af8c01b04de105d1101e4b950247ccd2c2a8951801bf618ad2768a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.1/openusage_0.24.1_linux_arm64.tar.gz"
      sha256 "3fa714cd69a3908337185b061b19892476a420f54699e277e3fe5d59cc64de29"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.1/openusage_0.24.1_linux_amd64.tar.gz"
      sha256 "690877e04a35fc2f752f265c1dd83ca117557ac6f2dcdbab74b439a4664bebdc"
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
