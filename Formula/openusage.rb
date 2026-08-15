# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.24.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.5/openusage_0.24.5_darwin_arm64.tar.gz"
      sha256 "070acd2ac75f9b5c65d0d3dd1fe5c8065c3700f62b06392f2b1c7d2e369c1afa"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.5/openusage_0.24.5_darwin_amd64.tar.gz"
      sha256 "004445dcd195b560b6a5960e11f846fcb57a972abd802b17bfb62cde4fdbb6bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.5/openusage_0.24.5_linux_arm64.tar.gz"
      sha256 "2550e372cc166e4713fb7fd07d83284b86547431d7580b777de6217619b885c2"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.5/openusage_0.24.5_linux_amd64.tar.gz"
      sha256 "169bfcd0f68305741518a7838177788563309097c84046d888f0307b6f84642b"
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
